FROM python:3.6-alpine

RUN adduser -D seeder

WORKDIR /home/seeder

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY seeder.py config.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP seeder.py

RUN chown -R seeder:seeder ./
USER seeder

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
