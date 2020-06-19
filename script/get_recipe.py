from recipebook.service.recipe_service import RecipeService


def main():
    recipe_service = RecipeService()
    recipe_service.get_by_name("Chickpea Burgers")


if __name__ == '__main__':
    main()
