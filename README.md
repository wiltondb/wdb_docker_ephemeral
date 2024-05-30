WiltonDB ephemeral Docker container
===================================

Docker container with [WiltonDB](https://wiltondb.com) server installed.

This container is intended to be used only for testing purposes. It is **ephemeral** because DB cluster is created inside the container filesystem. **All data will be lost when container is deleted**. 

Usage example:

```
git clone https://github.com/wiltondb/wdb_docker_ephemeral.git
cd wdb_docker_ephemeral
docker build . -t wiltondb1
docker run -id --name wdb1 -p 5432:5432 -p 1433:1433 wiltondb1
sqlcmd -S 127.0.0.1,1433 -U wilton -P wilton
1> select @@version
2> go
version                                                                                                          --------------------------------------------------------------------
Babelfish for PostgreSQL with SQL Server Compatibility - 12.0.2000.8
```

See details in [Running in Docker](https://github.com/wiltondb/wiltondb/wiki/Running-in-Docker) wiki page.

License information
-------------------

Build scripts in this project are released under the [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) or [PostgreSQL](https://opensource.org/license/postgresql/) license at your choice. Use is permitted under either license.
