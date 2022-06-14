FROM python:3 as dev
WORKDIR /app 

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update \
    && apt install -y netcat postgresql-contrib gcc python3-dev musl-dev

RUN pip install --upgrade pip 
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY ./runapp.sh .
RUN sed -i 's/\r$//g' ./runapp.sh
RUN chmod +x ./runapp.sh

EXPOSE 8080
COPY . .


ENTRYPOINT ["./runapp.sh"]
#CMD ["./webpythonapp/manage.py", "runserver"]


