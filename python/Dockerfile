FROM debian:12.1-slim
USER root

RUN apt-get -y update \
  && apt-get install -y \
  git \
  make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  gettext \
  libcairo2 \
  libgdk-pixbuf2.0-0 \
  liblcms2-2 \
  libopenjp2-7 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libxml2 \
  libpq5 \
  shared-mime-info \
  mime-support \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# add python user
RUN set -xe; \
  groupadd --gid 1000 python && \
  useradd --uid 1000 --gid 1000 --create-home python

RUN mkdir -p /var/www && \
  chown -R 1000:1000 /var/www/

USER python
ENV HOME=/home/python
WORKDIR /home/python

# install pyenv
RUN set -xe; \
  curl https://pyenv.run | bash && \
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# install python
ARG PYTHON_VERSION
RUN set -xe; \
  ~/.pyenv/bin/pyenv install ${PYTHON_VERSION} && \
  eval "$(~/.pyenv/bin/pyenv init -)" && ~/.pyenv/bin/pyenv global ${PYTHON_VERSION}

# install poetry
RUN set -xe; \
  curl -sSL https://install.python-poetry.org | python3 - && \
  echo 'export PATH="~/.local/bin:$PATH"' >> ~/.bashrc && \
  . ~/.bashrc

EXPOSE 8000
ENV PYTHONUNBUFFERED 1

WORKDIR /var/www
