SET search_path TO recipebook;

-- Save a recipe.
-- Takes a cook's first name, last name, and email. Also takes their recipe name, cook time, recipe instructions and small blurb for the recipe (preface).
CREATE OR REPLACE PROCEDURE save_recipe
  (
  f_name COOK.FIRST_NAME%TYPE,
  l_name COOK.LAST_NAME%TYPE,
  eml COOK.EMAIL%TYPE,
  recipe_name RECIPE.NAME%TYPE,
  recipe_cook_time RECIPE.COOK_TIME%TYPE,
  recipe_preface RECIPE.PREFACE%TYPE,
  instructions RECIPE.INSTRUCTIONS%TYPE,
  VARIADIC ingred INGREDIENT[]
  )
AS $$
DECLARE
  c_id COOK.ID%TYPE;
  r_id RECIPE.ID%TYPE;
  i_ids INT[];
  ing INT;
BEGIN
  -- If this cook's email already exists in the database, then don't save it and just return that current cook's id.
  with temp_cook AS (
    INSERT INTO cook (first_name, last_name, email)
      VALUES (f_name, l_name, eml)
      ON CONFLICT ON CONSTRAINT unq_email DO NOTHING
      RETURNING id
  ) SELECT COALESCE (
    (SELECT id FROM temp_cook),
    (SELECT id FROM cook WHERE email = eml)
  ) into c_id;

  RAISE NOTICE 'Cook ID : %', c_id;

  -- Save the recipe details.
  INSERT INTO recipe (name, cook_id, created_at, cook_time, instructions, preface)
    VALUES (recipe_name, c_id, now(), recipe_cook_time, instructions, recipe_preface)
    RETURNING id INTO r_id;

  RAISE NOTICE 'Recipe ID : %', r_id;

  -- Save ingredients.
  WITH ins AS (
    INSERT INTO ingredient (name, quantity, unit, display_order)
      SELECT i.name, i.quantity, i.unit, i.display_order
      FROM unnest(ingred) i
      RETURNING id)
  SELECT array_agg(id) INTO i_ids
  FROM ins;

  RAISE NOTICE 'Ingredient IDs : %', i_ids;

  -- Link the ingredients to the recipe.
  FOREACH ing IN ARRAY i_ids
  LOOP
    INSERT INTO recipe_ingredient(recipe_id, ingredient_id) VALUES (r_id, ing);
  END LOOP;

  RAISE NOTICE 'Linked recipe with its ingredients.';

END;
$$
LANGUAGE plpgsql;

