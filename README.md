# Flamenco Manager Docker Image

Docker image for running the [Flamenco](https://flamenco.blender.org) Manager service which is used to coordinate
distributed rendering for [Blender](https://www.blender.org/) projects.

![Main](https://github.com/jrwagz/flamenco-manager-docker/actions/workflows/docker-build-publish.yaml/badge.svg)

## Building

In order to build the image simply use the following makefile target:

```bash
make build
```

## Running Locally

In order to launch the flamenco-manager service with this docker image locally you just need to run the following
makefile target:

```bash
make local_compose_up
```

And then to stop the service and tear it down run the following:

```bash
make local_compose_down
```

This simply launches the [Docker Compose](https://docs.docker.com/compose/) setup defined in
[./compose.yaml](./compose.yaml)

## Development Dependencies

The following dependencies must be installed on your development machine to properly develop this repo:

- [make](https://www.gnu.org/software/make/)
- [docker](https://www.docker.com/)

## Features

For full documentation on all of the features provided in this repo, see
[./template-features.md](./template-features.md)
