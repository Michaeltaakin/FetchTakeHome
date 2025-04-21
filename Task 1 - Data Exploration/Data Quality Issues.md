TRANSACTION_TAKEHOME.csv
* Receipt_ID
    - There are duplicate records in this column but this should not be the case as the receipt_id is exepected in this case to be the primary key of the transaction table, identifying each receipt generated as a unique transaction
    - WE have 24,440 unique records from a total record of 50,000 representing 48.89% of the data
    - Receipt_ID "bedac253-2256-461b-96af-267748e6cecf" occurred as much as 12 times, while we have some occuring 8, 6 times etc
    - See sample distribution
    ![receipt_id_distribution](./images/transaction_receipt_id.png)
* Store Name
    - There is a store named "/MART", this is possibly a naming error, 
    - there are two occurence of this and likely duplicates (although the final slaes columns differentiates the two records)
* Barcode Column
    - missing for 5,762 records out of 50,000 records
    - There are duplicate records in the column as well as we have only 11,029 unique barcodes, however this is expected as this is a transaction table and the same product is expected to be sold multiple times
* Final_Quantity
    - This column cannot assume a numeric data type because one of its content is text and labelled "zero". This needs to be cleaned
    ![final_quantity_zero_mislabelled](./images/transaction_final_quantity.png)
* Final_Sales
    - There are 12,500 null/empty cells (25% of the dataset) and this begs the question of at what price were these sales made.
    - 480 of the records have a final sales figure as 0. Does this imply they were given out for free or a discount had happened?
    ![final_sales_image](./images/transaction_final_sale.png)


USER_TAKEHOME.csv