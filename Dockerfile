FROM python:latest

WORKDIR /app/

ENV FLASK_APP=app.py

ENV FLASK_RUN_HOST=0.0.0.0

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts

RUN chmod +x /scripts/wait-for-it.sh

ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]

CMD ["python","app.py",flaskapp", "runserver", "--host=0.0.0.0", "threaded"]

EXPOSE 5000
