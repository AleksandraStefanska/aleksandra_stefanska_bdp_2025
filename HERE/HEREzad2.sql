-- 1. Nowe POI (z 2019, których nie było w 2018)
WITH new_poi AS (
  SELECT p.*
  FROM T2019_KAR_POI_TABLE p
  LEFT JOIN T2018_KAR_POI_TABLE q
    ON ST_Equals(p.geom, q.geom)
  WHERE q.geom IS NULL
)

-- 2. Zliczanie nowych POI w promieniu 500 m od nowych/przebudowanych budynków
SELECT p.type,
       COUNT(DISTINCT p.poi_id) AS new_poi_count
FROM new_poi p
JOIN changed_buildings_2018_2019 b
  ON ST_Distance(p.geom, b.geom) <= 500
GROUP BY p.type
ORDER BY new_poi_count DESC;
