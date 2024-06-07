# MP2 WordPress Plugin

## Description

This project sets up a Dockerized WordPress instance with PHPUnit testing capabilities and includes a custom WordPress plugin.

## Prerequisites

- Docker
- Docker Compose

## Setup Instructions

### Clone the Repository

1. First, clone the repository to your local machine:

```sh
git clone https://github.com/mytech-today-now/MP2.git
cd MP2
```

2. Launch Docker Desktop

3. Spin up the instance from scratch:
```sh
docker-compose up --build
```

To stop and remove the instance and network, use:

```sh
docker-compose down
```