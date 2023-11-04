USE master;

-- overall satisfaction with UX --
-- sat=4.1 ux=4.03 --
SELECT 
    AVG(satisfaction_rating) AS avg_satisfaction,
    AVG(usability_rating) AS avg_usability
FROM [dbo].[UMM UX Data];

-- rating by age --
-- 18-24 = 4.2 and 3.9 --
-- 25-34 = 4.1 and 4.03 --

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END AS age_group,
    AVG(satisfaction_rating) AS avg_satisfaction,
    AVG(usability_rating) AS avg_usability
FROM [dbo].[UMM UX Data]
GROUP BY 
    CASE 
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+'
    END;

-- feedback by interests --
-- cooking and gaming tied for most--
-- movies and music tied for 2nd --
-- art 3rd --

SELECT 
    user_interest, 
    COUNT(*) AS feedback_count
FROM [dbo].[UMM UX Data]
GROUP BY user_interest
ORDER BY feedback_count DESC;

-- common issues --
-- Interactive video tutorials --
-- Simplify the group management process --
-- Streamline event registration --
SELECT 
    feedback, 
    COUNT(*) AS count
FROM [dbo].[UMM UX Data]
GROUP BY feedback
ORDER BY count DESC;

-- ui mentions --

SELECT 
    feedback,
    COUNT(*) AS mention_count
FROM [dbo].[UMM UX Data]
WHERE 
    feedback LIKE '%UI%' OR 
    feedback LIKE '%user interface%' OR 
    feedback LIKE '%layout%' OR 
    feedback LIKE '%design%' OR 
    feedback LIKE '%usability%' OR 
    feedback LIKE '%navigation%' OR 
    feedback LIKE '%color%' OR 
    feedback LIKE '%font%' OR 
    feedback LIKE '%button%' OR 
    feedback LIKE '%icon%'
GROUP BY feedback
ORDER BY mention_count DESC;