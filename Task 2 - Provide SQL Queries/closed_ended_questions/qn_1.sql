-- SQL Server Query
-- What are the top 5 brands by receipts scanned among users 21 and over
SELECT 
    top 5 brand, count(distinct receipt_id) total_receipts
FROM transactions t 
LEFT JOIN products p on t.barcode = p.barcode
LEFT JOIN users u on t.user_id = u.id 
WHERE Datediff(YEAR, u.birthdate, getdate()) >= 21
GROUP BY brand
ORDER BY count(distinct receipt_id) desc