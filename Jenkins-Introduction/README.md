# Introduction of Jenkins

### 🚀 Introduction to CI/CD (Continuous Integration / Continuous Delivery & Deployment)
CI/CD is a modern software development practice that automates and streamlines the process of building, testing, and deploying code. It stands for:

### 🧱 1. Continuous Integration (CI)
**Definition:**
CI is the practice of frequently merging code changes from all developers into a shared repository—usually several times a day. Each integration is automatically built and tested.

**Goal:**
Catch bugs early, improve code quality, and reduce integration issues.

**Typical CI Steps:**

- Developer pushes code to version control (e.g., Git).

- CI server (e.g., Jenkins, GitHub Actions, GitLab CI) runs:

    - Build scripts

    - Unit tests

    - Static code analysis

    - Notifications (e.g., Slack, email)

**✅ Benefits:**

- Early bug detection

- Faster feedback

- Encourages smaller, incremental changes

## 🚚 2. Continuous Delivery (CD)

**Definition:**
`CD` ensures that code is always in a deployable state. After CI, it automates the release process so you can deploy anytime with a button click.

**Key Point:**
You’re not deploying automatically, but you can deploy at any time.

**✅ Benefits:**

- Safer, faster releases

- Shorter release cycles

- Reduced manual work

### ⚡ 3. Continuous Deployment (also CD)
**Definition:**
Takes things further—automatically deploys every change that passes all stages of the pipeline to production.

**Key Difference from Delivery:**
No human intervention; production updates happen automatically.

**✅ Benefits:**

- True automation

- Faster time-to-market

- Continuous feedback from real users

## 🧰 What is Jenkins?
`Jenkins` is an open-source automation server used to implement Continuous Integration `(CI)` and Continuous Delivery/Deployment `(CD)` in software development.

**🔑 Key Features**
|Feature |	Description |
|--------|--------------|
|🏗️ Automation |	Automates build, test, and deployment processes.|
|🔌 Plugins |	Over 1,800 plugins for integration with tools like Git, Docker, Maven, Kubernetes, Slack, AWS, etc.|
|💡 Extensibility |	Highly customizable and scriptable (e.g., with Groovy pipelines).|
|🌐 Web UI |	User-friendly web interface for managing jobs and monitoring builds.|
|🤖 Agent Support |	Supports distributed builds using master-agent architecture.|

### 🧪 What Jenkins Does
1. Builds Code – compiles code automatically when changes are pushed to Git.

2. Runs Tests – triggers unit/integration tests.

3. Reports Results – notifies developers of build or test failures.

4. Deploys Code – can deploy to staging or production environments.

### 🔧 Use Cases
- Automatically testing code after each commit

- Building Docker images

- Deploying web apps to AWS, Azure, or on-prem

- Generating and emailing reports

- Managing infrastructure pipelines with Terraform or Ansible

## Getting Started With Jenkins

Now that we have an idea what Jenkins, let's dive into installing Jenkins.

**Update package repositories**

```bash
sudo apt update
```
![](img/1.%20update%20.png)

Install JDK
```bash
sudo apt install default-jdk-headless
```

Install Jenkins
```bash
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt-get install jenkins
```
![](img/3.%20install%20jenkins.png)
The command installs Jenkins. It involves importing the Jenkins GPG key for package verification, adding the Jenkins repository to the system's sources, updating package lists, and finally, installing Jenkins through the package manager (apt-get).

Checking if jenkins has been installed, and it is up and running

```bash
sudo systemctl status jenkins
```
![](img/4.%20jenkins%20status.png)

On our Jenkins instance, create new inbound rules for port 8080 in security group
By default, jenkins listens on port 8080, we need create an inbound rule for this in the security group of our jenkins instance

![](img/5.%20port%208080.png)

Set up Jenkins on the Web Console

1. Input your Jenkins Instance ip address on your web browser
![](img/6.%20getting%20started%20with%20jenkins.png)

2. check Password
![](img/7.%20check%20password.png)

3. installed suggested plugins
![](img/8.%20install%20plugins.png)

4. create user account
![](img/9.%20create%20first%20user.png)

5. login to jenkins console
![](img/11.%20Jenkins%20successfully%20setup.png)
