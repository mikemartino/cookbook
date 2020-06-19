import psycopg2
import psycopg2.extras

from recipebook.model import Recipe, Cook


class RecipeService:
    def __init__(self, host="localhost", dbname="postgres", user="postgres", password="postgres", schema="recipebook"):
        self.conn_str = \
            f"host='{host}' dbname='{dbname}' user='{user}' password='{password}' options='-c search_path={schema}'"

    def get_by_name(self, name) -> Recipe:
        """Get a recipe by name."""
        try:
            with psycopg2.connect(self.conn_str, cursor_factory=psycopg2.extras.DictCursor) as conn:
                with conn.cursor() as cur:
                    cur.execute("SELECT * FROM recipe JOIN cook ON (recipe.cook_id = cook.id) WHERE recipe.name = %s;",
                                (name,))

                    row = cur.fetchone()
                    recipe = Recipe.from_row(row)

                    print(recipe)
                    return recipe
        finally:
            conn.close()

    def save(self, recipe: Recipe):
        """Save a recipe."""
        try:
            with psycopg2.connect(self.conn_str, cursor_factory=psycopg2.extras.DictCursor) as conn:
                with conn.cursor() as cur:
                    cur.execute("SELECT * FROM recipe JOIN cook ON (recipe.cook_id = cook.id) WHERE recipe.name = %s;",
                                (name,))

                    row = cur.fetchone()
                    recipe = Recipe.from_row(row)

                    print(recipe)
                    return recipe
        finally:
            conn.close()
