## CLAIMS WITHOUT ASSOCIATED PAYMENTS
-- Purpose: Identify claims that do not contain matching payment records, which may indicate incomplete processing workflows.
-- Screenshot:

SELECT * FROM claims
LEFT JOIN payments ON payments.claim_id = claims.claim_id WHERE payments.claim_id IS NULL;

---

```sql id="2jlwm8"
-- Query: Negative Payment Amounts
-- Purpose: Identify invalid payment records containing negative payment amounts.

SELECT *
FROM payments
WHERE payments.payment_amount < 0;
```

---

```sql id="3jlwm9"
-- Query: Invalid State Abbreviations
-- Purpose: Identify claimant records containing invalid state abbreviation formats.

SELECT *
FROM claimants
WHERE LENGTH(claimants.state) <> 2;
```

---

```sql id="4jlwm0"
-- Query: Closed Claims with Pending Payments
-- Purpose: Identify claims marked as closed that still contain pending payment activity, which may indicate workflow inconsistencies.

SELECT claims.claim_id,
       claims.claim_status,
       payments.payment_status
FROM claims
JOIN payments
ON claims.claim_id = payments.claim_id
WHERE claims.claim_status = 'Closed'
AND payments.payment_status = 'Pending';
```

---

```sql id="5jlwm1"
-- Query: Payments Greater Than Reserve Amount
-- Purpose: Identify payment records that exceed the claim reserve amount, which may indicate financial discrepancies or inaccurate reserving.

SELECT claims.claim_id,
       claims.reserve_amount,
       payments.payment_amount
FROM claims
JOIN payments
ON claims.claim_id = payments.claim_id
WHERE payments.payment_amount > claims.reserve_amount;
```

