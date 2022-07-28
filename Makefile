makemigrations:
	docker-compose run --rm app sh -c "python manage.py makemigrations"

migrate:
	docker-compose run --rm app sh -c "python manage.py migrate"

test:
	docker-compose run --rm app sh -c "python manage.py test && flake8"

lint:
	docker-compose run --rm app sh -c "flake8"
