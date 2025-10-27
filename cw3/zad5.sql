SELECT id, ST_Area(ST_Buffer(geom, 5)) AS pole_bufora
FROM obiekty
WHERE NOT ST_HasArc(geom);

-- Łączne pole buforów o promieniu 5 jednostek dla obiektów bez łuków
SELECT SUM(ST_Area(ST_Buffer(geom, 5))) AS laczne_pole_buforow
FROM obiekty
WHERE NOT ST_HasArc(geom);