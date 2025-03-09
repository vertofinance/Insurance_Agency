-- -------------------------------------------
-- Function to calculate remaining policy days
-- -------------------------------------------
DELIMITER //
CREATE FUNCTION `fn_get_policy_remaining_days`(
  p_policy_id INT
) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_remaining_days INT;
  SELECT DATEDIFF(expiry_date, CURRENT_DATE) INTO v_remaining_days
  FROM policies
  WHERE policy_id = p_policy_id;
  
  RETURN IF(v_remaining_days < 0, 0, v_remaining_days);
END//
DELIMITER ;
