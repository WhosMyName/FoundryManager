FROM python:3.9-slim-buster

# make some fine labels
LABEL maintainer="chikangwu95@gmail.com"
LABEL name="FoundryMetaManager-App"
LABEL description="This container provides the APP for 'FoundryMetaManager'"

# set python envs
ENV LANG=C.UTF-8 LC_ALL=C:UTF-8
ENV PYTHONPATH /home/fmm/
ENV POETRY_NO_INTERACTION=1
ENV POETRY_VIRTUALENVS_CREATE=false
ENV POETRY_VERSION=1.1.8
ENV PATH="/home/fmm/.local/bin:${PATH}"

RUN apt-get update

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait

RUN groupadd fmm && useradd -r -m -g fmm fmm
RUN mkdir -p /home/fmm/app
RUN chown -R fmm:fmm /home/fmm/app
USER fmm
WORKDIR /home/fmm/app

COPY pyproject.toml .
COPY poetry.lock .
RUN pip install --user "poetry==${POETRY_VERSION}"
RUN poetry install

COPY backend/ .
