# Good old memories v62

## General FAQ

#### What is the purpose of this repack?  
  * Easy setup for modern machines (via Docker).

#### What is this repack based on?  
  * [XiuzSource](https://forum.ragezone.com/threads/v62-xiuzsource-3-4.598816/)

#### Project Status  
  * Server side runs on docker.

#### Security Concerns  
  * This repack is based on some 10+ years deprecated libraries.
  * A lot of places use default credentials which will lead to data breach.

---

## Server Admin

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

---

## Developer

### How to compile
```sh
# compile
ant compile

# pack jar
ant jar

# all in one command
ant
```

### Generate javadoc
```sh
javadoc -d docs -sourcepath src -subpackages net.sf.odinms
```
