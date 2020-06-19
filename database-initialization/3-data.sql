SET search_path TO recipebook;

--INSERT INTO cook (first_name, last_name, email) VALUES
--('Mike', 'Martino', 'mikemartino86@gmail.com'),
--('Brian', 'Alder', 'brian.alder@gmail.ca'),
--('Kate', 'Martino', 'kate.martin@live.ca');

    CALL save_recipe(
      first_name => 'Joe',
      last_name => 'Fresh',
      email => 'joe@loblaws.com',
      recipe_name => 'Cherry Pie',
      recipe_cook_time => '1 hour',
      recipe_preface =>'I love cherry pie.',
      instructions => ARRAY['Make.', 'Bake.', 'Eat.'],
      variadic ingred => ARRAY[
        '(0, Apple, 2, small, 1)',
        '(0, Pear, 5, large, 2)',
        '(0, Cherry, 20, "small, pitted", 1)'
        ]::INGREDIENT[]
    );

--INSERT INTO recipe (name, cook_id, cook_time, instructions, preface) VALUES
--  (
--    'Chickpea Burgers',
--    1,
--    '45 minutes',
--    ARRAY [
--      'Open, drain, and rinse chickpeas in a colinder.',
--      'Put chickpeas in a bowl and mash with a potato masher.',
--      'Add in oatmeal, red onion, zucchini, peanut butter, cilantro, siracha, cumin, garlic powder, and red wine vinegar and mix together.',
--      'Make 6 to 8 patties.',
--      'Bring BBQ to medium heat (5 minute preheat).',
--      'Gently place patties on BBQ grill.',
--      'Cook about 8 to 10 minutes on one side and 6 to 8 minutes on other side.',
--      'Serve on hamburger buns topped with pickles, red onion, and mayonaise.'
--    ],
--  'This is one of my all time favourite recipes. Chickpeas, peanut butter, and pickles. Nothing fucking better.'
--);

--INSERT INTO ingredient (name, quantity, unit, display_order) VALUES
--    ('Chickpeas', 1, 'can', 1),
--    ('Oatmeal', 1, 'cup', 2),
--    ('Red onion', 0.5, 'medium', 3),
--    ('Zucchini', 1, 'medium', 4),
--    ('Peanut butter', 1, 'can', 5),
--    ('Cilantro', 2, 'tbsp', 6),
--    ('Siracha', 1, 'tbsp', 7),
--    ('Cumin', 1, 'tps', 8),
--    ('Garlic powder', 1, 'tps', 9),
--    ('Red wine vinegar', 2, 'tbsp', 10),
--    ('Olive oil', 2, 'tbsp', 11),
--    ('Pickles', 1, 'sliced', 12),
--    ('Mayonaise', 1, 'tbsp', 13)
--;



