Good day Team,
Upon analysing the shared Fetch Data, I will be detailing some of my findings below towards helping you make informed decision for strategic positioning as well as highlighting data quality issues and questions I have about the data.

**Data Quality Issues**
* There are duplicates across records in the transction data
* Purchase date of some products are different from the scan date (receipt generation date)
* Some of the products are without Barcode, so they transactions cannot be traced
* Some products have the same barcode but only differentiated by Brand names, this should be
* Transaction records have 0 as final quantity sold (how can this be?) while some have 0 or no record for the sales values (were these discounted? no way to tell!)
* About 3,600 of customers do not have a date of birth record while some are invalid, some have thier birth year as 1899, and early 1900s
* There are multiple records mapped to a receipt, differentiated by the product 

More Data Quality issues have been detailed [here](../Task%201%20-%20Data%20Exploration/Data%20Quality%20Issues.md)

**Intersting Trend in Data**
* Tostitos is the leading brand in the Dips and Salsa Category by number of customers that purchase the brand
* Walmart is the sotre that gets the most visit from different/new customers as well as the highest in number of scanned receipts
* Florida is the state with the highest record of different/new customers as well as the highest in number of scanned receipts

**Request for Action**
* The explanation and usage of the final_quantity and final_sales columns are needed to understand why there are zeros and blanks in there
* Null Barcodes in the product tables needs to filled and the duplicate barcodes used for differnt brands needs to be fixed as well
* Each record in the transaction table should be unique, hence the reasons for duplicates needs to be investigated
* Other questions that need answering can be found [here](../Task%201%20-%20Data%20Exploration/challenging_fields_to_understsand.md)


**Assumptions Made**
* All products have a unique Barcode (so no null or duplicate barcodes were permitted in this analysis)
* Duplicate transactions were dropped so that each transaction record is unique
* Only transactions with final quantity above 0 and final sales above 0 are considered as valid for this analysis
* States without state code are ignored to determine Florida as the one with the most new customers

Thank you,
I am available to give more insights if you would prefer more specific analysis