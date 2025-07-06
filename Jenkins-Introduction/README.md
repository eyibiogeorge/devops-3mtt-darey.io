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

## Jenkins Job

### 🛠️ What is a Jenkins Job?
`A Jenkins job` is a task or project that Jenkins runs—like building code, running tests, deploying applications, or automating scripts. Each job defines what to do, when to do it, and how.

### ✅ Types of Jenkins Jobs
|Type |	Description |
|-----| ---------- |
|Freestyle Project |	Basic, GUI-based jobs—easy to configure for simple tasks.
|Pipeline |	Scripted jobs using Groovy—best for complex workflows (CI/CD).
|Multibranch Pipeline |	Automatically builds pipelines for each branch in a repo.
|Folder |	Used to organize multiple jobs.
|Matrix Project |	Run the same job across different environments/parameters.

**⚙️ Basic Freestyle Job Example**

1. Create a Freestyle Job

    - Go to Jenkins dashboard → New Item

    - Name your job → Select Freestyle project → Click OK

2. Configure Job

    - Source Code Management: Git (provide repo URL)

    - Build Triggers: e.g., poll SCM, build periodically, or on webhook

    - Build Steps:

        - Execute Shell:
        ```bash
        echo "Building my project"
        make build
        ```

    - Post-Build Actions: e.g., email notification, deploy artifact

3. Save & Run

    - Click Build Now to run the job manually.

    - Or wait for auto trigger based on your settings.

**🔄 Pipeline Job Example**
1. Create a Pipeline Job

    - New Item → Choose Pipeline → OK

2. Pipeline Script (Declarative Syntax):

    ```groovy

    pipeline {
        agent any

        stages {
            stage('Build') {
                steps {
                    echo 'Building code...'
                }
            }
            stage('Test') {
                steps {
                    echo 'Running tests...'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying to production...'
                }
            }
        }
    }
3. Save and Run

### 📦 Common Jenkins Job Use Cases
- Compile Java, Node.js, Python, or C++ code

- Run unit/integration tests

- Package Docker containers

- Deploy to Kubernetes or AWS

- Send status emails or Slack alerts

- Lint or check code style

### 🧠 Jenkins Job Best Practices
- Use Pipelines for anything beyond simple builds.

- Keep builds reproducible and isolated (e.g., Docker agents).

- Use credentials plugins to protect secrets.

- Store pipeline scripts in Git (Jenkinsfile) for version control.

### Creating a Freestyle Project

Let's create our first build job

* From the dashboard menu on the left side, click on new item
![](img/12.%20create%20freestyle.png)

* Create a freestyle project and name it `my-first-job`
![](img/13.%20my%20first%20job.png)

**Connecting Jenkins To Our Source Code Management

Lets connect jenkins with github

* Create a new github repository called `jenkins-scm with README.md file
![](img/14.%20jenkins-scm.png)

* Connect `jenkins` to `jenkins-scm` repository by pasting the repository url.
![](img/15.%20connect%20github.png)
![](img/16.%20successfully%20connect%20github.png)
![](img/17.%20triggers.png)
![](img/18.%20add%20webhooks.png)
![](img/19.%20connect%20jenkins%20to%20github.png)
![](img/18.%20github%20webhook.png)

## Jenkins Pipeline Job

A **Jenkins Pipeline job** is a specialized job in Jenkins that defines a series of automated steps (called a pipeline) to **build, test, and deploy** code. It’s written as code using the **Pipeline DSL (Domain Specific Language)**, typically in a file called `Jenkinsfile.`

