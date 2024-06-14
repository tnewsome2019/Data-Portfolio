USE PortfolioProjects;

-- 1)  Write a query to show CBSAs by 2020 to 2022 year-over-year growth rate, 
-- ranked from the lowest to the highest.
-- YOY = ((Current year value - Previous year value) / Previous year value) * 100
-- null values??
SELECT CBSA, ((Rent_2022 / Rent_2020) - 1) * 100 AS YOY_Growth_Rate
FROM Rates_table
WHERE Rent_2020 IS NOT NULL AND Rent_2022 IS NOT NULL
ORDER BY YOY_Growth_Rate ASC

-- 2)  Write a query that shows the average occupancy rate for open properties for the top 5 CBSAs.
SELECT TOP 5 [CBSA_Name], AVG(CAST(REPLACE([Occupancy], '%', '') AS FLOAT)) AS Avg_Occupancy_Rate
FROM Property_table
WHERE [Property_Status] = 'Open'
GROUP BY [CBSA_Name]
ORDER BY Avg_Occupancy_Rate DESC;

-- Write a query that shows top 10 open properties for Majority AL 
-- ranked by the number of open units.
SELECT TOP 10 *
FROM Property_table
WHERE [Property_Type] = 'Majority AL' AND [Property_Status] = 'Open'
ORDER BY [Open_Units] DESC