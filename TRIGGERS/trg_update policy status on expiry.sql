-- Trigger to update policy status on expiry
DELIMITER //
CREATE TRIGGER `trg_policies_before_update`
BEFORE UPDATE ON `policies`
FOR EACH ROW
BEGIN
  IF NEW.expiry_date < CURRENT_DATE AND OLD.status_id != NEW.status_id THEN
    SET NEW.status_id = (SELECT status_id FROM policy_statuses WHERE status_name = 'Expired');
  END IF;
END//
DELIMITER ;