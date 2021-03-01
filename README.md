# python3docker

[![Docker](https://img.shields.io/docker/pulls/craftslab/python3docker)](https://hub.docker.com/r/craftslab/python3docker)
[![License](https://img.shields.io/github/license/craftslab/python3docker.svg?color=brightgreen)](https://github.com/craftslab/python3docker/blob/master/LICENSE)
[![Tag](https://img.shields.io/github/tag/craftslab/python3docker.svg?color=brightgreen)](https://github.com/craftslab/python3docker/tags)



## Introduction

*Python3 Docker* is the Dockerfile for Python3 built on Ubuntu.



## Build

```bash
docker build --no-cache -f Dockerfile -t craftslab/python3docker:latest .
```



## Deploy

```bash
docker pull craftslab/python3docker:latest
```



## Run

```bash
docker run -i -t --rm craftslab/python3docker:latest
```



## Reference

- [Publishing Docker images](https://docs.github.com/en/actions/guides/publishing-docker-images)
