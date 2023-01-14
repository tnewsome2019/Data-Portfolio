USE PortfolioProjects;
-- Cleaning Data
-- Total records = 541909
-- 13580 Records have no CustomerID
-- 406289 Records have CustomerID

;WITH online_retail AS
(
    SELECT [InvoiceNo]
        , [StockCode]
        ,[Description]
        ,[Quantity]
        ,[InvoiceDate]
        ,[UnitPrice]
        ,[CustomerID]
        ,[Country]
    FROM [dbo].[Online_Retail]
    WHERE CustomerID != 0
),quantity_unit_price AS 
(
    SELECT *
    FROM online_retail
    WHERE Quantity > 0 AND UnitPrice > 0
)
-- duplicate check
,dup_check AS
(
	
	SELECT * , ROW_NUMBER() OVER (PARTITION BY InvoiceNo, StockCode, Quantity ORDER BY InvoiceDate)dup_flag
	FROM quantity_unit_price

)
---397667 clean data
--5215 duplicate records
SELECT *
INTO #online_retail_main
FROM dup_check
WHERE dup_flag = 1


-- remove all records where value is not greater than 0
-- 397882 records with quantity and unit price 
  
----Clean Data
----BEGIN COHORT ANALYSIS
SELECT * FROM #online_retail_main

--Unique Identifier (CustomerID)
--Initial Start Date (First Invoice Date)
--Revenue Data

select
	CustomerID,
	MIN(InvoiceDate) first_purchase_date,
	DATEFROMPARTS(year(MIN(InvoiceDate)), month(MIN(InvoiceDate)), 1) Cohort_Date
INTO #cohort
FROM #online_retail_main
GROUP BY CustomerID

SELECT *
FROM #cohort

---Create Cohort Index
-- number of months that have passed since customers last purchse 
SELECT
	mmm.*,
	cohort_index = year_diff * 12 + month_diff + 1
INTO #cohort_retention
FROM
	(
		SELECT
			mm.*,
			year_diff = invoice_year - cohort_year,
			month_diff = invoice_month - cohort_month
		FROM
			(
				SELECT
					m.*,
					c.Cohort_Date,
					year(m.InvoiceDate) invoice_year,
					month(m.InvoiceDate) invoice_month,
					year(c.Cohort_Date) cohort_year,
					month(c.Cohort_Date) cohort_month
				FROM #online_retail_main m
				LEFT JOIN #cohort c
					ON m.CustomerID = c.CustomerID
			)mm
	)mmm
--where CustomerID = 14733
SELECT * FROM #cohort_retention

---Pivot Data to see the cohort table
SELECT 	*
INTO #cohort_pivot
FROM(
	SELECT DISTINCT 
		CustomerID,
		Cohort_Date,
		cohort_index
	FROM #cohort_retention
)tbl
pivot(
	Count(CustomerID)
	for Cohort_Index IN 
		(
		[1], 
        [2], 
        [3], 
        [4], 
        [5], 
        [6], 
        [7],
		[8], 
        [9], 
        [10], 
        [11], 
        [12],
		[13])

)AS pivot_table

SELECT *
FROM #cohort_pivot
ORDER BY Cohort_Date

SELECT Cohort_Date ,
	(1.0 * [1]/[1] * 100) AS [1], 
    1.0 * [2]/[1] * 100 AS [2], 
    1.0 * [3]/[1] * 100 AS [3],  
    1.0 * [4]/[1] * 100 AS [4],  
    1.0 * [5]/[1] * 100 AS [5], 
    1.0 * [6]/[1] * 100 AS [6], 
    1.0 * [7]/[1] * 100 AS [7], 
	1.0 * [8]/[1] * 100 AS [8], 
    1.0 * [9]/[1] * 100 AS [9], 
    1.0 * [10]/[1] * 100 AS [10],   
    1.0 * [11]/[1] * 100 AS [11],  
    1.0 * [12]/[1] * 100 AS [12],  
	1.0 * [13]/[1] * 100 AS [13]
FROM #cohort_pivot
ORDER BY Cohort_Date





