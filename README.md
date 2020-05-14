recipebook
==========

I'm writing a cookbook to learn Python, Postgresql, and other potential tools.

# Prerequisites

Install the following software.

|              pyenv             |           poetry           |
|:------------------------------:|:--------------------------:|
| https://github.com/pyenv/pyenv | https://python-poetry.org/ |


# Build

```
poetry install
poetry run example
```

# Package

```
poetry build
```

# Deploy

```
poetry publish
```

# Database Initialization

Followed initial instructions on [Docker Postgresql](https://hub.docker.com/_/postgres?tab=description).

1. Install `docker-compose`.
1. Run:
        docker-compose up -d
        docker-compose exec -e PGPASSWORD=test postgres psql -U postgres -d recipebook
