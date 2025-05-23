FROM python:3.9.12-slim
LABEL maintainer=abirnag

ENV PYTHONBUFFERED 1

COPY requirements.txt ./tmp/requirements.txt
COPY requirements.dev.txt ./tmp/requirements.dev.txt
COPY app /app
WORKDIR /app
EXPOSE 8000
ARG DEV=false
RUN echo $DEV && python -m venv /py && \
    /py/bin/pip  install --upgrade pip && \
    apt-get update && apt-get install -y libpq-dev gcc  && \
    /py/bin/pip  install -r /tmp/requirements.txt && \
    if [ $DEV  ] ; \
      then \
        echo "Dev Dependencies";\
       /py/bin/pip  install -r /tmp/requirements.dev.txt;\
      fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"
USER django-user
