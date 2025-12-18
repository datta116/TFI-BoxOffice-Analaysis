-- ============================================================
-- TFI DASHBOARD VALIDATION SCRIPT (MSSQL VERSION)
-- ============================================================

------------------------------------------------------------
-- 0. DATA INTEGRITY & NULL CHECKS (Perform these first)
------------------------------------------------------------
use MyDatabase
SELECT 
    -- Logical Check: Day 1 should not exceed Total Collection
    SUM(CASE WHEN day1_WW_Gross_cr > total_WW_cls THEN 1 ELSE 0 END) AS logic_error_day1_gt_total,
    
    -- Null Checks
    SUM(CASE WHEN movie_name IS NULL THEN 1 ELSE 0 END) AS null_movies,
    SUM(CASE WHEN hero_name IS NULL THEN 1 ELSE 0 END) AS null_heroes,
    SUM(CASE WHEN total_WW_cls IS NULL THEN 1 ELSE 0 END) AS null_total_collections,
    SUM(CASE WHEN day1_WW_Gross_cr IS NULL THEN 1 ELSE 0 END) AS null_day1_collections,
    
    -- Range Check: Year of release (Ensuring no future dates or invalid years)
    SUM(CASE WHEN year_of_release > YEAR(GETDATE()) OR year_of_release < 1990 THEN 1 ELSE 0 END) AS invalid_years
FROM data;

-- Check for Duplicate Movie Entries
SELECT movie_name, hero_name, year_of_release, COUNT(*) as duplicate_count
FROM data
GROUP BY movie_name, hero_name, year_of_release
HAVING COUNT(*) > 1;


------------------------------------------------------------
-- 1. MAIN KPI CARDS (FILTERED FOR PRABHAS)
------------------------------------------------------------
-- Success Rate (70.59%), Peak (1,810 Cr), Highest Opening (215 Cr)
SELECT 
    'Prabhas' as Hero,
    COUNT(*) as total_movies,
    ROUND(100.0 * SUM(CASE 
        WHEN verdict IN ('Hit', 'Blockbuster', 'All Time Blockbuster', 'Super Hit') THEN 1 
        ELSE 0 
    END) / COUNT(*), 2) as success_rate_percent,
    MAX(total_WW_cls) as peak_lifetime_cr,
    MAX(day1_WW_Gross_cr) as highest_openingDay_cr
FROM data
WHERE hero_name = 'Prabhas';


------------------------------------------------------------
-- 2. HIGHEST TOTAL WW GROSS (TOP 6 - PRABHAS)
------------------------------------------------------------
-- Funnel chart showing Baahubali 2, Kalki, etc.
SELECT TOP 6
    movie_name, 
    total_WW_cls as collection_cr
FROM data
WHERE hero_name = 'Prabhas'
ORDER BY total_WW_cls DESC;


------------------------------------------------------------
-- 3. GLOBAL TREEMAP VALIDATION (UNFILTERED)
------------------------------------------------------------
-- "Highest Day1 WW Gross of TFI" (Includes Pushpa 2, RRR, etc.)
SELECT TOP 6
    movie_name, 
    hero_name,
    day1_WW_Gross_cr
FROM data
ORDER BY day1_WW_Gross_cr DESC;


------------------------------------------------------------
-- 4. TOP 6 MOVIES BY OPENING DAY (FILTERED FOR PRABHAS)
------------------------------------------------------------
--The pink bar chart (Baahubali 2: 215, Kalki: 183, Salaar: 165, etc.)
SELECT TOP 6
    movie_name,
    day1_WW_Gross_cr
FROM data
WHERE hero_name = 'Prabhas'
ORDER BY day1_WW_Gross_cr DESC;


------------------------------------------------------------
-- 5. VERDICT DISTRIBUTION (DONUT CHART - PRABHAS)
------------------------------------------------------------
-- Hit(6), Blockbuster(4), ATB(2), Flop(4), Disaster(1)
SELECT 
    verdict, 
    COUNT(*) as movie_count
FROM data
WHERE hero_name = 'Prabhas'
GROUP BY verdict
ORDER BY movie_count DESC;


------------------------------------------------------------
-- 6. ANNUAL TRENDS (COMBO CHART - PRABHAS)
------------------------------------------------------------
-- Blue bars (Collections) and Yellow line (Success Rate)
SELECT 
    year_of_release,
    SUM(total_WW_cls) as yearly_total,
    ROUND(100.0 * SUM(CASE 
        WHEN verdict IN ('Hit', 'Blockbuster', 'All Time Blockbuster', 'Super Hit') THEN 1 
        ELSE 0 
    END) / COUNT(*), 2) as yearly_success_rate
FROM data
WHERE hero_name = 'Prabhas'
GROUP BY year_of_release
ORDER BY year_of_release ASC;