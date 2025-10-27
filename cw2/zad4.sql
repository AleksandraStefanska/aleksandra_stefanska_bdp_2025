CREATE TABLE buildings (
  id serial PRIMARY KEY,
  name text,
  geom geometry(Polygon, 0)     -- SRID=0 (niezdefiniowany) - możesz zmienić na 2180 jeśli chcesz metry
);

CREATE TABLE roads (
  id serial PRIMARY KEY,
  name text,
  geom geometry(LineString, 0)
);

CREATE TABLE poi (
  id serial PRIMARY KEY,
  name text,
  geom geometry(Point, 0)
);

