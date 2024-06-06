<?php

if (!class_exists('My_Plugin')) {
    class My_Plugin {

        // Initialize the plugin
        public static function init() {
            self::define_constants();
            self::load_dependencies();
            self::register_hooks();
        }

        // Define plugin constants
        private static function define_constants() {
            // Define additional constants here
        }

        // Load required files
        private static function load_dependencies() {
            // Load additional required files here
        }

        // Register hooks and filters
        private static function register_hooks() {
            add_action('wp_enqueue_scripts', [self::class, 'enqueue_scripts']);
            // Add other hooks and filters here
        }

        // Enqueue scripts and styles
        public static function enqueue_scripts() {
            wp_enqueue_style('my-plugin-style', MY_PLUGIN_URL . 'assets/css/style.css', [], MY_PLUGIN_VERSION);
            wp_enqueue_script('my-plugin-script', MY_PLUGIN_URL . 'assets/js/script.js', ['jquery'], MY_PLUGIN_VERSION, true);
        }
    }
}

// Register hooks and filters
private static function register_hooks() {
    add_action('wp_enqueue_scripts', [self::class, 'enqueue_scripts']);
    add_shortcode('my_custom_shortcode', [self::class, 'display_custom_message']);
}

// Shortcode callback function
public static function display_custom_message($atts) {
    return '<p>This is a custom message from My Plugin.</p>';
}

?>