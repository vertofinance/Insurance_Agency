-- -----------------------------------------------------
-- Additional Indexes for Performance
-- -----------------------------------------------------
CREATE INDEX `idx_policies_customer_date` ON `policies` (`customer_id`, `start_date`);
CREATE INDEX `idx_claims_policy_date` ON `claims` (`policy_id`, `filing_date`);
CREATE INDEX `idx_transactions_policy_date` ON `transactions` (`policy_id`, `transaction_date`);
