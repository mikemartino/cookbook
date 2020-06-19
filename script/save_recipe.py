from datetime import timedelta, datetime

from recipebook.cookbook import Cookbook
from recipebook.model import Ingredient, Recipe, Cook


def main():
    # cookbook.recipes.append(Recipe("Black Bean Burgers", Time(45, Time.Unit.MINUTES)))
    # cookbook.recipes.append(Recipe("Homemade Sesame Seed Hamburger Buns", Time(2, Time.Unit.HOURS)))

    cook = Cook(first_name="Mike", last_name="Martino", email="mikemartino86@gmail.com")

    instructions = [
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

    ingredients = [
        Ingredient("Large sweet potato", 0.5),
        Ingredient("Medium onion", 0.5),
        Ingredient("Egg", 1),
        Ingredient("Garlic powder", 0.5, "tsp"),
        Ingredient("Smoked paprika", 0.5, "tsp"),
        Ingredient("Black pepper", 0.25, "tsp"),
        Ingredient("Water", 1, "tbsp")
    ]

    recipe = Recipe(name="Sweet Potato Hash and Poached Egg", cook=cook, created_at=datetime.now(),
                    cook_time=timedelta(minutes=20), instructions=instructions, ingredients=ingredients)

    return recipe

if __name__ == '__main__':
    main()
