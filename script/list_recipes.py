from recipebook.service.recipe_service import RecipeService


def main():
    recipe_service = RecipeService()
    recipes = recipe_service.list_recipes()
    [print(r) for r in recipes]


if __name__ == '__main__':
    main()
