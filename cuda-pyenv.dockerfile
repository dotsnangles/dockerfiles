FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ENV LC_ALL=C.utf8
ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    git wget


ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

RUN curl https://pyenv.run | bash && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc


### docker build -t cuda-pyenv:11.8.0-cudnn8-devel-ubuntu22.04 .

### run this command inside your workspace to launch a container
# docker run \
# --name=cuda-pyenv-devel \
# --network="host" \
# -itd \
# --gpus=all \
# --shm-size=16gb \
# --volume=$(pwd):/workspace \
# --volume=/var/run/docker.sock:/var/run/docker.sock \
# --volume=$(which docker):/usr/bin/docker \
# cuda-pyenv:11.8.0-cudnn8-devel-ubuntu22.04

### in vsc command palette
# Dev Containers: Attach to Running Container

### useful commands
# unminimize
# apt install man-db
# git config --global core.filemode false
# poetry config virtualenvs.in-project true