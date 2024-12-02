FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y -q \
    python-all \
    python-pip \
    && apt-get clean

COPY requirements.txt /tmp/

RUN pip install -qr /tmp/requirements.txt


RUN mkdir -p /opt/webapp

COPY . /opt/webapp

WORKDIR /opt/webapp

EXPOSE 5000

CMD ["python", "app.py"]
