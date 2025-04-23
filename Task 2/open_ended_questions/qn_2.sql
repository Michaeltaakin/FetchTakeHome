-- SQL Server Query
-- Which is the leading brand in the Dips & Salsa Category

/*

ASSUMPTIONS
* for a sale to be valid,
    - then the final_quantity needs to be 1 or more 
    - the final_sale needs to above 0
* the definition of a leading brand here refers to the number of people (unique users) who patronize this brand

* Dips & Salsa can be identified in the Category_2 column of the product table
* Products consdiered are only those with non null barcodes and 
* Barcodes are unique in the product table
* The transaction table is free of duplicates across all columns

*/

-- SQL CODE for this
WITH clean_transaction_table as (
    SELECT 
        distinct receipt_id, purchase_date, scan_date, stroe_name, user_id, barcode, final_quantity, final_sale
    FROM transaction
)
, clean_product_table as (
    SELECT 
        category_1, category_2, category_3, category_4, manufacturer, brand, barcode,
        rank() over (partition by barcode) rnk 
    FROM product 
    WHERE barcode is not null
)
, brand_popularity as (
    SELECT 
        p.brand, count(distinct t.user_id) unique_customers
    FROM clean_transaction_table t 
    LEFT JOIN clean_product_table p on cast(t.barcode as nvarchar(max)) = cast(p.barcode as nvarchar(max))
    WHERE t.final_quantity >= 1
        AND t.final_sale > 0
        AND p.category_2 = 'Dips & Salsa'
        AND p.rnk = 1
    GROUP BY p.brand
)
SELECT 
    top 1 brand
FROM brand_popularity
ORDER BY unique_customers desc