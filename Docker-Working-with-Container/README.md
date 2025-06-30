# Working with Docker Containers

### Introduction to Docker Containers

Docker containers are lightweight, portable, and executable units that encapsulate an application and its dependencies.

### ✅ What Are Containers?
A container is a standalone executable package that includes:

- The application code

- Runtime environment

- System tools and libraries

- Configuration files

This allows the application to run reliably regardless of where it is deployed — on a developer's laptop, on-premises servers, or in the cloud.

### ✅ Why Use Docker Containers?
1. Portability

    - Containers can run on any system that supports Docker, eliminating the "it works on my machine" problem.

2. Isolation

    - Each container runs in its own environment, separate from other containers or the host system.

3. Resource Efficiency

    - Containers share the host OS kernel, making them lighter and faster than virtual machines (VMs).

4. Scalability

    - Docker works well with orchestration tools (like Kubernetes), making it easy to scale applications.

5. Version Control & Reusability

    - Docker images can be versioned and reused across projects or teams.

### Running Containers

To run a container, you use the `docker run` command followed by the name of the image you want to use.

```bash
docker run ubuntu
```
![](img/1.%20docker%20run.png)

The image above shows that the container is created but not running. We can start the container by running
```bash
docker start CONTAINER_ID
```
![](img/3.%20start%20container.png)

### Launching Containers with Different Options

Docker provides various options to customize the behaviour of containers. For example, you can specify environment variables, map ports, and mont volumes.

Here's an example of running a container with a specific environment variable:

```bash
docker run -e "MY_VARIABLE=my-value" ubuntu
```
![](img/2.%20environment%20variable.png)

### Running Containers in the Background

By default, containers run in the foreground, and the terminal is attached to the container's standard input/output. To run a container in the background, use the `-d` option:
```bash
docker run -d ubuntu
```
![](img/4.%20docker%20run%20detached.png)

This command starts a container in the background, allowing you to continue the terminal.

### Container Lifecycle

Containers have a lifecycle that includes creating, starting, stopping, and restarting. Once a container is created, it can be started and stopped multiple times.

**Starting, Stopping, and Restarting Containers

- To start a stopped container:
```bash
docker start container_name
```
![](img/5.%20docker%20start%20container.png)

- **To stop a running container**
```bash
docker stop container_name
```
![](img/6.%20stop%20docker%20container.png)

- **To restart a container:**
```bash
docker restart container_name
```
![](img/7.%20restart%20docker%20container.png)

**Removing Containers

To remove a container, you use the `docker rm` command followed by the container's ID or name:
```bash
docker rm container_name
```
![](img/8.%20docker%20rm.png)

This deletes the container, but keep in mind that the associated image remains on your system.



