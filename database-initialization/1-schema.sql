CREATE SCHEMA recipebook;

SET search_path TO recipebook;

-- COOK
CREATE TABLE cook (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    CONSTRAINT unq_email UNIQUE (email)
);

-- INGREDIENT
CREATE TABLE ingredient (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    quantity NUMERIC NOT NULL,
    unit TEXT
);

-- RECIPE
CREATE TABLE recipe (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    cook_id INT REFERENCES cook (id) ON DELETE RESTRICT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cook_time INTERVAL,
    instructions TEXT[] NOT NULL,
    preface TEXT NOT NULL
);

-- RECIPE to INGREDIENT
CREATE TABLE recipe_ingredient (
    recipe_id INT REFERENCES recipe (id),
    ingredient_id INT REFERENCES ingredient (id),
    display_order INT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id)
);

-- IMAGE
CREATE TABLE image (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    data BYTEA NOT NULL
);

-- RECIPE to IMAGE
CREATE TABLE recipe_image (
    recipe_id INT REFERENCES recipe (id),
    image_id INT REFERENCES image (id),
    PRIMARY KEY (recipe_id, image_id)
);

CREATE VIEW recipe_details AS
  SELECT r.id AS recipe_id, r.name AS recipe_name, r.created_at, r.cook_time, r.instructions, r.preface,
         c.id AS cook_id, c.first_name AS cook_first_name, c.last_name AS cook_last_name, c.email
  FROM recipe AS r, cook AS c
  WHERE r.cook_id = c.id;

