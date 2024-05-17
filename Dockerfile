FROM python:3.12

WORKDIR ./

COPY ./requirements.txt ./requirements.txt

RUN apt update -y \
    && apt install gcc -y\
    && apt install python3-dev -y\
    && apt install openssl -y


RUN pip install -r ./requirements.txt \
    && rm -rf /root/.cache/pip

COPY . ./