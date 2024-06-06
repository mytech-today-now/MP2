<?php

if (!class_exists('Playlist')) {
    class Playlist {

        public static function init() {
            add_action('add_meta_boxes', [self::class, 'add_meta_boxes']);
            add_action('save_post', [self::class, 'save_meta_boxes']);
        }

        public static function add_meta_boxes() {
            add_meta_box('playlist_frames', 'Playlist Frames', [self::class, 'render_frames_meta_box'], 'playlist', 'normal', 'high');
        }

        public static function render_frames_meta_box($post) {
            // Render the frames selection and settings for the playlist
        }

        public static function save_meta_boxes($post_id) {
            // Save the frames and their settings for the playlist
        }
    }

    Playlist::init();
}

?>
