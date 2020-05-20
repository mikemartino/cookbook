CREATE SCHEMA recipebook;

-- Put new recipebook schema on the search path first.
SET search_path TO recipebook, public;
SHOW search_path;

CREATE TABLE cook (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(200) NOT NULL
);

INSERT INTO cook (first_name, last_name, email) VALUES
  ('Mike', 'Martino', 'mikemartino86@gmail.com'),
  ('Kate', 'Martino', 'kate.martin@live.ca');

