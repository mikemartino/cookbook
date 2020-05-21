CREATE SCHEMA recipebook;

CREATE TABLE recipebook.cook (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE recipebook.recipe (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    cook_id INT REFERENCES recipebook.cook (id) ON DELETE RESTRICT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cook_time INTERVAL,
    instructions TEXT[] NOT NULL,
    ingredients TEXT[] NOT NULL,
    preface TEXT NOT NULL
);

CREATE TABLE recipebook.image (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    data BYTEA NOT NULL
);

CREATE TABLE recipebook.recipe_image (
    recipe_id INT REFERENCES recipebook.recipe (id),
    image_id INT REFERENCES recipebook.image (id),
    PRIMARY KEY (recipe_id, image_id)
)
