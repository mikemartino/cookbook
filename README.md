Recipebook
==========

I'm writing a cookbook to learn Python, Postgresql, and other potential tools.

# Prerequisites

Install the following software.

`pyenv`: https://github.com/pyenv/pyenv <br/>
`poetry`: https://python-poetry.org/ <br/>
`docker-compose`: https://docs.docker.com/compose/install/


# Commands

#### Build
```
poetry install
poetry run example
```
#### Package
```
poetry build
```

#### Deploy to PyPi
```
poetry publish
```

# Database Initialization
```    
cd recipebook
docker-compose up -d # Takes a minute to start up after detaching
```

# Browse database
1. Log into the database container using `psql`:

        docker-compose exec -e PGPASSWORD=postgres postgres psql -U postgres -d postgres

1. In the `psql` prompt, prepend the _recipebook_ schema to your `search_path` to avoid referring to the namespace everywhere:

        SELECT set_config('search_path', 'recipebook, '||current_setting('search_path'), false);

# Teardown
Run _one_ of these commands:
    
    # Does not remove Docker volumes (data)
    docker-compose down   

    # Removes Docker volumes
    docker-compose down -v
