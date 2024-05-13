
SELECT
    t.trackid,
    t.name AS track_name,
    t.albumid,
    t.mediatypeid,
    t.genreid,
    t.composer,
    t.milliseconds / 1000 AS track_length_ss,
    LPAD(FLOOR(t.milliseconds / 1000 / 60)::TEXT, 2, '0') || ':' || 
    LPAD(FLOOR(t.milliseconds / 1000 % 60)::TEXT, 2, '0') AS track_length_mm,
    t.bytes,
    t.unitprice,
    t.last_update AS track_last_update,
    g.name AS genre_name,
    g.last_update AS genre_last_update,
    mt.name AS mediatype_name,
    mt.last_update AS mediatype_last_update,
    al.title AS album_title,
    al.last_update AS album_last_update,
    ar.artistid,
    ar.name AS artist_name,
    ar.last_update AS artist_last_update,
    '{{run_started_at.strftime("%y-%m-%d %H:%M:%S")}}' as dbt_time
FROM stg.track as t
LEFT JOIN stg.genre as g ON t.genreid = g.genreid
LEFT JOIN stg.mediatype as mt ON t.mediatypeid = mt.mediatypeid
LEFT JOIN stg.album as al ON t.albumid = al.albumid
LEFT JOIN stg.artist as ar ON al.artistid = ar.artistid
