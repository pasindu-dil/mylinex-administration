-- Add landing_page column to users table

ALTER TABLE users ADD COLUMN landing_page VARCHAR(64) AFTER remember_token;

-- Add login_attempts column to users table

ALTER TABLE users ADD COLUMN login_attempts TINYINT DEFAULT 0 AFTER remember_token;

-- Add event column to activity_log table

ALTER TABLE activity_log ADD COLUMN event VARCHAR(255) AFTER subject_type;

-- Add batch_uuid column to activity_log table

ALTER TABLE activity_log ADD COLUMN batch_uuid BINARY(16) AFTER properties;

-- Add type column to menu table

ALTER TABLE menu ADD COLUMN type VARCHAR(100) NOT NULL DEFAULT 'ALL' AFTER parent_id;


ALTER TABLE `users` ADD `password_changed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `last_login`;

CREATE TABLE `password_histories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `password_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;