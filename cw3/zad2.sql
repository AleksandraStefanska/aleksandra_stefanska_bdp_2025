-- Wyznaczenie najkrótszej linii
WITH najkrotsza_linia AS (
    SELECT ST_ShortestLine(o3.geom, o4.geom) AS geom
    FROM obiekty o3
    JOIN obiekty o4 ON o3.id = 3 AND o4.id = 4
)
-- Tworzenie bufora i liczenie powierzchni
SELECT ST_Area(ST_Buffer(geom, 5)) AS pole_bufora
FROM najkrotsza_linia;
