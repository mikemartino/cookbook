import psycopg2


class RecipeService:
    def __init__(self):
        pass

    def get(self):
        with psycopg2.connect("dbname=postgres user=postgres") as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM recipebook.cook;")
                result = cur.fetchone()
                print(result)

        conn.close()
