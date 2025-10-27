CREATE TABLE obiekty (
  id SERIAL PRIMARY KEY,
  nazwa TEXT NOT NULL,
  geom geometry 
);

--a
INSERT INTO obiekty (nazwa, geom)
VALUES (
	'obiekt1',
	ST_GeomFromText(
        'COMPOUNDCURVE(
            (0 1, 1 1),
            CIRCULARSTRING(1 1, 2 0, 3 1),
            CIRCULARSTRING(3 1, 4 2, 5 1),
			(5 1, 6 1)
        )',
    0
  )
);


--b
INSERT INTO obiekty (nazwa, geom)
VALUES (
  'obiekt2',
  ST_GeomFromText(
    'CURVEPOLYGON(
        COMPOUNDCURVE(
            (10 6, 14 6),
            CIRCULARSTRING(14 6, 16 4, 14 2),
            CIRCULARSTRING(14 2, 12 0, 10 2),
			(10 2, 10 6)
        ),
        CIRCULARSTRING(11 2, 13 2, 11 2)
    )',
    0
  )
);



--c
INSERT INTO obiekty (nazwa, geom)
VALUES (
  'obiekt3',
  ST_GeomFromText(
    'POLYGON((7 15, 10 17, 12 13, 7 15))',
    0
  )
);

--d
INSERT INTO obiekty (nazwa, geom)
VALUES (
  'obiekt4',
  ST_GeomFromText(
    'LINESTRING(20 20, 25 25, 27 24, 25 22, 26 21, 22 19, 20.5 19.5)',
    0
  )
);

--e

INSERT INTO obiekty (nazwa, geom)
VALUES (
	'obiekt5',
	ST_GeomFromText(
	'MULTIPOINTZ((30 30 59), (38 32 234))',
	0)
);


--f
INSERT INTO obiekty (nazwa, geom)
VALUES (
    'obiekt6',
    ST_Collect(
        ARRAY[
            ST_GeomFromText('LINESTRING(1 1, 3 2)', 0),
            ST_GeomFromText('POINT(4 2)', 0)
        ]
    )
);

SELECT id, nazwa, ST_AsText(geom) AS geom_text
FROM obiekty;
TRUNCATE TABLE obiekty RESTART IDENTITY;
