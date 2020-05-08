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

# Database

Followed initial instructions on [Docker Postgresql](https://hub.docker.com/_/postgres?tab=description) and created _init-postgres-recipebook.sh_
to initially install Postgresql using Docker.

This command can be used to subsequently run `psql`:

    docker run -e PGPASSWORD=<password> -it --rm --network <docker_network> postgres psql -h <container_name> -U postgres -d recipebook

