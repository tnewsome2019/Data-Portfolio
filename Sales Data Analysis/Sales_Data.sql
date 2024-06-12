USE PortfolioProject;

SELECT * FROM [dbo].[sales_data_sample]

-- checking for unique values 

SELECT DISTINCT STATUS FROM [dbo].[sales_data_sample] -- Nice to plot
SELECT DISTINCT year_id FROM [dbo].[sales_data_sample]
SELECT DISTINCT PRODUCTLINE FROM [dbo].[sales_data_sample] --nice to plot
SELECT DISTINCT COUNTRY FROM [dbo].[sales_data_sample] -- nice to plot
SELECT DISTINCT DEALSIZE FROM [dbo].[sales_data_sample] -- nice to plot
SELECT DISTINCT TERRITORY FROM [dbo].[sales_data_sample] -- nice to plot


--- ANALYSIS 
-- grouping sales by product line
SELECT PRODUCTLINE, SUM(sales) Revenue 
FROM [dbo].[sales_data_sample]
GROUP BY PRODUCTLINE
ORDER BY 2 DESC

-- most sales in Classic Cars, best product line they have 

SELECT YEAR_ID, SUM(sales) Revenue 
FROM [dbo].[sales_data_sample]
GROUP BY YEAR_ID
ORDER BY 2 DESC

-- 2004 had the most sales that year 
-- 2005 had the least, maybe they werent oprating all year 

SELECT DISTINCT MONTH_ID FROM [dbo].[sales_data_sample]
WHERE YEAR_ID = 2005

-- was open just for 5 months in 2005 
SELECT DISTINCT MONTH_ID FROM [dbo].[sales_data_sample]
WHERE YEAR_ID = 2004
SELECT DISTINCT MONTH_ID FROM [dbo].[sales_data_sample]
WHERE YEAR_ID = 2003

-- full year for 2003 and and 2004, but only half for 2005 

SELECT DEALSIZE, SUM(sales) Revenue 
FROM [dbo].[sales_data_sample]
GROUP BY DEALSIZE
ORDER BY 2 DESC

-- medium sized deals generate msot revenue

-- What was the best mont for sales in a specific year? How much was earned that month?
SELECT MONTH_ID, SUM(sales) Revenue, COUNT(ORDERNUMBER) Frequency
FROM [dbo].[sales_data_sample]
WHERE YEAR_ID = 2004 --change to see the rest
GROUP BY MONTH_ID
ORDER BY 2 DESC

-- November is the best month for this company, which product is selling? 
-- see whats selling each month
SELECT MONTH_ID, PRODUCTLINE, SUM(sales) Revenue, COUNT(ORDERNUMBER) Frequency
FROM [dbo].[sales_data_sample]
WHERE YEAR_ID = 2004 AND MONTH_ID = 11 --change to see the rest
GROUP BY MONTH_ID, PRODUCTLINE
ORDER BY 3 DESC

-- WHo is our best customer? RFM analysis
-- customers last order date
--group 92 records in to 4 equal groups
-- difference between the customers last order vs the maximum date in the dataset
-- the bigger the value, the bigger the monetary sale value 

DROP TABLE IF EXISTS #rfm

;WITH rfm AS
(
    SELECT
        CUSTOMERNAME,
        AVG(sales) MonetaryaValue,
        AVG(sales) AvgMonetaryaValue,
        COUNT(ORDERNUMBER) Frequency,
        MAX(ORDERDATE) last_order_date,
        (SELECT MAX(ORDERDATE) FROM [dbo].[sales_data_sample]) max_order_date,
        DATEDIFF(DD,MAX(ORDERDATE), (SELECT MAX(ORDERDATE) FROM [dbo].[sales_data_sample])) Recency

    FROM [dbo].[sales_data_sample]
    GROUP BY CUSTOMERNAME 
),
rfm_calc AS 
(
    SELECT r.*,
    NTILE(4) OVER (ORDER BY Recency) rfm_recency,
    NTILE(4) OVER (ORDER BY Frequency) rfm_frequency,
    NTILE(4) OVER (ORDER BY AvgMonetaryaValue) rfm_monetary
    FROM rfm r
)
SELECT 
    c.*, rfm_recency+ rfm_frequency+ rfm_monetary AS rfm_cell,
    CAST(rfm_recency AS VARCHAR) + CAST(rfm_frequency AS VARCHAR) + CAST(rfm_monetary AS VARCHAR) rfm_cell_string
INTO #rfm
FROM rfm_calc c

SELECT CUSTOMERNAME, rfm_recency, rfm_frequency, rfm_monetary,
    CASE
        WHEN rfm_cell_string in (111, 112, 121, 122, 123, 132, 211, 212, 212, 114, 141) THEN 'lost_customers'
        WHEN rfm_cell_string in (133, 134, 143, 334, 343, 344, 144) THEN 'slippining away, cannot lose'
        WHEN rfm_cell_string in (311, 411, 331) THEN 'new customers'
        WHEN rfm_cell_string in (222, 223, 233, 322) THEN 'potential churners'
        WHEN rfm_cell_string in (323, 333, 321, 422, 332, 432) THEN 'active'
        WHEN rfm_cell_string in (433, 434, 443, 444) THEN 'loyal'
    END rfm_segment
        
FROM #rfm

-- how you can categorize your customers and whenere you want to sened out a marketing campaign, you know who to target

--What products are most often sold together?
-- count of all the orders that shipped 
--convert xml to string
--easy way to see which products are sold together
SELECT DISTINCT ORDERNUMBER, stuff(
   (SELECT ',' + PRODUCTCODE
    FROM [dbo].[sales_data_sample] p
    WHERE ORDERNUMBER IN 
        (
            SELECT ORDERNUMBER
            FROM (
                SELECT ORDERNUMBER, COUNT(*) rn 
                FROM [dbo].[sales_data_sample]
                WHERE STATUS = 'Shipped'
                GROUP BY ORDERNUMBER
            )m
            WHERE rn = 3
        )
        AND p.ORDERNUMBER = s.ORDERNUMBER
        FOR XML PATH ('')), 1, 1, '') ProductCodes
FROM [dbo].[sales_data_sample] s 
ORDER BY 2 DESC

