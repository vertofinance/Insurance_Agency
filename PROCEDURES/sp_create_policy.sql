-- -----------------------------------------------------
-- Procedure to create a new policy
-- -----------------------------------------------------
DELIMITER //
CREATE PROCEDURE `sp_create_policy`(
  IN p_customer_id INT,
  IN p_product_id INT,
  IN p_sum_insured DECIMAL(15,2),
  IN p_premium DECIMAL(15,2),
  IN p_issue_date DATE,
  IN p_start_date DATE,
  IN p_expiry_date DATE,
  IN p_created_by INT,
  OUT p_policy_id INT
)
BEGIN
  DECLARE v_commission_rate DECIMAL(5,2);
  DECLARE v_policy_number VARCHAR(50);
  
  -- Calculate commission
  SELECT commission_rate INTO v_commission_rate 
  FROM insurance_products 
  WHERE product_id = p_product_id;
  
  -- Generate policy number (example format)
  SET v_policy_number = CONCAT('POL', DATE_FORMAT(NOW(), '%Y%m%d'), LPAD(LAST_INSERT_ID(), 6, '0'));
  
  -- Insert policy
  INSERT INTO `policies` (
    `policy_number`,
    `customer_id`,
    `product_id`,
    `sum_insured`,
    `premium`,
    `commission_amount`,
    `issue_date`,
    `start_date`,
    `expiry_date`,
    `status_id`,
    `created_by`
  ) VALUES (
    v_policy_number,
    p_customer_id,
    p_product_id,
    p_sum_insured,
    p_premium,
    (p_premium * v_commission_rate / 100),
    p_issue_date,
    p_start_date,
    p_expiry_date,
    (SELECT status_id FROM policy_statuses WHERE status_name = 'Pending'),
    p_created_by
  );
  
  SET p_policy_id = LAST_INSERT_ID();
END//
DELIMITER ;
