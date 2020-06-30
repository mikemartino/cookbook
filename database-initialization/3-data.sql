SET search_path TO recipebook;

INSERT INTO cook (first_name, last_name, email) VALUES
('Mike', 'Martino', 'mikemartino86@gmail.com'),
('Brian', 'Alder', 'brian.alder@gmail.ca'),
('Kate', 'Martino', 'kate.martin@live.ca');

CALL save_recipe(
  'Joe', 'Fresh', 'joe@loblaws.com',
  'Cherry Pie', '1 hour', 'Yum. Cherry pie.',
  ARRAY['Make.', 'Bake.', 'Eat.'],
  '(0, Pie crust, 1, large, 1)',
  '(0, Cherry Pie Filling, 1, can, 2)',
  '(0, Whip Cream, 2, Tbps, 3)'
);

CALL save_recipe(
  'Mike', 'Martino', 'mikemartino86@gmail.com',
  'Chickpea Burgers', '45 minutes', 'This is one of my all time favourite recipes. Chickpeas, peanut butter, and pickles. Nothing fucking better.',
  ARRAY [
    'Open, drain, and rinse chickpeas in a colinder.',
    'Put chickpeas in a bowl and mash with a potato masher.',
    'Add in oatmeal, red onion, zucchini, peanut butter, cilantro, siracha, cumin, garlic powder, and red wine vinegar and mix together.',
    'Make 6 to 8 patties.',
    'Bring BBQ to medium heat (5 minute preheat).',
    'Gently place patties on BBQ grill.',
    'Cook about 8 to 10 minutes on one side and 6 to 8 minutes on other side.',
    'Serve on hamburger buns topped with pickles, red onion, and mayonaise.'
  ],
  '(0, Chickpeas, 1, can, 1)',
  '(0, Oatmeal, 1, cup, 2)',
  '(0, "Red onion", 0.5, medium, 3)',
  '(0, Zucchini, 1, medium, 4)',
  '(0, "Peanut butter", 3, tbsp, 5)',
  '(0, Cilantro, 2, tbsp, 6)',
  '(0, Siracha, 1, tbsp, 7)',
  '(0, Cumin, 1, tsp, 8)',
  '(0, "Garlic powder", 1, tsp, 9)',
  '(0, "Red wine vinegar", 2, tbsp, 10)',
  '(0, "Olive oil", 2, tbsp, 11)',
  '(0, Pickles, 1, sliced, 12)',
  '(0, Mayonaise, 1, tbsp, 13)'
);


