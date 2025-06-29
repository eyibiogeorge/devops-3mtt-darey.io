# Working with Docker Images

### Introduction to Docker Images

Docker images are the building block of containers. They are lightweight, portable, and self-sufficient packages that contain everything needed to run a software application, including the code, runtime, libraries, and system tools. Images are created from a set of instructions known as a Dockerfile, which specifies the environment and configuration for the application.

### 📦 Project Overview

This project demonstrates the use of basic Docker commands to manage and interact with Docker images and containers. Key commands used include:

- docker images
- docker ps
- docker run
- docker build
- docker pull
- docker push

It also showcases how to create a Dockerfile for an `nginx` server setup.

### Pulling Images from Docker Hub

Docker Hub is a cloud-based registry that hosts a vast collection of Docker images. You can pull images from Docker Hub to your local machine using the `docker pull` command.

To explore available images on Docker Hub, the docker command provides a search subcommand. For instance, to find the Ubuntu image, you can execute:

```bash
docker search ubuntu
```
This command allows you to discover and explore various images hosted on Docker Hub by providing relevant search results. In this case, the output will be similar to this

![](img/1.%20docker%20search.PNG)

In the "OFFICIAL" column, the "OK" designation signifies that an image has been constructed and is officially supported by the organization responsible for the project. Once you have identified the desired image, you can retrieve it to your local machine using the "pull" subcommand.

To download the official Ubuntu image to your computer, use the following command:

```bash
docker pull ubuntu
```

Executing this command will fetch the official Ubuntu image from Docker Hub and store it locally on your machine, making it ready for use in creating containers.

![](img/2.%20docker%20pull.PNG)

Once an image has been successfully downloaded, you can proceed to run a container using the downloaded image by employing the "run" subcommand. Similar to the hello-world example, if an image is not present locally when the `docker run` sbcommand is invoked, Docker will automatically download the required image before initiating the container.

To view the list of images that have been downloaded and are available on your local machine, enter the following comand:

```bash
docker images
```

Executing this command provides a comprehensive list of all the images stored locally, allowing you to verify the presence of the downloaded image and gather information about its size, version, and other relevant details.

![](img/3.%20docker%20images.PNG)

**Dockerfile**

A Dockerfile is a plaintext configuration file that contains a set of instructions for building a Docker image. It serves as a blueprint for creating a reproducible and consistent environment for your application. Dockerfiles are fundamental to the containerization process, allowing you to define the steps to assemble an image that encapsulates your application and its dependencies.

**Creating a Dockerfile

In this dockerfile file, we will be using an nginx image. `Nginx` is an open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more. It started out as a web server designed for maximum performance and stability.

To create a Dockerfile, use a text editor of your choice, such as vim or nano. Start by specifying a base image, defining the working directory, copying files, installing dependencies, and configuring the runtime environment.

Here's a simple exaple of a Dockerfile for an html file: Let's create an image with using a dockerfile. Paste the code snippet below in a file named `dockerfile` This example assumes you have a basic HTML file named `index.html` in the same directory as your Dockerfile.

```bash
# Use the official NGINX base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR  /usr/share/nginx/html/

# Copy the local HTML file to the NGINX default public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to allow external access
EXPOSE 80

# No need for CMD as NGINX image comes with a default CMD to start the server
```

Explanation of the code snippet above

1. **FROM nginx:latest:** Specifies the official NGINX base image from Docker Hub.
2. **WORKDIR /usr/share/nginx/html/:** Specifies the working directory in the container
3. **COPY index.html /usr/share/nginx/html/:** Copies the local 'index.html' file to the NGINX default public directory, which is where NGINX serves static content from.
4. **EXPOSE 80:** Informs Docker that the NGINX server will use port 80. This is a documentation feature and doesn't actually publish the port.
5. **CMD:** INGINX images come with a default CMD to start the server, so there's no need to specify it explicitly.

To build an image from this Dockerfile, navigate to the directory containing the file and run:

```bash
docker build -t dockerfile .
```

![](img/4.%20docker%20build.PNG)

![](img/5.%20dockerfile%20image.PNG)

To run a container based on the custom NGINX image we created with a dockerfile, run the command

```bash
docker run -p 8080:80 dockerfile
```

![](img/6.%20run%20dockerfile%20image.PNG)

The command above will create a container that listens on port 8080 using the nginx image you created earlier. So you need to create a new rule in security group of EC2 instance.

1. on our EC2 instance, click on the security tab
![](img/7.%20ec2%20security%20tab.PNG)

2. Click on edit inbound rules to add new rules. This will allow incoming traffic to instance associated with the security group. Our aim is to allow incoming traffic on port 8080
![](img/8.%20edit%20inbound%20rules.PNG)

3. Click on `Add rule` to add a new rule
![](img/9.%20add%20rule.PNG)

List of available containers
```bash
docker ps -a
```
![](img/9.%20add%20rule.PNG)

The image above show our container is not running yet. we can start it with the command below
```bash
docker start CONTAINER_ID
```
![](img/12.%20start%20container.PNG)
![](img/10.%20display%20webpage.PNG)

### Pushing Docker Images To Docker Hub

1. Create an account on [Docker Hub](https://hub.docker.com/repositories/eyibiogeorge)
2. Create a repository on docker hub
3. Tag your Docker Image Before pushing, ensure that your Docker image is appropriately tagged. You typically tag your image with your Docker Hub username and the repository name.
```bash
docker tag <your-image-name> <your-dockerhub-username>/<your-repository-name>:<tag>
```
![](img/15.%20docker%20tag.PNG)
![](img/13.%20push%20to%20docker%20hub.PNG)
![](img/14.%20image%20push%20successful.PNG)