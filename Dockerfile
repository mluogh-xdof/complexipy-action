FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

RUN python3 -m venv /venv && source /venv/bin/activate

RUN pip install --upgrade pip

RUN pip install complexipy==2.1.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
