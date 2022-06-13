FROM python:3
WORKDIR /code 
COPY requirements.txt /code/
RUN pip install -r requirements.txt
EXPOSE 8080
COPY . /code/
#ENTRYPOINT ["python3"]
#CMD ["./webpythonapp/manage.py", "runserver"]
