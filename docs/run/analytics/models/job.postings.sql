
  
    
    
    create  table
      "dev"."main"."job.postings__dbt_tmp"
  
    as (
      select *
FROM '../data/raw/raw_job_postings_*.parquet'
    );
  
    
  