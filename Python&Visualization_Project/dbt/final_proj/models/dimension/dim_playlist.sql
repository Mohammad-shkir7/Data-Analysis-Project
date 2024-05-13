
select 
    pt.*,
    p.name,
    p.last_update as playlist_last_update,
    '{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as dbt_time

from 
	stg.playlisttrack as Pt left join stg.playlist p
	on pt.playlistid  = p.playlistid 