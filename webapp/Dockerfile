FROM python:3.7

RUN mkdir /app
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

ENV ENVIRONMENT=DEV HOST=localhost PORT=8080 REDIS_HOST=localhost REDIS_PORT=6379 REDIS_DB=0

EXPOSE 8080

CMD ["python", "hello.py"]