from recipebook.cookbook import Cookbook
from recipebook.ingredient import Ingredient
from recipebook.recipe import Recipe, Time


def main():
    cookbook = Cookbook()
    print(cookbook.table_of_contents.pretty_print())

    # cookbook.recipes.append(Recipe("Chickpea Burgers", Time(45, Time.Unit.MINUTES)))
    # cookbook.recipes.append(Recipe("Black Bean Burgers", Time(45, Time.Unit.MINUTES)))
    # cookbook.recipes.append(Recipe("Homemade Sesame Seed Hamburger Buns", Time(2, Time.Unit.HOURS)))

    save_a_recipe(cookbook)

    print(cookbook.table_of_contents.pretty_print())

    for recipe in cookbook.recipes:
        print(recipe)


def save_a_recipe(cookbook: Cookbook) -> Cookbook:
    recipe = Recipe("Sweet Potato Hash and Poached Egg", Time(20, Time.Unit.MINUTES))

    recipe.ingredients = [
        Ingredient("Olive oil", 1, Ingredient.UnitOfMeasurement.Tablespoons),
        Ingredient("Large sweet potato", 0.5, Ingredient.UnitOfMeasurement.NA),
        Ingredient("Medium onion", 0.5, Ingredient.UnitOfMeasurement.NA),
        Ingredient("Egg", 1, Ingredient.UnitOfMeasurement.NA),
        Ingredient("Garlic powder", 0.5, Ingredient.UnitOfMeasurement.Teaspoons),
        Ingredient("Smoked paprika", 0.5, Ingredient.UnitOfMeasurement.Teaspoons),
        Ingredient("Black pepper", 0.25, Ingredient.UnitOfMeasurement.Teaspoons),
        Ingredient("Water", 1, Ingredient.UnitOfMeasurement.Tablespoons)
    ]

    recipe.instructions = [
        "Put the burner on medium heat.",
        "Put the olive oil in the pan.",
        "Shred the onion and sweet potato using a cheese grater.",
        "Cook the onion and sweet potato mix for 5 to 7 minutes.",
        "Form the hash into a circle, making the edges slightly higher than the centre.",
        "Crack the egg into the centre of the hash.",
        "Sprinkle garlic powder, smoked paprika, and black pepper over the mix.",
        "Add a little water to the pan to steam the egg. Cover pan with lid and cook for 5 minutes.",
        "Continue to cook egg and hash until it's reached a consistency of your liking."
    ]

    cookbook.recipes.append(recipe)
    return cookbook


if __name__ == '__main__':
    main()

