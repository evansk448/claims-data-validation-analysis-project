## TOTAL CLAIMS PER STATE

SELECT claimants.state, COUNT(claims.claim_id) AS total_claims
FROM claims
  JOIN claimants ON claimants.claimant_id = claims.claimant_id
GROUP BY claimants.state
ORDER BY total_claims DESC;

## TOTAL PAYMENTS ISSUED PER CLAIM

SELECT payments.claim_id, SUM(payments.payment_amount) AS total_paid
FROM payments
GROUP BY payments.claim_id;

## TOTAL CLAIMS PER POLICY TYPE

SELECT policies.policy_type, COUNT(claims.claim_id) AS total_claims
FROM claims
  JOIN policies ON policies.policy_id = claims.policy_id
GROUP BY policies.policy_type;

## AVERAGE RESERVE AMOUNT PER CLAIM STATUS

SELECT claims.claim_status, AVG(claims.reserve_amount) AS average_reserve
FROM claims
GROUP BY claims.claim_status;

## TOTAL PAYMENTS GROUPED BY PAYMENT STATUES

SELECT payments.payment_status, SUM(payments.payment_amount) AS total_payments
FROM payments
GROUP BY payments.payment_status;
