# docker-rails-compose

This project provides an example of how to utilize Docker to build a Ruby on Rails application.

* [Requirements](#requirements)
* [Usage](#usage)
* [Contributing](#contributing)

## Requirements

This documentation is being written with:

* Docker 17.05+
* Docker Compose 1.12.0+

## Usage

* [Pull an Existing Docker Image](#pull-an-existing-docker-image)
* [Build a new Docker Image](#build-a-new-docker-image)
* [Run the Application](#run-the-application)
* [Run Tests](#run-tests)
* [Database Integration](#database-integration)
* [Developing](#developing)

### Pull an Existing Docker Image

```bash
➭ docker-compose pull app
```

### Build a new Docker Image

```bash
➭ docker-compose build app
```

There is also a convenience script in [`hooks/`](hooks/) that is used by [Docker Cloud](https://cloud.docker.com), and you can use it too:

```bash
➭ ./hooks/build
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
➭ docker-compose run test
```

There is also a convenience script in [`hooks/`](hooks/) that is used by [Docker Cloud](https://cloud.docker.com), and you can use it too:

```bash
➭ ./hooks/test
```

### Database Integration

When starting your application, the `depends_on` instruction in `docker-compose.yml` will first start a MySQL database, wait for it to become available, and then run any outstanding migrations. It is not uncommon to want to run migrations manually from time to time, so to interact with the database you can use the `db-client` service:

```bash
➭ docker-compose run db-client sh -c "bundle exec rake db:migrate"
```

If you find that you do this a lot, you could also create a utility service:

```
# docker-compose.yml
  db-migrate:
    command: sh -c "sh wait-for-mysql.sh bin/rake db:migrate"
    depends_on:
      - 'db'
    env_file:
      - ./env/database.env
    image: 'mikeantonelli/docker-rails-compose:${VERSION}'
    volumes:
      - ./docker/scripts/wait-for-mysql.sh:/opt/wait-for-mysql.sh
```

This would change the above command to:

```bash
➭ docker-compose run db-migrate
```

### Developing

Visual Studio Code configuration is provided in [`.vscode/`](.vscode/).

* Debug Ruby - start debug service in the background.
* Debug Chrome - start webpack service in the background, open Chrome.

Using this configuration you should quickly be able to:

1. Clone this project
2. Open VSCode
3. Install recommended plugins (and restart VSCode)
4. Launch the application by pressing F5, or `Debug` > `Start Debugging`.

## Troubleshooting

If you're having trouble getting started with the containers, services, and/or configuration provided in this project first try to clean the environment created by docker-compose:

```bash
➭ docker-compose down
```

In some cases, it may also be helpful to prune networks:

```bash
➭ docker network prune
```

Lastly, if you're using the VSCode configuration to start the project and you get a 500 error on initial launch, wait a brief period of time and refresh the application. This can occur when the webpack service has not yet finished compiling and your application is unable to find the asset.

## Contributing

Please feel free to log an issue or propose changes to this project. I hope that you find it helpful and would like to keep it relevant.
