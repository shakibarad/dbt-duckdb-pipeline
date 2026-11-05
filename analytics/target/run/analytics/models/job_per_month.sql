
  
    
    
    create  table
      "prod"."main"."job_per_month__dbt_tmp"
  
    as (
      -- monthly posting counts by role
SELECT
    DATE_TRUNC('month', search_date) AS month,
    search_term AS role,
    COUNT(*) AS postings
FROM "prod"."main"."job_postings"
GROUP BY ALL
ORDER BY month, role
    );
  
    
  