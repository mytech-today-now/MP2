<?php
/**
 * Plugin Name: Media Player Plugin
 * Description: A media player plugin that allows creation and management of playlists with various media items.
 * Version: 1.0
 * Author: myTech.Today (https://github.com/mytech-today-now/)
 */

// Prevent direct access to the file
if (!defined('ABSPATH')) {
    exit;
}

// Define plugin constants
define('MEDIA_PLAYER_VERSION', '1.0');
define('MEDIA_PLAYER_DIR', plugin_dir_path(__FILE__));
define('MEDIA_PLAYER_URL', plugin_dir_url(__FILE__));

// Include necessary files
require_once(MEDIA_PLAYER_DIR . 'includes/class-media-player.php');
require_once(MEDIA_PLAYER_DIR . 'includes/class-playlist.php');
require_once(MEDIA_PLAYER_DIR . 'includes/class-frame.php');

// Initialize the plugin
add_action('plugins_loaded', ['Media_Player', 'init']);
?>
