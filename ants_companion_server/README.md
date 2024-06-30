# ants_companion_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop

```bash
$ cd ants_companion/ants_companion_server
$ docker compose up --build --detach
$ dart bin/main.dart --apply-migrations
```

```bash
serverpod generate
```

```bash
serverpod generate
serverpod apply-migration
dart bin/main.dart --apply-migrations
```
