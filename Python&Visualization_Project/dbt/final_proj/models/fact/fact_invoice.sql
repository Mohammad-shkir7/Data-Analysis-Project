{{ config(materialized='incremental') }}
SELECT
    invoiceid,
    customerid,
    invoicedate,
    total,
    last_update,
    '{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as dbt_time
FROM 
    stg.invoice i