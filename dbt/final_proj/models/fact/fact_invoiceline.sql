{{ config(materialized='incremental') }}
SELECT
	il.invoicelineid,
	il.invoiceid ,
	il.trackid ,
	il.unitprice ,
	il.quantity ,
	il.last_update,
	'{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as dbt_time
FROM 
	stg.invoiceline il