## total claims per state

SELECT claimants.state, COUNT(claims.claim_id) AS total_claims
FROM claims
  JOIN claimants ON claimants.claimant_id = claims.claimant_id
GROUP BY claimants.state
ORDER BY total_claims DESC;

> total payments issued per claim <

SELECT payments.claim_id, SUM(payments.payment_amount) AS total_paid
FROM payments
GROUP BY payments.claim_id;

> total claims per policy type <

SELECT policies.policy_type, COUNT(claims.claim_id) AS total_claims
FROM claims
  JOIN policies ON policies.policy_id = claims.policy_id
GROUP BY policies.policy_type;

> average reserve amount per claim status <

SELECT claims.claim_status, AVG(claims.reserve_amount) AS average_reserve
FROM claims
GROUP BY claims.claim_status;

> total payments grouped by payment status <

SELECT payments.payment_status, SUM(payments.payment_amount) AS total_payments
FROM payments
GROUP BY payments.payment_status;
