-- KICKSTARTER SUCCESS FACTORS
-- SQL Analysis
-- Main question: What factors are associated with campaign success?


-- 1. OVERALL CAMPAIGN SUCCESS RATE

SELECT
    COUNT(CASE WHEN state = 'successful' THEN 1 END) AS successful_campaigns,
    COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END) AS completed_campaigns,
    ROUND(
        COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 /
        COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END),
        2
    ) AS success_rate
FROM kickstarter_raw;


-- 2. SUCCESS BY CATEGORY

SELECT
    category,
    COUNT(*) AS completed_campaigns,
    COUNT(CASE WHEN state = 'successful' THEN 1 END) AS successful_campaigns,
    ROUND(
        COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 /
        COUNT(*),
        2
    ) AS success_rate
FROM kickstarter_raw
WHERE state IN ('successful', 'failed')
GROUP BY category
HAVING COUNT(*) >= 1000
ORDER BY success_rate DESC;


-- 3. SUCCESS BY FUNDING GOAL RANGE

SELECT
    CASE
        WHEN goal < 5000 THEN 'Under $5K'
        WHEN goal < 10000 THEN '$5K-$10K'
        WHEN goal < 25000 THEN '$10K-$25K'
        WHEN goal < 50000 THEN '$25K-$50K'
        WHEN goal < 100000 THEN '$50K-$100K'
        ELSE '$100K+'
    END AS goal_range,

    COUNT(CASE WHEN state = 'successful' THEN 1 END) AS successful_campaigns,

    COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END) AS completed_campaigns,

    ROUND(
        COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 /
        COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END),
        2
    ) AS success_rate

FROM kickstarter_raw
WHERE state IN ('successful', 'failed')
GROUP BY goal_range
ORDER BY success_rate DESC;


-- 4. SUCCESS BY NUMBER OF BACKERS

SELECT
    CASE
        WHEN backers <= 10 THEN '0-10'
        WHEN backers <= 50 THEN '11-50'
        WHEN backers <= 100 THEN '51-100'
        WHEN backers <= 500 THEN '101-500'
        WHEN backers <= 1000 THEN '501-1000'
        ELSE '1000+'
    END AS backer_range,

    COUNT(CASE WHEN state = 'successful' THEN 1 END) AS successful_campaigns,

    COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END) AS completed_campaigns,

    ROUND(
        COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 /
        COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END),
        2
    ) AS success_rate

FROM kickstarter_raw
WHERE state IN ('successful', 'failed')
GROUP BY backer_range
ORDER BY success_rate DESC;


-- 5. GOAL VS PLEDGED AMOUNT

SELECT
    goal,
    pledged,
    ROUND((pledged / goal) * 100, 2) AS goal_achievement
FROM kickstarter_raw
WHERE state = 'successful'
LIMIT 100;


-- 6. OVERALL AVERAGE GOAL AND PLEDGED AMOUNT

SELECT
    ROUND(AVG(pledged), 2) AS avg_pledged,
    ROUND(AVG(goal), 2) AS avg_goal,
    ROUND(AVG(pledged / goal) * 100, 2) AS avg_goal_achievement
FROM kickstarter_raw
WHERE state = 'successful';


-- 7. GOAL ACHIEVEMENT RANGES

SELECT
    CASE
        WHEN pledged / goal < 1.5 THEN '100%-150%'
        WHEN pledged / goal < 2 THEN '150%-200%'
        WHEN pledged / goal < 5 THEN '200%-500%'
        ELSE '500%+'
    END AS achievement_range,

    COUNT(*) AS campaign_count

FROM kickstarter_raw
WHERE state = 'successful'
GROUP BY achievement_range
ORDER BY campaign_count DESC;


-- 8. SUCCESS BY COUNTRY

SELECT
    country,

    COUNT(CASE WHEN state = 'successful' THEN 1 END) AS successful_campaigns,

    COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END) AS completed_campaigns,

    ROUND(
        COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 /
        COUNT(CASE WHEN state IN ('successful', 'failed') THEN 1 END),
        2
    ) AS success_rate

FROM kickstarter_raw
WHERE state IN ('successful', 'failed')
GROUP BY country
ORDER BY success_rate DESC;


-- 9. FINAL FACTOR COMPARISON

SELECT
    'Funding Goal' AS factor,
    'Under $5K' AS segment,
    50.80 AS success_rate

UNION ALL

SELECT
    'Funding Goal',
    '$100K+',
    11.61

UNION ALL

SELECT
    'Backers',
    '0-10',
    4.29

UNION ALL

SELECT
    'Backers',
    '1000+',
    98.42;