# MP2 WordPress Plugin

## Description

MP2 is a custom WordPress plugin developed as part of a Dockerized WordPress instance with PHPUnit testing capabilities. This project aims to demonstrate best practices in WordPress plugin development, Docker containerization, and automated testing.

## Features

The following features have been implemented in the MP2 WordPress Plugin:

1. Custom Post Type: Events (File: `mp2-plugin/includes/class-mp2-post-types.php`)
   - Registers a new 'Events' post type with custom fields

2. Shortcode: Display Events (File: `mp2-plugin/includes/class-mp2-shortcodes.php`)
   - `[mp2_events]` shortcode to display a list of events on any page or post

3. Widget: Upcoming Events (File: `mp2-plugin/includes/class-mp2-widgets.php`)
   - Adds a widget to display upcoming events in the sidebar

4. Admin Settings Page (File: `mp2-plugin/admin/class-mp2-admin.php`)
   - Configurable options for the plugin in the WordPress admin area

5. Custom REST API Endpoint (File: `mp2-plugin/includes/class-mp2-rest-api.php`)
   - Exposes event data through a custom REST API endpoint

6. Gutenberg Block: Event Display (File: `mp2-plugin/src/blocks/event-display/index.js`)
   - Custom Gutenberg block for displaying events with various options

7. Internationalization Support (Files: `mp2-plugin/languages/`)
   - Plugin strings are translatable and ready for localization

8. Unit Tests (Directory: `mp2-plugin/tests/`)
   - PHPUnit tests for core plugin functionality

## Prerequisites

- Docker
- Docker Compose

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/mytech-today-now/MP2.git
   cd MP2
   ```

2. Launch Docker Desktop

3. Start the Docker containers:
   ```sh
   docker-compose up --build
   ```

4. Access WordPress at `http://localhost:8000`

## Usage

1. Activate the MP2 plugin from the WordPress admin plugins page.
2. Use the shortcode `[mp2_events]` in your posts or pages to display events.
3. Add the Upcoming Events widget to your sidebar from the Widgets admin page.
4. Use the custom Gutenberg block "Event Display" when editing pages or posts.
5. Configure plugin settings from the MP2 Settings page in the admin area.

## Development

### Running Tests

To run the PHPUnit tests:

1. Ensure the Docker containers are running
2. Execute the following command:
   ```sh
   docker-compose exec wordpress vendor/bin/phpunit
   ```

### Making Changes

1. Make your changes to the plugin code
2. Rebuild the Docker containers:
   ```sh
   docker-compose up --build
   ```

## Stopping the Environment

To stop and remove the Docker containers and network:

