<?php

if (!class_exists('Media_Player')) {
    class Media_Player {

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
            add_action('init', [self::class, 'register_custom_post_types']);
            add_action('wp_enqueue_scripts', [self::class, 'enqueue_scripts']);
        }

        // Register custom post types
        public static function register_custom_post_types() {
            // Register Playlists post type
            register_post_type('playlist', [
                'label' => 'Playlists',
                'public' => true,
                'supports' => ['title', 'editor', 'author'],
                'menu_icon' => 'dashicons-playlist-video',
            ]);

            // Register Frames post type
            register_post_type('frame', [
                'label' => 'Frames',
                'public' => true,
                'supports' => ['title', 'editor', 'author'],
                'menu_icon' => 'dashicons-format-video',
            ]);
        }

        // Enqueue scripts and styles
        public static function enqueue_scripts() {
            wp_enqueue_style('media-player-style', MEDIA_PLAYER_URL . 'assets/css/style.css', [], MEDIA_PLAYER_VERSION);
            wp_enqueue_script('media-player-script', MEDIA_PLAYER_URL . 'assets/js/media-player.js', ['jquery'], MEDIA_PLAYER_VERSION, true);
        }
    }
}

?>
