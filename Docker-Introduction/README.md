# Introduction to Docker

### What is Docker

Docker is a **platform for developing, shipping, and running applications using containerization.** Containers allow you to package up an application along with everything it needs to run (code, libraries, dependencies, etc.) so that it runs **consistently across different environments.**

🔹 Key Concepts:

1. **Container**
    - lightweight, standalone, executable package.
    - Contains everything needed to run a piece of software.
    - Think of it as a mini virtual machine, but more efficient and faster.

2. **Image**
    - A snapshot or blueprint used to create containers.
    - You build an image using a file called a **Dockerfile.**
    - Once built, images can be run as containers.

3. **Dockerfile**
    - A script with instructions for building a Docker image.
    - Example
        ```bash
        FROM python:3.10
        COPY . /app
        WORKDIR /app
        RUN pip install -r requirements.txt
        CMD ["python", "app.py"]
     
        ```
4. **Docker Hub**
    - A public repository for sharing Docker images.
    - You can pull prebuilt images (e.g., `nginx`, `mysql`) or push your own.

5. **Docker Engine**
    - The core part of Docker that runs and manages containers.

### 🔹 Why Use Docker?

- ✅ Portability: Runs the same on a developer's laptop and in production.

- ✅ Isolation: Each container is isolated, preventing conflicts.

- ✅ Scalability: Easily scale up/down with container orchestration tools like Kubernetes.

- ✅ Efficiency: Uses fewer resources than full virtual machines.

### 🧱 Docker Containers vs Virtual Machines

| Feature            | **Docker Containers**                           | **Virtual Machines**                              |
| ------------------ | ----------------------------------------------- | ------------------------------------------------- |
| **Architecture**   | Shares the **host OS kernel**                   | Runs **full OS** with a separate kernel           |
| **Startup Time**   | **Seconds**                                     | **Minutes**                                       |
| **Size**           | **Lightweight** (MBs)                           | **Heavy** (GBs)                                   |
| **Isolation**      | Process-level isolation                         | Full machine-level isolation                      |
| **Performance**    | Near-native speed                               | Slightly slower due to hypervisor overhead        |
| **Portability**    | Highly portable across environments             | Portable, but less flexible                       |
| **Resource Usage** | Uses fewer CPU/memory resources                 | Requires more resources                           |
| **Use Case**       | Microservices, CI/CD, DevOps, cloud-native apps | Full OS simulation, legacy apps, strong isolation |
| **Security**       | Good (but shares kernel, so slightly more risk) | Strong (full isolation)                           |

### 🖼️ Visual Summary
**Virtual Machine Stack:**

```markdown
Hardware
  └── Host OS
      └── Hypervisor
          ├── Guest OS 1
          └── Guest OS 2
```
**Docker Stack:**
```
Hardware
  └── Host OS
      └── Docker Engine
          ├── Container 1
          └── Container 2
```

### ✅ When to Use Which:

| Scenario                                          | Best Option |
| ------------------------------------------------- | ----------- |
| Rapid deployment, microservices, CI/CD            | **Docker**  |
| Strong isolation, running multiple OS types       | **VM**      |
| Resource-constrained environment                  | **Docker**  |
| Running full Windows inside Linux (or vice versa) | **VM**      |

### Getting Started with Docker

**Installing Docker**

1. Launch an ubuntu 20.04 LTS instance.
![](img/1.%20login%20to%20ubuntu%20server.PNG)


2. add docker's official GPG key
- A Linux command that refreshes the package list on a Debian-based system, ensuring the latest software information is available for installation.
![](img/2.%20update%20ubuntu%20os.PNG)

- A Linux command that installs essential packages including certificate authorities, a data transfer tool(curl), and the GNU Privacy Guard for secure communication and package verification.
![](img/3.%20install%20gnupg.PNG)

- This command creates a directory (/etc/apt/keyrings) with specific permissions (0755) for storing keyrings files, which are used for docker's authentication.
![](img/4.%20create%20keyrings.PNG)

- Downloads the Docker GPG key using `curl`
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

- Sets read permissions for all users on the Docker GPG key file within the APT keyring directory
![](img/5.%20chmod%20for%20docker.gpg.PNG)

2. **Add the repository to Apt sources**
- The `echo` command creates a Docker APT repository configuration entry for the Ubuntu system, incorporating the system architecture and Docker GPG key, and the `sudo tee /etc/apt/sources.list.d/docker.list > /dev/null` writes this configuration to `/etc/apt/sources.list.d/docker.list` file 
![](img/6.%20echo.PNG)

- Install latest version of docker
![](img/7.%20ubuntu%20update.PNG)
![](img/8.%20install%20docker.PNG)

- Verify that docker has been successfully installed
![](img/9.%20docker%20status.PNG)

- By default, after installing docker, it can only be run by root user or using `sudo` command. To run the docker command without sudo execute the command below
![](img/10.%20usermod.PNG)

**Running the "Hello World" Container**

using the `docker run` command

The `docker run` command is the entry point to execute containers in Docker. It allows you to create and start a container based on a specified Docker image. The most straightforward example is the "Hello World" container, a minimalistic container that prints a greeting message when executed.
![](img/11.%20hello-world%20container.PNG)

When you execute this command, Docker performs the following steps:

1. **Pulls image (if not available locally):** Docker checks if the `hello-world` image is available locally. If not, it automatically pulls it from the Docker Hub, a centralized repository for Docker images.

2. **Creates a Container:** Docker creates a container based on the `hello-world` image. This container is an instance image, with its own isolated filesystem and runtime environment.

3. **Starts the Container:** The container is started, and it executes the predefined command in the `hello-world` image, which prints a friendly message.

### Understanding the Docker Image and Container Lifecycle

**Docker Image:** A Docker image is a lightweight, standalone, and executable package that includes everything needed to run a piece of software, including the code, runtime, libraries and system tools. Images are immutable, meaning they cannot be modified once created. Changes result in the creation of a new image.

- **Container Lifecycle:** Containers are running instances of Docker images.
    - They have a lifecycle: **create, start, stop, and delete.**
    - Once a container is created from an image, it can be started, stopped and restarted.

### Verifyig the Successful Execution

You can check if the images is now in your local environment with Example Output:
```bash
docker images
```
![](img/12.%20docker%20images.PNG)

If you encounter any issues, ensure that Docker is properly installed and that your user has the necessary permissions to run Docker commands.

### Basic Docker Commands

**Docker Run**

The `docker run` command is fundamental for executing containers. It creates and starts a container based on a specified image.

```bash
# Run a container based on the "nginx" image
docker run nginx
```
![](img/13.%20run%20nginx.PNG)

This example pulls the `nginx` image from Docker Hub (if not available locally) and starts a container using that image.

**Docker ps**

The `docker ps` command displays a list of running containers. This is useful for monitoring active containers and obtaining information sucha as container IDs, names, and status.

```bash
# List running containers
docker ps
```
To view all containers, including those that have stopped, add the `-a` option
```bash
# List all containers (running and stopped)
docker ps -a
```
![](img/14.%20docker%20ps.PNG)

**Docker Stop**

The `docker stop` command halts a running container.
```bash
# Stop a running container (replace CONTAINER_ID with the actual container ID)
docker stop CONTAINER_ID
```
**Docker pull**

The `docker pull` command downloads a Docker image from a registry, such as Docker Hub, to your local machine.
```bash
# Pull the latest version of the "ubuntu" image from Docker Hub
docker pull ubuntu
```

**Docker Push**

The `docker push` command uploads a local Docker image to a registry, making it available for others to pull.
```bash
# Push a local image to Docker Hub
docker push your-username/image-name
```
**Docker RMI**

The `docker rmi` command removes one or more images from the local machine.

```bash
# Remove a Docker image (replace IMAGE_ID with the actual image ID)
docker rmi IMAGE_ID
```
These basic Docker commands provide a foundation for working with containers. Understanding how to run, list, stop, pull, push and manage Docker images is crucial for effective containeriration and orchestration. As you delve deeper into Docker, you'll discover additional commands and features that enhance your ability to develop, deploy, and maintain containerized applications.