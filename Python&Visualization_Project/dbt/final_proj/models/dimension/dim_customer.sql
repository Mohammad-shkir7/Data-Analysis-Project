
select 
	c.customerid,
	INITCAP(firstname) as firstname ,
	INITCAP(lastname )as lastname ,
	c.company,
	c.address,
	c.city,
	c.state,
	c.country,
	c.postalcode,
	c.phone,
	c.fax,
	c.email ,
	substring(email, position ('@' in email) +1,length (email)) as domain,
	c.supportrepid ,
	c.last_update,
	'{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as dbt_time
from 
	stg.customer c 

