-- miniProject_db

DROP DATABASE IF EXISTS miniProject_db;
CREATE DATABASE miniProject_db
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE miniProject_db;

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  status ENUM('active', 'suspended') DEFAULT "active",
  created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE message_log (
  message_id INT PRIMARY KEY AUTO_INCREMENT,
  sender_id INT NOT NULL,
  content TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE user_sessions (
  session_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  login_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  logout_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  ip_address VARCHAR(45) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- SELECT *FROM users;
-- SELECT *FROM message_log;
-- SELECT *FROM user_sessions;