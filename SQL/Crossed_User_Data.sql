USE master;
-- data overeview --
-- avg satisfaction 4.032 --
-- avg usability rating 4.003 --

SELECT COUNT(*) AS total_entries,
       AVG(satisfaction_rating) AS avg_satisfaction_rating,
       AVG(usability_rating) AS avg_usability_rating
FROM [dbo].[Crossed User Data]

-- age distribution -- 

SELECT age, COUNT(*) AS count
FROM [dbo].[Crossed User Data]
GROUP BY age
ORDER BY age;

-- feedback analysis --

SELECT ROUND(AVG(satisfaction_rating), 1) AS avg_satisfaction,
       ROUND(AVG(usability_rating), 1) AS avg_usability,
       ROUND(COUNT(DISTINCT user_id) * 100.0 / (SELECT COUNT(*) FROM [dbo].[Crossed User Data]), 1) AS feedback_coverage
FROM [dbo].[Crossed User Data];

-- trend analysis by date --
-- high UX satisfaction thru testing, nice! --

SELECT DATE, AVG(satisfaction_rating) AS avg_satisfaction_rating
FROM [dbo].[Crossed User Data]
GROUP BY DATE
ORDER BY DATE;



-- satisfaction distribution --

SELECT satisfaction_rating, COUNT(*) AS count
FROM [dbo].[Crossed User Data]
GROUP BY satisfaction_rating
ORDER BY satisfaction_rating;

-- feedback by round of testing --
-- more in depth feedback during iteration --
SELECT round_of_testing, COUNT(*) AS feedback_count
FROM [dbo].[Crossed User Data]
GROUP BY round_of_testing
ORDER BY feedback_count DESC;

-- usability rating distribution --
SELECT usability_rating, COUNT(*) AS count
FROM [dbo].[Crossed User Data]
GROUP BY usability_rating
ORDER BY usability_rating;

-- feedback trends ovr time --
-- usability ratiing faltered a little in 3rd and last month of testing --

SELECT
    YEAR(CONVERT(DATE, '01-' + [Date], 106)) AS year,
    MONTH(CONVERT(DATE, '01-' + [Date], 106)) AS month,
    AVG(satisfaction_rating) AS avg_satisfaction_rating,
    AVG(usability_rating) AS avg_usability_rating
FROM [dbo].[Crossed User Data]
WHERE ISDATE('01-' + [Date]) = 1  -- Filter out invalid dates
GROUP BY YEAR(CONVERT(DATE, '01-' + [Date], 106)), MONTH(CONVERT(DATE, '01-' + [Date], 106))
ORDER BY year, month;

-- satisfaction by round --
-- Round 1	4.05	4.01 --
-- Round 2	4.05	4
-- Round 3	4.0249999999999995	4.002777777777776
SELECT 
    [round_of_testing],
    AVG([satisfaction_rating]) AS AvgSatisfaction,
    AVG([usability_rating]) AS AvgUsability
FROM [dbo].[Crossed User Data]
GROUP BY [round_of_testing]
ORDER BY [round_of_testing];

-- feedback keywords frequency 

SELECT 
    CASE 
        WHEN feedback LIKE '%navigation%' THEN 'Navigation'
        WHEN feedback LIKE '%profile%' THEN 'Profile'
        WHEN feedback LIKE '%chat%' THEN 'Chat'
        ELSE 'Other' 
    END AS feedbackCategory,
    COUNT(*) AS FeedbackCount
FROM [dbo].[Crossed User Data]
GROUP BY 
    CASE 
        WHEN feedback LIKE '%navigation%' THEN 'Navigation'
        WHEN feedback LIKE '%profile%' THEN 'Profile'
        WHEN feedback LIKE '%chat%' THEN 'Chat'
        ELSE 'Other' 
    END
ORDER BY FeedbackCount DESC;