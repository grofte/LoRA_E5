FROM nvidia/cuda:12.8.0-cudnn-runtime-ubuntu22.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

COPY ./script/requirements.txt ./app/requirements.txt
RUN pip install -r ./app/requirements.txt

WORKDIR /app/script

CMD [ "bash", "./run.sh" ]
