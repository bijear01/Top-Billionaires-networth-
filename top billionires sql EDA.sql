SELECT * 
FROM billionaires_data.billionaire_data;

select 
count(*), count(distinct BillionairesRichestBillionaire2023)
from 
billionaires_data.billionaire_data;
-- solution : we have 72 billionaires worldwide.

-- -------------------------------Count and Avg Net-worth of the billionaires by region(continent) -------------------------------------------------------------------

select 
region,
 count(BillionairesRichestBillionaire2023) as no_of_billionairs,
 round(avg(BillionairesTotalNetWorth2023),2) as Avg_networth,
 round(sum(BillionairesTotalNetWorth2023),2) as total_networth
from
billionaires_data.billionaire_data
group by region
order by 4 desc;

-- --------------------------------African Billionaires net worth as a pct of the whole word, and other countries too ----------------------------------------------------------
with data as 
(select 
region,
 count(BillionairesRichestBillionaire2023) as no_of_billionairs,
 round(avg(BillionairesTotalNetWorth2023),2) as Avg_networth,
 round(sum(BillionairesTotalNetWorth2023),2) as total_networth
from
billionaires_data.billionaire_data
group by region
order by 4 desc
)
select 
  sum(case when region = 'Africa' then total_networth else 0 end)/sum(total_networth)*100 as pct_networth_africa,
   sum(case when region = 'Asia' then total_networth else 0 end)/sum(total_networth)*100 as pct_networth_Asia,
   sum(case when region ='North America' then total_networth else 0 end)/sum(total_networth)*100 as pct_North_America,
    sum(case when region = 'Europe' then total_networth else 0 end)/sum(total_networth)*100 as pct_networth_Europe,
     sum(case when region = 'South America' then total_networth else 0 end)/sum(total_networth)*100 as pct_networth_St_America,
      sum(case when region = 'Oceania' then total_networth else 0 end)/sum(total_networth)*100 as pct_networth_Oceania,
  sum(total_networth) as total_networth
  
  from data
  ;
  
  -- --------------------------------------- Top 5 billionaires regardless of country and region, by net_worth
  
  select BillionairesRichestBillionaire2023,
  BillionairesTotalNetWorth2023,
  country,
  region
  from billionaires_data.billionaire_data
  order by 2 desc
  limit 5;
  
  -- ------- Is there a relationship between the regions with the highest number of billionaires and 
  -- --------population growth rate 
  -- --------population density
  
  
  select
  region, 
  round(avg(BillionairesTotalNetWorth2023),2) as avg_network,
round(avg(population_density_km),2) as avg_popdensity,
  round(avg(Population_growthRate),2) as avg_popgrowth
  from billionaires_data.billionaire_data
  group by region 
  order by 2 desc;
  
  -- ----------------------Avg net worth by UN membeer status -----------------------------------------------------------------------------------
   select * 
   from billionaires_data.billionaire_data;
  
  select distinct (unMember) 
   from billionaires_data.billionaire_data;
   
   select unMember,
   round(avg(BillionairesTotalNetWorth2023),2) avg_networth,
   round(sum(BillionairesTotalNetWorth2023),2) as total_networth
   from billionaires_data.billionaire_data
   group by 1 ;
   
  




