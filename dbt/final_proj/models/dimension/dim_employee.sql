
select 
	e.employeeid,
	e.lastname,
	e.firstname,
	e.title ,
	e.reportsto ,
	e.departmentid ,
	e.birthdate ,
	e.hiredate ,
	e.address ,
	e.city ,
	e.state ,
	e.country ,
	e.postalcode ,
	e.phone ,
	e.fax ,
	e.email ,
	e.last_update,
	db.department_name ,
	db.budget ,
	DATE_PART('year', AGE(current_date , e.hiredate)) AS exp_years, 
	substring(email, position ('@' in email) +1,length (email)) as domain,
	CASE
		WHEN e.employeeid IN (SELECT DISTINCT reportsto FROM stg.employee e  WHERE reportsto IS NOT NULL) THEN 1
		ELSE 0
	END AS is_manager,
	'{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as dbt_time
	from 
		stg.employee e  left join stg.department_budget db 
		on e.departmentid = db.department_id 	
