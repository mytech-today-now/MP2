# Use the official WordPress image with PHPUnit
FROM wordpressdevelop/phpunit

# Set the working directory
WORKDIR /var/www/html

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Download and configure WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the plugin files to the WordPress plugins directory
COPY ./plugin /var/www/html/wp-content/plugins/plugin

# Copy wait-for-it script
COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh

# Make the wait-for-it script executable
RUN chmod +x /usr/local/bin/wait-for-it.sh

# Ensure the uploads directory exists
RUN mkdir -p /var/www/html/wp-content/uploads \
    && chown -R www-data:www-data /var/www/html/wp-content/uploads

# Download WordPress core files
RUN wp core download --allow-root

# Wait for MySQL to be ready and then configure WordPress
RUN /usr/local/bin/wait-for-it.sh mysql:3306 -- wp config create --dbname=wordpress --dbuser=root --dbpass=root --dbhost=mysql --allow-root

# Install WordPress
RUN wp core install --url=localhost --title="WordPress Test" --admin_user=admin --admin_password=admin --admin_email=admin@example.com --allow-root

# Activate the plugin
RUN wp plugin activate plugin --allow-root

# Expose the port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
