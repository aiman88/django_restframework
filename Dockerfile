FROM python:3

RUN pip install --upgrade pip && \
    pip install --no-cache-dir django djangorestframework
RUN python --version

ARG PROJECT_DIR=/var/www/django_restframework

RUN mkdir -p $PROJECT_DIR
COPY myproject $PROJECT_DIR

RUN cd /var/www/django_restframework 
#RUN python /var/www/django_restframework/manage.py runserver

#CMD "/bin/sh"

WORKDIR /var/www/django_restframework

RUN pwd

# Server
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]