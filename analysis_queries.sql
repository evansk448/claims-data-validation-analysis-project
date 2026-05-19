## TOTAL CLAIMS PER STATE
-- Purpose: Count the total number of claims grouped by claimant state to identify claim volume trends across states.
-- Screenshot: Screenshots/clms_by_state_query.png

SELECT claimants.state, COUNT(claims.claim_id) AS total_claims
FROM claims
  JOIN claimants ON claimants.claimant_id = claims.claimant_id
GROUP BY claimants.state
ORDER BY total_claims DESC;

## TOTAL PAYMENTS ISSUED PER CLAIM
-- Purpose: Calculate the total amount paid on each claim by summing all associated payment records.
-- Screenshot: Screenshots/pmts_per_clm_query.jpg

SELECT payments.claim_id, SUM(payments.payment_amount) AS total_paid
FROM payments
GROUP BY payments.claim_id;

## TOTAL CLAIMS PER POLICY TYPE
-- Purpose: Count the number of claims associated with each policy type to identify claim distribution across insurance products.

SELECT policies.policy_type, COUNT(claims.claim_id) AS total_claims
FROM claims
  JOIN policies ON policies.policy_id = claims.policy_id
GROUP BY policies.policy_type;

## AVERAGE RESERVE AMOUNT PER CLAIM STATUS
-- Purpose: Calculate the average reserve amount for each claim status category to evaluate financial exposure across claim statuses.
-- Screenshot: Screenshots/reserve_per_clmstatus_query.png

SELECT claims.claim_status, AVG(claims.reserve_amount) AS average_reserve
FROM claims
GROUP BY claims.claim_status;

## TOTAL PAYMENTS GROUPED BY PAYMENT STATUES
-- Purpose: Summarize payment amounts grouped by payment status to analyze processed versus pending payment activity.

SELECT payments.payment_status, SUM(payments.payment_amount) AS total_payments
FROM payments
GROUP BY payments.payment_status;
