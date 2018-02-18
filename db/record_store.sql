DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) not null,
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  stock_level INT not null

);
