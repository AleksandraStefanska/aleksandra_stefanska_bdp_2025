DROP TABLE IF EXISTS new_buildings_2019;
CREATE TABLE new_buildings_2019 AS
SELECT b.* FROM t2019_kar_buildings AS b
LEFT JOIN t2018_kar_buildings AS a
ON ST_Equals(b.geom, a.geom)
WHERE a.geom IS NULL;

DROP TABLE IF EXISTS modified_buildings_2019;
CREATE TABLE modified_buildings_2019 AS
SELECT b.* FROM t2019_kar_buildings AS b
LEFT JOIN t2018_kar_buildings AS a
ON b.polygon_id = a.polygon_id
WHERE NOT ST_Equals(a.geom, b.geom);

DROP TABLE IF EXISTS changed_buildings_2018_2019;
CREATE TABLE changed_buildings_2018_2019 AS
SELECT * FROM new_buildings_2019
UNION ALL
SELECT * FROM modified_buildings_2019;

SELECT * FROM changed_buildings_2018_2019