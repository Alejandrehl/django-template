# Envios Gallo Negro Backend V2

Backend created using Django Rest Framework, Docker &amp; PostgreSQL :rocket:

## How to start?

1. Clone Repository: `git clone ...`
2. Build Docker Compose: `docker-compose build`
3. Start Services: `docker-compose up`

After add a new dependency you need to restart all services:

1. Stop Services: `docker-compose down`
2. Build Docker Compose: `docker-compose build`
3. Start Services: `docker-compose up`

## Libraries & Dependencies :toolbox:

1. [Django](https://pypi.org/project/Django/)
2. [Django Rest Framework](https://www.django-rest-framework.org/)
3. [Flake8](https://pypi.org/project/flake8/): Python linter.
   - Flake8 config file: `app/.flake8`
   - Command to run Flake8: `docker-compose run --rm app sh -c "flake8"`
4. [Psycopg2](https://pypi.org/project/psycopg2/): PostgreSQL driver.

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
3. Create Django project: `docker-compose run --rm app sh -c "django-admin startproject app ."`
4. Start services: `docker-compose up`
5. Create a new `core` app: `docker-compose run --rm app sh -c "python manage.py startapp core"`

# Github Actions :rocket:

- Automation tool
- Similar to Travis-CI, Gitlab CI/CD, Jenkins
- Run jobs when code changes
- Automate tasks

### Common uses

1.  Deployment
2.  Code linting
3.  Unit Tests

### How it works?

1. Trigger: Push to Github.
2. Job: Run unit tests.
3. Result: Success or fail.

### Pricing

- Charged per minutes
- 2000 free minutes
- Various plans available

### How we'll configure Github Actions?

1. Create a config file at `.github/workflows/checks.yml`
   - Set trigger
   - Add steps for running testing and linting
2. Configure Docker Hub Auth

### Docker Hub

1. Needed to pull base images
2. Rate limits
   - Anonymous: 100/6h
   - Authenticated: 200/6h
3. GitHub Actions uses shared IP addresses
   - Limit applied to all users
4. Authenticate with Docker Hub
   - 200 pulls per 6h all to ourselves
   - More than enough for most projects
5. Additional plans available

### How to authenticate with Docker Hub?

1. Register account on [https://hub.docker.com/](https://hub.docker.com/)
2. Use docker login during our job
3. Add secrets to GitHub project

# Django Test Framework

Out of the box in Django.

1. Based on the unittest library
2. Django adds features
   - Test client - dummy web browser
   - Simulate authentication
   - Temporary database
3. Django Rest Framework adds features|
   - API test client

### Where do you put tests?

1. Placeholder tests.py added to each app
2. Or, creaye tests/ subdirectory to split tests up
3. Keep in mind:
   - Only use `tests.py` or `tests/` directory (not both)
   - Test modules start with `test_`
   - Test directories must contain `__init__.py`

### Test database

1. Test code that uses the DB
2. Specific database for tests
   - Cycle: Runs test -> Clears data -> Runs tests -> Clears data -> etc
3. Happends for every test (by default)

### Test classes

1. SimpleTestCase
   - No database integration
   - Usefulf if no database is required for yout test
   - Save time executing tests
2. TestCase
   - Database integration
   - Useful for testing code that uses the database

### Writing tests

1. Import test class
   - SimpleTestCase - No Database
   - TestCase - Database
2. Import objects to test
3. Define test class
4. Add test method
5. Setup inputs
6. Execute code to be tested
7. Check output

```python
"""
Unit tests for views
"""

from django.test import SimpleTestCase

from app_two import views

class ViewTests(SimpleTestCase):

   def test_make_list_unique(self):
      """ Test making a list unitque. """
      sample_items = [1, 1, 2, 2, 3, 4, 5, 5]

      res = views.remove_duplicates(sample_items)

      self.assertEqual(res, [1, 2, 3, 4, 5])
```

### Mocking

- Override or change behavior of dependencies
- Avoid unintended side effects
- Isolate code being tested

### Why use mocking?

1.  Avoid relying on external services
    - Can't guarantee they will be available
    - Makes tests unpredicable and inconsistent
2.  Avoid unintended consequences
    - Accidentally sending emails
    - Overloading external services

Example: Sending an email

1.  Register user
2.  Create in DB
3.  Send welcome email -> This process can fail for too many reasons.

- Prevent email send
- Ensure `send_welcome_email()` called correctly

### How to mock code?

1. Use `unittest.mock`
   - `MagicMock / Mock` - Replace real objects
   - `patch`- Overrides code for tests

## Testing APIs

- Make actual requests
- Check result

### Django REST Framework APIClient

- Based on the Django's TestClient
- Make requests
- Check result
- Override authentication

### Using the APIClient

1. Import `APIClient`
2. Create client
3. Make request
4. Check result

```python
from django.test import SimpleTestCase
from rest_framework.test import APIClient

class TestViews(SimpleTestCase):

   def test_get_greetings(self):
      """ Test getting greetings """
      client = APIClient()
      res = client.get('/greetings/')

      self.assertEqual(res.status_code, 200)
      self.assertEqual(res.data, ["Hello!", "Bonjour!", "Hola!"])

```

## Database

1. Configure Django in `settings.py`
   - Tell Django how to connect
2. Install database adaptor dependencies
   - Install the tool Django uses to connect
3. Update Python requirements

### Django needs to know...

1. Engine (Type of database)
2. Hostname (IP or domain name for database)
3. Port
4. Database Name
5. Username
6. Password

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': os.environ.get('DB_HOST'),
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
    }
}
```
