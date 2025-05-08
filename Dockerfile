FROM python:3.10

WORKDIR /app

RUN pip install --no-cache-dir build

COPY . /app

RUN python -m build

RUN pip install --no-cache-dir dist/*.whl

CMD ["/bin/bash"]
