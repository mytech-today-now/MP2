<?php

if (!class_exists('Frame')) {
    class Frame {

        public static function init() {
            add_action('add_meta_boxes', [self::class, 'add_meta_boxes']);
            add_action('save_post', [self::class, 'save_meta_boxes']);
        }

        public static function add_meta_boxes() {
            add_meta_box('frame_settings', 'Frame Settings', [self::class, 'render_settings_meta_box'], 'frame', 'normal', 'high');
        }

        public static function render_settings_meta_box($post) {
            // Render the settings for the frame
        }

        public static function save_meta_boxes($post_id) {
            // Save the settings for the frame
        }
    }

    Frame::init();
}

?>
