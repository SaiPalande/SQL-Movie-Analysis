-- DROP IF EXIST (for re-running)
DROP TABLE IF EXISTS ratings, movie_actors, movie_genres, actors, users, genres, movies CASCADE;

-- MOVIES
CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_year INTEGER,
  duration INTEGER
);

-- GENRES
CREATE TABLE genres (
  genre_id SERIAL PRIMARY KEY,
  genre_name TEXT
);

-- MOVIE-GENRE RELATION
CREATE TABLE movie_genres (
  movie_id INTEGER REFERENCES movies(movie_id),
  genre_id INTEGER REFERENCES genres(genre_id),
  PRIMARY KEY(movie_id, genre_id)
);

-- ACTORS
CREATE TABLE actors (
  actor_id SERIAL PRIMARY KEY,
  name TEXT
);

-- MOVIE-ACTOR RELATION
CREATE TABLE movie_actors (
  movie_id INTEGER REFERENCES movies(movie_id),
  actor_id INTEGER REFERENCES actors(actor_id),
  PRIMARY KEY(movie_id, actor_id)
);

-- USERS
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name TEXT,
  country TEXT
);

-- RATINGS
CREATE TABLE ratings (
  rating_id SERIAL PRIMARY KEY,
  movie_id INTEGER REFERENCES movies(movie_id),
  user_id INTEGER REFERENCES users(user_id),
  rating NUMERIC(2,1),
  review TEXT,
  rating_date DATE
);
