SET search_path TO recipebook;

-- Save a recipe.
-- Takes a cook's first name, last name, and email. Also takes their recipe name, cook time, recipe instructions and small blurb for the recipe (preface).
    CREATE OR REPLACE PROCEDURE save_recipe
      (
      first_name COOK.FIRST_NAME%TYPE,
      last_name COOK.LAST_NAME%TYPE,
      email COOK.EMAIL%TYPE,
      recipe_name RECIPE.NAME%TYPE,
      recipe_cook_time RECIPE.COOK_TIME%TYPE,
      recipe_preface RECIPE.PREFACE%TYPE,
      instructions RECIPE.INSTRUCTIONS%TYPE,
      VARIADIC ingred INGREDIENT[]
      )
    AS $$
    DECLARE
      cook_id COOK.ID%TYPE;
      recipe_id RECIPE.ID%TYPE;
      ingredient_ids INT[];
    BEGIN

      INSERT INTO cook (first_name, last_name, email)
        VALUES (first_name, last_name, email)
        RETURNING id INTO cook_id;

      INSERT INTO recipe (name, cook_id, created_at, cook_time, instructions, preface)
        VALUES (recipe_name, cook_id, now(), recipe_cook_time, instructions, recipe_preface)
        RETURNING id INTO recipe_id;


      INSERT INTO ingredient (name, quantity, unit, display_order)
        SELECT i.name, i.quantity, i.unit, i.display_order
        FROM unnest(ingred) i
        RETURNING id into ingredient_ids;

      COMMIT;

      RAISE NOTICE 'Cook ID : %', cook_id;
      RAISE NOTICE 'Recipe ID : %', recipe_id;

    END;
    $$
    LANGUAGE plpgsql;
