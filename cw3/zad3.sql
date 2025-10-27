-- warunek zamiany obiektu na poligon jest taki, że obiekt musi być zamknięty 
-- Zamknięcie linii (jeśli nie jest zamknięta)
UPDATE obiekty
SET geom = ST_AddPoint(geom, ST_StartPoint(geom))
WHERE id = 4 AND NOT ST_IsClosed(geom);

UPDATE obiekty
SET geom = ST_MakePolygon(geom)
WHERE id = 4 AND ST_IsClosed(geom);

SELECT id, nazwa, ST_AsText(geom) AS geom_text
FROM obiekty;