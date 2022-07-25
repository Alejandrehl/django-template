# Envios Gallo Negro Backend V2

Backend created using Django Rest Framework, Docker &amp; PostgreSQL :rocket:

## Docker Compose

1. Run all commands through Docker Compose
   - Example: `docker-compose run --rm app sh -c "python manage.py collectstatic"`
   - `docker-compose` runs a Docker Compose command
   - `run` will start a specific container defined in config
   - `--rm removes the container`
   - `app` is the name of the service
   - `sh .c` passes in a shell command
   - Command to run inside container
