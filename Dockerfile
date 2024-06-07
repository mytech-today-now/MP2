# Use the official WordPress image with PHPUnit
FROM wordpressdevelop/phpunit

# Set the working directory
WORKDIR /var/www/html

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*  \
    && echo "Installed necessary dependencies"

# Download and configure WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && echo "WP-CLI successfully installed."

# Set permissions and copy the plugin files to the WordPress plugins directory
COPY ./plugin /var/www/html/wp-content/plugins/plugin
RUN chmod -R 777 /var/www/html/wp-content/plugins/plugin \
    && echo "Plugin successfully copied."

# Copy wait-for-it script
COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh \
&& echo "wait-for-it.sh successfully copied to /usr/local/bin/wait-for-it.sh."

# Make the wait-for-it script executable
RUN chmod +x /usr/local/bin/wait-for-it.sh \
&& echo "chmod +x /usr/local/bin/wait-for-it.sh"

# Ensure the uploads directory exists
RUN mkdir -p /var/www/html/wp-content/uploads \
    && chown -R www-data:www-data /var/www/html/wp-content/uploads \
    && echo "Ensure the uploads directory exists"

# Download WordPress core files
RUN wp core download --allow-root \
&& echo "Download WordPress core files"

# Wait for MySQL to be ready and then configure WordPress with error handling
RUN /usr/local/bin/wait-for-it.sh mysql:8080 --timeout=120 --strict -- \
    wp config create --dbname=wordpress --dbuser=root --dbpass=root --dbhost=mysql --allow-root || { echo 'MySQL not available, exiting'; exit 1; } \
    && echo "Wait for MySQL to be ready and then configure WordPress with error handling"

# Install WordPress
RUN wp core install --url=localhost --title="WordPress Test" --admin_user=admin --admin_password=admin --admin_email=admin@example.com --allow-root \
&& echo "Installed WordPress."

# Activate the plugin
RUN wp plugin activate plugin --allow-root \
&& echo "Activated the plugin."

# Expose the port 80
EXPOSE 8080

# Start the Apache server
CMD ["apache2-foreground"]
