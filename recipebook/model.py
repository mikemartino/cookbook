from __future__ import annotations

from decimal import Decimal

from pydantic.dataclasses import dataclass
from datetime import datetime
from datetime import timedelta
from enum import Enum
from typing import List, Dict, Any, Optional


@dataclass
class Cook:
    id: int
    first_name: str
    last_name: str
    email: str

    @staticmethod
    def from_row(row: Dict[Any, Any]) -> Cook:
        return Cook(id=row.get('cook_id'),
                    first_name=row.get('first_name'),
                    last_name=row.get('last_name'),
                    email=row.get('email'))


@dataclass
class Ingredient:
    name: str
    quantity: Decimal
    unit: Optional[str] = None


@dataclass
class Recipe:
    id: int
    name: str
    cook: Cook
    created_at: datetime
    cook_time: timedelta
    instructions: List[str]
    ingredients: List[Ingredient]

    @staticmethod
    def from_row(row: Dict[Any, Any]) -> Recipe:
        cook = Cook.from_row(row)


        You need to insert a lot of data into multiple tables at the same time to save a recipe (e.g. cook, recipe, join tables, etc.).
        You're going to write a stored procedure that does it all (e.g. save_recipe). You were trying to decide whether you'd
        create custom types in postgres or just use TABLE%TYPE for the function parameters. Pretty sure the latter make more sense
        for now at least. Do that. Don't second guess this decision in the morning. - You.


        return Recipe(id=row['id'], name=row['name'], cook=cook, created_at=row['created_at'],
                      cook_time=row['cook_time'], instructions=row['instructions'],
                      ingredients=row['ingredients'])

    def join_instructions(self):
        result = ""
        for i, instruction in enumerate(self.instructions, start=1):
            result += f"{i}. {instruction}\n"
        return result

    def join_ingredients(self):
        result = ""
        for ingredient in self.ingredients:
            result += f"- {ingredient}\n"
        return result
