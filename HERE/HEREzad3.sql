DROP TABLE IF EXISTS streets_reprojected;
CREATE TABLE streets_reprojected AS
SELECT *,
       ST_Transform(geom, 3068) AS geom_3068
FROM t2019_kar_streets;

SELECT * FROM streets_reprojected