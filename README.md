# Project Title

A Small Infrastructure with Docker Compose

## Description

This project sets up a small infrastructure composed of different services, each running in a dedicated Docker container. It includes NGINX with TLSv1.2 or TLSv1.3, WordPress with php-fpm, and MariaDB. The setup also involves volumes for the WordPress database and website files, along with a docker-network for inter-container communication.

## Installation

### Prerequisites

- Docker
- Docker Compose

### Clone the repository

  ```
  git clone https://github.com/zmoussam/Inception
  ```

### Environment Variables

Create a .env file at the root of the srcs directory with the following variables:
```
SQL_DATABASE=...
SQL_USER=....
SQL_USER_PASSWORD=...
MYSQL_ROOT_PASSWORD=...

WORDPRESS_DB_HOST=...
DOMAIN_NAME=...
WP_USER=...
WP_USER_PASSWORD=...
WP_USER_EMAIL=...
WP_ADMIN_USER=...
WP_ADMIN_PASSWORD=...
WP_ADMIN_EMAIL=...
```
The `.env` file located at the root of the `srcs` directory is used to define various environment variables that are utilized within the Docker Compose configuration. These variables are essential for configuring the services and containers within the infrastructure.

Here's a brief explanation of the key variables and their usage:

- `SQL_ROOT_PASSWORD`: Specifies the password for the root user of the MariaDB database. This password is crucial for accessing the root account and performing administrative tasks.

- `SQL_USER`: Sets the username for accessing the MariaDB database. This user is used by the WordPress application to interact with the database.

- `SQL_PASSWORD`: Defines the password for the MariaDB user specified in `MYSQL_USER`. It is used for authentication when accessing the MariaDB database.

- `SQL_DATABASE`: Specifies the name of the MariaDB database that will be used by the WordPress application.

These environment variables are referenced in the Docker Compose file for the respective services, ensuring that sensitive information is not hardcoded in the configuration files. By using environment variables, the configuration can be easily managed and updated without directly modifying the source code.

### Build and Run

Navigate to the project directory and run the following command:

```
make
```
This command will handle the building of Docker images, creation of containers, and the configuration of the infrastructure based on the provided rules.

### Project Setup Rules

The project adheres to several key rules and guidelines to ensure the proper setup and functioning of the infrastructure. Some of the important rules are as follows:

1. **Docker Compose Usage**: The project utilizes Docker Compose to manage the multi-container infrastructure, ensuring seamless orchestration and deployment of the services.

2. **Custom Dockerfiles**: Each service in the infrastructure has its own Dockerfile, and the images are built from scratch, without relying on pre-existing or external images.

3. **Container Management**: Services are containerized individually, and the project strictly adheres to the practice of one service per container, ensuring a modular and scalable architecture.

4. **Performance Optimization**: Containers are built using either the penultimate stable version of Alpine or Debian, chosen for their lightweight nature and efficient performance.

5. **Security Measures**: Sensitive information such as passwords and credentials are not hardcoded in the Dockerfiles. Instead, the project uses environment variables and a `.env` file to manage and secure sensitive data.

6. **Network Configuration**: Inter-container communication is established through a dedicated docker-network, with the explicit prohibition of using `network: host` or `--link` for networking.

7. **NGINX Configuration**: NGINX is configured to exclusively accept connections through port 443, utilizing the TLSv1.2 or TLSv1.3 protocol for enhanced security and data encryption.

These guidelines ensure the robustness, security, and efficient functioning of the infrastructure while adhering to best practices and industry standards.

### Basic Commands

- To build a Docker image:
```
docker build -t image_name
```
- To run a Docker container:
```
docker run -d --name container_name image_name
```
- To stop a Docker container:
docker stop container_name
