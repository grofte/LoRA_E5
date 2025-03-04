FROM nvidia/cuda:12.2.2-runtime-ubuntu22.04

RUN <<EOT
apt-get update
apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv
rm -rf /var/lib/apt/lists/*
EOT

COPY ./script/requirements.txt ./app/requirements.txt

RUN pip install -r ./app/requirements.txt

# Don't run your app as root.
# RUN <<EOT
# groupadd -r app
# useradd -r -d /app -g app -N app
# EOT

WORKDIR /app/script

CMD [ "bash", "./run.sh" ]
