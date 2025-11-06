DROP TABLE IF EXISTS t2019_kar_bridges;

CREATE TABLE t2019_kar_bridges AS
SELECT 
    ST_Intersection(
        ST_Transform(r.geom, 3068), 
        ST_Transform(w.geom, 3068)    
    ) AS geom
FROM t2019_kar_railways AS r
JOIN t2019_kar_water_lines AS w
  ON ST_Intersects(
        ST_Transform(r.geom, 3068),
        ST_Transform(w.geom, 3068)
     );

SELECT * FROM t2019_kar_bridges
