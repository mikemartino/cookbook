from __future__ import annotations

from decimal import Decimal

from pydantic.dataclasses import dataclass
from datetime import datetime
from datetime import timedelta
from enum import Enum
from typing import List, Dict, Any, Optional


@dataclass
class Cook:
    first_name: str
    last_name: str
    email: str


@dataclass
class Ingredient:
    name: str
    quantity: str

    def __str__(self):
        return f"{self.name} ({self.quantity})"


@dataclass
class Recipe:
    name: str
    preface: str
    cook: Cook
    created_at: datetime
    cook_time: timedelta
    instructions: List[str]
    ingredients: List[Ingredient]

    @staticmethod
    def from_row(row: Dict[Any, Any]) -> Recipe:
        cook = Cook(first_name=row['first_name'], last_name=row['last_name'], email=row['email'])
        ingredients: List[Ingredient] = list()

        for ingredient_str in row['ingredients']:
            ingredient_name, ingredient_quantity = ingredient_str.split('(')
            ingredients.append(Ingredient(ingredient_name.strip(), ingredient_quantity.replace(')', '')))

        return Recipe(name=row['name'], cook=cook, preface=row['preface'],
                      created_at=row['created_at'], cook_time=row['cook_time'],
                      instructions=row['instructions'], ingredients=ingredients)

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

    def __str__(self):
        return f"Name: {self.name}\n" \
               f"Cook: {self.cook.first_name} {self.cook.last_name} ({self.cook.email})\n" \
               f"Cook time: {self.cook_time}\n" \
               f"Created on: {datetime.strftime(self.created_at, '%c')} \n" \
               f"Preface: {self.preface} \n\n" \
               f"Ingredients: \n{self.join_ingredients()}\n"\
               f"Instructions: \n{self.join_instructions()}\n"
