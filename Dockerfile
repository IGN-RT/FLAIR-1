FROM python:3.10

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/IGN-RT/FLAIR-1.git

WORKDIR FLAIR-1

RUN pip install -e .

CMD ["/bin/bash"]
