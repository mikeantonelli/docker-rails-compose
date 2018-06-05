# docker-rails-compose

This project aims to provide an example of how to utilize Docker to build a Ruby on Rails application.

## Requirements

This documentation is being written with:

* Docker 17.01+
* Docker Compose 1.12.0+

## Usage

### Pull an Existing Docker Image

```bash
➭ docker-compose pull app
```

### Build a new Docker Image

```bash
➭ docker-compose build app
```

### Run the Application

```bash
➭ docker-compose up app
```

The container will expose port 3000 on the host machine - to see the port mapping use the command below.

```bash
➭ docker ps
CONTAINER ID        IMAGE                                      COMMAND                  CREATED             STATUS              PORTS                     NAMES
d17a963767a8        mikeantonelli/docker-rails-compose:0.1.0   "bin/rails s -b 0.0.…"   11 seconds ago      Up 14 seconds       0.0.0.0:32777->3000/tcp   docker-rails-compose_app_1
```

In the above example, the application will be available at `http://localhost:32777`.

### Run Tests

```bash
➭ docker-compose run app rspec
```
