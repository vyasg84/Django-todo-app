FROM python:3.8.12-buster
#Python outputs are sent straight to the container logs
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY . .
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install libpq-dev gcc -y && \
    pip3 install --upgrade pip && \
    #Psycopg2 driver that Django uses to access the database
    pip install psycopg2-binary && \
    pip3 install -r requirements.txt --no-cache-dir && \
    apt-get clean
CMD python3 manage.py migrate && \
    python3 manage.py collectstatic --noinput && \
    gunicorn todoapp.wsgi --bind 0.0.0.0:8000
