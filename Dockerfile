FROM python:3

RUN apt-get update && apt-get upgrade -y

RUN addgroup app && \
    adduser app --disabled-login --home /home/app --ingroup app

RUN python3 -m pip install flask && \
    python3 -m pip install gunicorn && \
	python3 -m pip install uwsgi

USER app

COPY app /home/app
COPY entrypoint.sh .

WORKDIR /home/app

ENTRYPOINT ["/entrypoint.sh"]
