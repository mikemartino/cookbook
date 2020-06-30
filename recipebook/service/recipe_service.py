from typing import List

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
                    cur.execute("SELECT * FROM recipe_details WHERE recipe_details.name = %s;", (name,))
                    row = cur.fetchone()

                    return Recipe.from_row(row)
        finally:
            conn.close()

    def list_recipes(self) -> List[str]:
        try:
            with psycopg2.connect(self.conn_str, cursor_factory=psycopg2.extras.DictCursor) as conn:
                with conn.cursor() as cur:
                    cur.execute("SELECT name FROM recipe;")
                    recipe_names = list()

                    while True:
                        row = cur.fetchone()
                        if row:
                            recipe_names.append(row['name'])
                        else:
                            break

                    return recipe_names
        finally:
            conn.close()
        pass

    def save(self, recipe: Recipe):
        """Save a recipe."""
        pass
