# Envios Gallo Negro Backend V2

Backend created using Django Rest Framework, Docker &amp; PostgreSQL :rocket:

## Libraries & Dependencies :toolbox:

1. [Django](https://pypi.org/project/Django/)
2. [Django Rest Framework](https://www.django-rest-framework.org/)
3. [Flake8](https://pypi.org/project/flake8/): Python linter.
   - Flake8 config file: `app/.flake8`
   - Command to run Flake8: `docker-compose run --rm app sh -c "flake8"`

## Docker :whale:

1. Build current Dockerfile: `docker build .`

## Docker Compose :octopus:

1. Run all commands through Docker Compose
   - Example: `docker-compose run --rm app sh -c "python manage.py collectstatic"`
   - `docker-compose` runs a Docker Compose command
   - `run` will start a specific container defined in config
   - `--rm removes the container`
   - `app` is the name of the service
   - `sh .c` passes in a shell command
   - Command to run inside container
2. Build Docker Compose: `docker-compose build`
