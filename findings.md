# Findings/Observations

## Finding 1: Claims Without Associated Payments

One of the validation queries identified claims that did not have matching payment records. In a real claims environment, this could point to incomplete processing, delayed payments, or missing transaction activity.

Business Impact:
Claims missing payment activity may need additional review to confirm whether the claim is still being worked or if expected payment records were never created.

---

## Finding 2: Negative Payment Amounts

Another validation query identified payment records with negative payment amounts. While some systems may allow negative transactions for adjustments or recoveries, these records can also indicate incorrect financial data or processing issues.

Business Impact:
Negative payment amounts can impact reporting accuracy and create misleading financial totals if not reviewed properly.

---

## Finding 3: Closed Claims with Pending Payments

A workflow validation query identified claims marked as "Closed" while still containing payments in a "Pending" status. This suggests the claim status and payment activity may not be fully synchronized.

Business Impact:
Status inconsistencies like this can create confusion in reporting and may indicate gaps in the claims workflow process.

---

## Finding 4: Payments Exceeding Reserve Amounts

Another validation query identified payment amounts that exceeded the associated claim reserve amount. This may indicate reserve inaccuracies, overpayments, or the need for reserve adjustments during claim handling.

Business Impact:
Payments exceeding reserves can affect financial forecasting, reserve reporting, and overall claims management accuracy.

---

## Overall Summary

This project demonstrates how SQL can be used to support both reporting and data validation within an insurance claims environment. The queries focused on identifying workflow inconsistencies, financial discrepancies, and missing relational data using joins, aggregations, and validation logic.
