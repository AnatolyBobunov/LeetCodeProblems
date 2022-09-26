FROM python:3.10-slim

ENV POETRY_VERSION=1.2.1
ENV POETRY_VIRTUALENVS_CREATE=false
ENV PATH=$PATH:/LeetCodeProblems
ENV POETRY_HOME=/opt/poetry
ENV PATH="$POETRY_HOME/bin:$PATH"

WORKDIR ./LeetCodeProblems
COPY pyproject.toml .

RUN apt-get update && apt-get install --no-install-recommends -y python3-pip python3-dev \
    && apt-get -y autoremove --purge && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt

RUN pip install --upgrade pip \
    && pip install setuptools \
    && pip install poetry==$POETRY_VERSION \
    && poetry install

CMD ["/bin/bash"]
