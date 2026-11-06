
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select job_location
from "prod"."main"."top_locations"
where job_location is null



  
  
      
    ) dbt_internal_test