FROM python:3.10 AS builder

WORKDIR /app

RUN pip install --no-cache-dir build

COPY setup.py .
COPY src/ ./src   

RUN python -m build


FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /app/dist/*.whl ./dist/

RUN pip install --no-cache-dir ./dist/*.whl && \
    rm -rf /root/.cache

CMD ["/bin/bash"]

