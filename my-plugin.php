<?php
/**
 * Plugin Name: My Custom Plugin
 * Description: A brief description of what the plugin does.
 * Version: 1.0
 * Author: Your Name
 * License: GPL2
 */

// Prevent direct access to the file
if (!defined('ABSPATH')) {
    exit;
}

// Define plugin constants
define('MY_PLUGIN_VERSION', '1.0');
define('MY_PLUGIN_DIR', plugin_dir_path(__FILE__));
define('MY_PLUGIN_URL', plugin_dir_url(__FILE__));

// Include necessary files
require_once(MY_PLUGIN_DIR . 'includes/class-my-plugin.php');

// Initialize the plugin
add_action('plugins_loaded', ['My_Plugin', 'init']);
?>
