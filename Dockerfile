# Use the official WordPress image with PHPUnit
FROM wordpressdevelop/phpunit

# Set the working directory
WORKDIR /var/www/html

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and configure WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the plugin files to the WordPress plugins directory
COPY ./plugin /var/www/html/wp-content/plugins/plugin

# Install and activate the plugin using WP CLI
RUN wp core download --allow-root \
    && wp config create --dbname=wordpress --dbuser=root --dbpass=root --dbhost=mysql --allow-root \
    && wp core install --url=localhost --title="WordPress Test" --admin_user=admin --admin_password=admin --admin_email=admin@example.com --allow-root \
    && wp plugin activate plugin --allow-root

# Expose the port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
