
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    job_location as unique_field,
    count(*) as n_records

from "prod"."main"."top_locations"
where job_location is not null
group by job_location
having count(*) > 1



  
  
      
    ) dbt_internal_test