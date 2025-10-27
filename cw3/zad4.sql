INSERT INTO obiekty (id, nazwa, geom)
SELECT 7, 'obiekt7', ST_Union(
    (SELECT geom FROM obiekty WHERE id = 3),
    (SELECT geom FROM obiekty WHERE id = 4)
);
SELECT id, nazwa, ST_AsText(geom) AS geom_text
FROM obiekty;