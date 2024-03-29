FROM ubuntu:20.04

USER root
ARG DEBIAN_FRONTEND=noninteractive
ARG GID=1000
ARG UID=1000
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV SHELL="/bin/bash"
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y > /dev/null && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt update -y > /dev/null && \
    apt install -y bzip2 ca-certificates curl expect ftp git gnupg && \
    apt install -y lib32stdc++6 libglib2.0-0 libmysqlclient-dev libsm6 libxext6 libxrender1 && \
    apt install -y openjdk-8-jdk openjdk-8-jdk-headless && \
    apt install -y openssh-client openssh-server psmisc && \
    apt install -y python3 python3-dev python3-pip python3-venv && \
    apt install -y sudo unzip vim wget xz-utils zip
RUN apt autoremove --purge -y > /dev/null && \
    apt autoclean -y > /dev/null && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/log/* && \
    rm -rf /tmp/*
RUN pip3 install beautifulsoup4 black colorama coverage coveralls diffmanifests flake8 && \
    pip3 install hypothesis jenkins jinja2 jira matplotlib mypy mysql numpy openpyxl && \
    pip3 install pandas paramiko pre-commit pytest python-jenkins pyyaml requests && \
    pip3 install scikit-learn scipy setuptools suds-jurko sympy tqdm twine && \
    pip3 install wheel xlrd xmltodict yattag
RUN echo "alias pip=pip3" | tee --append /etc/bash.bashrc && \
    echo "alias python=python3" | tee --append /etc/bash.bashrc && \
    echo "StrictHostKeyChecking no" | tee --append /etc/ssh/ssh_config && \
    echo "craftslab ALL=(ALL) NOPASSWD: ALL" | tee --append /etc/sudoers && \
    echo "dash dash/sh boolean false" | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash && \
    groupadd -g $GID craftslab && \
    useradd -d /home/craftslab -ms /bin/bash -g craftslab -u $UID craftslab

USER craftslab
WORKDIR /home/craftslab
CMD ["/bin/bash"]
