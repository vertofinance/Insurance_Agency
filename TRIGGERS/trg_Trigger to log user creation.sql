-- Trigger to log user creation
DELIMITER //
CREATE TRIGGER `trg_users_after_insert`
AFTER INSERT ON `users`
FOR EACH ROW
BEGIN
  INSERT INTO `system_logs` (
    `user_id`, 
    `log_type`, 
    `activity`, 
    `description`
  ) VALUES (
    NEW.user_id,
    'SECURITY',
    'User Created',
    CONCAT('New user created: ', NEW.username, ' by ', NEW.created_by)
  );
END//
DELIMITER ;

