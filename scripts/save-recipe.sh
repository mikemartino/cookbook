#!/bin/bash

poetry install
poetry build
poetry run save-recipe