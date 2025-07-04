# Jenkins Freestyle Project

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

**Connecting Jenkins To Our Source Code Management**

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
![](img/20.%20add%20to%20readme.png)
![](img/21.%204%20and%205%20added.png)