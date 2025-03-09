-- ------------------------------------------
-- Procedure to get customer policy summary
-- ------------------------------------------
DELIMITER //
CREATE PROCEDURE `sp_get_customer_policy_summary`(
  IN p_customer_id INT
)
BEGIN
  SELECT 
    p.policy_number,
    ip.product_name,
    pc.category_name AS product_category,
    p.sum_insured,
    p.premium,
    p.commission_amount,
    p.start_date,
    p.expiry_date,
    ps.status_name
  FROM policies p
  JOIN insurance_products ip ON p.product_id = ip.product_id
  JOIN product_categories pc ON ip.category_id = pc.category_id
  JOIN policy_statuses ps ON p.status_id = ps.status_id
  WHERE p.customer_id = p_customer_id
  ORDER BY p.start_date DESC;
END//
DELIMITER ;
