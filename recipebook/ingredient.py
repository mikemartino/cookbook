from dataclasses import dataclass
from enum import Enum, auto


@dataclass
class Ingredient:
    class UnitOfMeasurement(Enum):
        NA = "n/a"
        Ounces = "oz"
        Pounds = "lbs"
        Grams = "g"
        Kilograms = "kg"
        Millilitres = "ml"
        Cups = "cup"
        Tablespoons = "Tbsp"
        Teaspoons = "tsp"

    name: str
    quantity: float
    unit: UnitOfMeasurement

    def __init__(self, name: str, quantity: float, unit: UnitOfMeasurement):
        self.name = name
        self.quantity = quantity
        self.unit = unit

    def __repr__(self):
        return self.__str__()

    def __str__(self):
        return f"{self.name} ({self.quantity} {self.unit.value})"
