# Good old memories v62

### What is the purpose of this repack?
1. Easy setup for modern machines (via Docker).

### Security Concerns
1. This repack is based on some 10+ years deprecated libraries.
2. A lot of places use default credentials which will lead to data breach.

### Setting up database server
```sh
docker compose up dbserver
```

### Setting up world/channel/login server
1. Extract `wz.7z`
2. Modify settings in `db.properties` and `world.properties`
3. Start server
```sh
docker compose up worldserver
docker compose up channelserver
docker compose up loginserver
```

### Setting up adminer for database management (optional)
```sh
docker compose up adminer
```

### What is this repack based on?
- [XiuzSource](https://forum.ragezone.com/threads/v62-xiuzsource-3-4.598816/)

### Project Status
1. Server side runs on docker.
