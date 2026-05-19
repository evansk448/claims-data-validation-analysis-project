## CLAIMS WITHOUT ASSOCIATED PAYMENTS
-- Purpose: Identifies claims that do not contain matching payment records, could indicate incomplete processing workflows.
-- Screenshot:

SELECT * FROM claims
LEFT JOIN payments ON payments.claim_id = claims.claim_id WHERE payments.claim_id IS NULL;

-----

## NEGATIVE PAYMENT AMOUNTS
-- Purpose: Identifies invalid payment records containing negative payment amounts.
-- Screenshot: 

SELECT * FROM payments WHERE payments.payment_amount < 0;

-----

## CLOSED CLAIMS WITH PENDING PAYMENTS
-- Purpose: Identifies claims marked as closed but still have pending payment activity, could indicate workflow inconsistencies.
-- Screenshot:

SELECT claims.claim_id, claims.claim_status, payments.payment_status FROM claims
JOIN payments ON payments.claim_id = claims.claim_id
WHERE claims.claim_status = 'Closed' AND payments.payment_status = 'Pending';

-----

## PAYMENTS GREATER THAN RESERVE AMOUNT
-- Purpose: Identifies payment records that exceed the claim reserve amount, could indicate financial discrepancies or inaccurate reserving.
-- Screenshot:

SELECT claims.claim_id,claims.reserve_amount,payments.payment_amount FROM claims
JOIN payments ON claims.claim_id = payments.claim_id
WHERE payments.payment_amount > claims.reserve_amount;

