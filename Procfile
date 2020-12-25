web: flask db upgrade; flask translate compile; gunicorn seeder:app
worker: rq worker seeder-tasks
