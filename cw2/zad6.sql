--a
SELECT SUM(ST_Length(geom)) AS total_road_length
FROM roads;

--b
SELECT
  ST_AsText(geom) AS wkt,
  ST_Area(geom) AS area,
  ST_Perimeter(geom) AS perimeter
FROM buildings
WHERE name = 'BuildingA';

--c
SELECT
  name,
  ST_Area(geom) AS area
FROM buildings
ORDER BY name ASC;

--d
SELECT
  name,
  ST_Area(geom) AS area,
  ST_Perimeter(geom) AS perimeter
FROM buildings
ORDER BY area DESC
LIMIT 2;

--e
SELECT ST_Distance(b.geom, p.geom) AS distance
FROM buildings b
JOIN poi p ON p.name = 'K'
WHERE b.name = 'BuildingC';

--f
SELECT ST_Area(
         ST_Difference(bc.geom, ST_Buffer(bb.geom, 0.5))
       ) AS area_outside_0_5
FROM buildings bc
CROSS JOIN buildings bb
WHERE bc.name = 'BuildingC' AND bb.name = 'BuildingB';

--g
SELECT b.name
FROM buildings b
CROSS JOIN roads r
WHERE r.name = 'RoadX'
  AND ST_Y(ST_Centroid(b.geom)) > ST_Y(ST_Centroid(r.geom));

--h
WITH poly AS (
  SELECT ST_GeomFromText('POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))', 0) AS geom
),
b AS (
  SELECT geom FROM buildings WHERE name = 'BuildingC'
)
SELECT ST_Area(ST_SymDifference(b.geom, poly.geom)) AS symmetric_area
FROM b, poly;
