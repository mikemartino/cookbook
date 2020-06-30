from recipebook.service.recipe_service import RecipeService


def main():
    recipe_service = RecipeService()
    recipe = recipe_service.get_by_name("Chickpea Burgers")
    print(recipe)


if __name__ == '__main__':
    main()
