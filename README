
# **Docker Compose for PostgreSQL and pgAdmin**

### **Understanding the Setup**
This Docker Compose file will set up two services:
* **PostgreSQL:** The robust, open-source object-relational database system.
* **pgAdmin:** A powerful web-based administration and development tool for PostgreSQL.

By combining these two services, we create a convenient environment for managing and interacting with your PostgreSQL databases.

## **Prerequisites**
* **Docker:** Ensure Docker and Docker Compose are installed and running on your system.

## **Usage**

1. **Create a `docker-compose.yml` file** in your project directory.

	 (docker-compose.example.yml available file.)
	 
	 Here is the file example:
   ```yaml
  	
  	version: '3'
		services:
			db_pg_ava_example_dev:
				hostname: db_pg_ava_example_dev
				container_name: db_pg_ava_example_dev
				image: postgres:14.6
				restart: unless-stopped
				ports:
					- ${DB_PORT}:5432
				env_file:
					- .env
				volumes:
					- ./data/db/:/var/lib/postgresql/data/
					- ./init-database.sh:/docker-entrypoint-initdb.d/init-database.sh
					- ./init.sql:/docker-entrypoint-initdb.d/init.sql
				networks:
					default:
						ipv4_address: ${IP_ADDRESS}


			pgadmin_ava_example_dev:
				hostname: pgadmin_ava_example_dev
				container_name: pgadmin_ava_example_dev
				image: dpage/pgadmin4
				restart: always
				user: '$UID:$GID'
				env_file:
					- .env
				ports:
					- "5050:80"
				volumes:
					- ./data/pgadmin:/var/lib/pgadmin

			networks:
				default: # here we set the network name
					driver: bridge
					ipam:
						driver: default
						config:
						- subnet: ${SUBNET}
   ```

2. **Start the containers**
   ```bash
   docker-compose up -d
   ```

3. **Access pgAdmin:**
   Open a web browser and go to http://localhost:5050. Use the default credentials expecified in your .env (PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD) to log in.

### **Accessing the Database**

1. **Obtain the container ID:**
   ```bash
   docker ps
   ```
2. **Start a psql session:**
   ```bash
   docker exec -it db_pg_ava_example_dev psql -U your_postgres_user
   ```

	 or

   ```bash
   psql -H your_postgres_ip -U your_postgres_user -W
   ```


### **Creating a Database and User**
There is no need to create database if docker-entrypoint-initdb worked propertly but in case you need to create new databases, users...:

Once connected to the PostgreSQL instance, you can create a database and user using standard SQL commands:
```sql
CREATE DATABASE mydatabase;
CREATE USER myuser WITH PASSWORD 'mypassword';
GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;
```

### **Customization**
* **PostgreSQL version:** Modify the `image` value in `docker-compose.yml` to specify a different version.
* **Additional configuration:** Refer to the official PostgreSQL documentation for all available configuration options. You can set them via environment variables or by mounting a custom `postgresql.conf` file.
* **Data persistence:** The mounted volume in `docker-compose.yml` ensures data persistence.

### **Best Practices**
* **Security:**
   * Use strong, unique passwords.
   * Consider using environment variables to store sensitive information like passwords.
   * Restrict access to the database using a firewall.
* **Backup:** Regularly back up your database to prevent data loss.
* **Scalability:** For larger workloads, explore PostgreSQL clustering or managed database services.

### **Additional Considerations**
* **Networking:** If you have multiple containers, consider using Docker networks for communication.
* **Healthchecks:** Implement healthchecks to monitor the database's health.
* **Monitoring:** Use tools like Prometheus and Grafana to monitor resource usage and performance.

### **Additional Features**
* **Init script:** For more complex setups, create an init script to initialize the database on startup.
* **Configuration from environment:** Use environment variables to customize various aspects of the PostgreSQL configuration.
* **Data seeding:** Seed the database with initial data using scripts or Docker entrypoints.


## **References**
* **PostgreSQL documentation:** [https://www.postgresql.org/docs/](https://www.postgresql.org/docs/)
* **Docker PostgreSQL image:** [https://hub.docker.com/_/postgres](https://hub.docker.com/_/postgres)
* **Docker Compose documentation:** [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
* **Docker pgAdmin image:** [https://hub.docker.com/r/dpage/pgadmin4/](https://hub.docker.com/r/dpage/pgadmin4/)
* **pgAdmin:** [https://www.pgadmin.org/](https://www.pgadmin.org/)


