-- --------------------------------------------
-- Function to get total commissions for a user
-- --------------------------------------------
DELIMITER //
CREATE FUNCTION `fn_get_user_total_commissions`(
  p_user_id INT,
  p_start_date DATE,
  p_end_date DATE
) RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
  DECLARE v_total DECIMAL(15,2);
  SELECT SUM(commission_amount) INTO v_total
  FROM policies
  WHERE created_by = p_user_id
  AND issue_date BETWEEN p_start_date AND p_end_date;
  
  RETURN IFNULL(v_total, 0);
END//
DELIMITER ;
