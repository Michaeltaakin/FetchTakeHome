-- SQL Server Query
-- What are the top 5 brands by sales amoung users that have had their account for at least six months

SELECT 
    top 5 brand, sum(final_sales) total_sales
FROM transactions t 
LEFT JOIN products p on t.barcode = p.barcode
LEFT JOIN users u on t.user_id = u.id 
WHERE Datediff(Month, u.created_date, (select max(u.created_date) from users)) >= 6
GROUP BY brand
ORDER BY sum(final_sales) desc