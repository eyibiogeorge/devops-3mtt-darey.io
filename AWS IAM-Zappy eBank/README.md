# Identity and Access Management (IAM)

**Identity and Access Management (IAM)** in AWS is a fundamental service that helps you securely manage **who** can access your AWS resources and **what** they can do with them. Its primary purpose is to control authentication (who can sign in) and authorization (what permissions they have) within your AWS environment.

### Purpose of IAM
- **Authentication:** Verifying the identity of users, applications, or services trying to access AWS.

- **Authorization:** Defining and enforcing what actions they are allowed to perform, like launching instances, creating databases, or accessing storage.

- **User and Group Management:** Creating individual users and organizing them into groups to manage permissions more easily.

- **Policy Management:** Applying policies (sets of rules) that specify permissions and attach them to users, groups, or roles.

### How IAM Contributes to Security
- **Least Privilege Principle:** You can grant only the minimum permissions necessary for users to perform their tasks, reducing the risk of misuse.

- **Granular Access Control:** You can finely tune permissions at the resource level, such as allowing access only to specific S3 buckets or EC2 instances.

- **Temporary Credentials:** IAM roles can issue temporary security credentials, making access safer, especially for applications and services.

- **Multi-Factor Authentication (MFA):** Adds an extra layer of security beyond passwords.

- **Audit and Compliance:** IAM integrates with AWS CloudTrail to log and monitor all API calls for auditing purposes.

### How IAM Contributes to Efficient Management
- **Centralized Access Control:** All permissions are managed from a single place, making administration simpler.

- **Delegation via Roles:** Services and external users (like third-party contractors) can be given temporary and controlled access through IAM roles without sharing permanent credentials.

- **Scalability:** As your organization grows, IAM can handle thousands of users, policies, and roles with organized management practices.

- **Automation and Federation:** IAM supports identity federation (e.g., connecting your corporate directory with AWS) and automation tools for large-scale account management.

### IAM Users
- **Definition:** An IAM user is an individual identity with specific credentials (username and password or access keys) used to interact with AWS services.
- **Purpose:** Represents a single person or application that requires direct access to AWS resources.
- **Permissions:** Permissions can be assigned directly to the user or inherited from group memberships.
### Use Cases:
- Granting a developer access to manage EC2 instances.
- Allowing a CI/CD pipeline to deploy applications to AWS. 
### IAM Groups
- **Definition:** An IAM group is a collection of IAM users. Groups simplify permission management by allowing you to assign permissions to multiple users simultaneously.
- **Purpose:** Facilitates the management of permissions for multiple users who share similar access requirements.
- **Permissions:** Policies attached to a group apply to all its members. 
### Use Cases:
- Creating an "Admins" group with full access to AWS services.
- Establishing a "Developers" group with permissions to manage development resources.

### Best Practices
- **Use Groups for Permission Management:** Assign permissions to groups rather than individual users to streamline access control.​

- **Implement Least Privilege Principle:** Grant users only the permissions necessary to perform their tasks.​

- **Regularly Review Group Memberships:** Ensure users are in appropriate groups to maintain security and compliance.

### The Principle of Least Privilege (PoLP)

- **The Principle of Least Privilege (PoLP)** is a foundational security concept in AWS Identity and Access Management (IAM). It dictates that users, applications, and services should be granted only the permissions necessary to perform their tasks—no more, no less.
### What Is the Principle of Least Privilege?
In AWS, the principle of least privilege ensures that each IAM identity (user, group, or role) has the minimal set of permissions required to fulfill its responsibilities. This approach minimizes the potential for accidental or malicious actions that could compromise security. 
### Why Is It Important?
Implementing least privilege in AWS offers several key benefits:
- **Enhanced Security:** Limiting permissions reduces the risk of unauthorized access and potential damage from compromised credentials.
- **Reduced Attack Surface:** By granting minimal access, the potential pathways for attackers are minimized.
- **Compliance:** Many regulatory standards require strict access controls, which are facilitated by adhering to the principle of least privilege. 
- **Operational Efficiency:** Simplified permission structures make it easier to manage and audit access rights.
### How to Implement Least Privilege in AWS IAM
To effectively apply the principle of least privilege in AWS:
1.	**Start with AWS Managed Policies:** Utilize AWS-provided policies as a baseline, then customize them to fit specific needs.
2.	**Use IAM Access Analyzer:** This tool helps identify unused permissions and suggests policy adjustments to enforce least privilege.
3.	**Regularly Review Permissions:** Periodically assess and adjust IAM policies to ensure they align with current requirements.
4.	 **Implement Role-Based Access Control (RBAC):** Assign permissions to roles based on job functions, and then associate users with appropriate roles. 
5.	**Apply Conditions in Policies:** Use policy conditions to restrict access based on factors like IP address, time of day, or request origin. 

When `John` is assigned to the `development-team` IAM group with the `AmazonEC2FullAccess` policy, he inherits comprehensive permissions to manage Amazon EC2 resources. This AWS-managed policy grants full access to EC2, including actions like launching, terminating, and modifying instances, as well as managing security groups and key pairs. ​

### Key Considerations
- **Scope of Permissions:** The AmazonEC2FullAccess policy provides extensive permissions, which may exceed John's specific needs as a developer. This broad access could lead to unintended changes or security risks.​

- **Principle of Least Privilege:** To enhance security, it's advisable to follow the principle of least privilege by granting John only the permissions necessary for his role. This minimizes potential misuse or accidental disruptions.​

- **Custom Policies:** Creating a custom IAM policy tailored to the development team's requirements can provide more controlled access. For instance, limiting actions to specific EC2 operations or resources.​

- **Resource Tagging:** Implementing resource tags and using them in IAM policies can restrict access to specific EC2 instances, ensuring that John interacts only with designated resources. ​
AWS Repost

- **Monitoring and Auditing:** Utilize AWS CloudTrail and IAM Access Analyzer to monitor John's activities and validate that permissions align with intended access levels. 

### Hands-on creating IAM users, group and policy

- Login to your aws account as root user

![](img/1.%20root%20user%20login.PNG)

![](img/2.%20captch.PNG)

- navigate to IAM dashboard

![](img/3.%20iam%20dashboard.PNG)

- click on `user` and click on `create policy`

![](img/4.%20create%20policy.PNG)

- under policy editor select `EC2`

![](img/5.%20select%20service.PNG)

-  check all EC2

![](img/6.%20ec2%20action.PNG)

- also check all resources

![](img/7.%20all%20resources.PNG)

- enter policy name, description and create policy

![](img/8.%20review%20and%20create.PNG)

- check that developer policy is created

![](img/9.%20developers%20policy%20created.PNG)

- create user group

![](img/10.%20user%20group.PNG)

- enter user group name `Development-Team`

![](img/11.%20group%20details.PNG)

- Display created development team

![](img/12.%20development%20team%20created.PNG)

- create policy for analyst team

![](img/13.%20create%20policy.PNG)

- select `S3` service

![](img/14.%20select%20service.PNG)

- check all S3

![](img/15.%20specify%20permission.PNG)

- enter policy detail for analyst team and click create policy

![](img/16.%20policy%20description.PNG)

- confirm that analyst policy is created

![](img/17.%20confirm%20analyst%20policy.PNG)

- create group for analyst team

![](img/18.%20create%20group.PNG)
\
- enter details for analyst team and click on create group

![](img/19.%20attached%20analyst%20policy.PNG)

- confirm that analyst team is created

![](img/20.%20confirm%20analyst%20group.PNG)

- click on user then click create user

![](img/21.%20create%20user.PNG)

- enter user John details

![](img/22.%20user%20john%20details.PNG)

- attached development team permissions

![](img/23.%20add%20permission%20for%20john.PNG)

- review and create John user

![](img/24.%20preview%20and%20create.PNG)

- confirm john user is created

![](img/25.%20create%20user%20mary.PNG)

- create mary user

![](img/26.%20mary%20details.PNG)

- attached analyst team permissions

![](img/27.%20add%20permission%20for%20mary.PNG)

- review and create Mary user

![](img/28.%20click%20create%20user.PNG)

- confirm Mary user has been created

![](img/29.%20download%20password.PNG)

- login John user

![](img/30.%20login%20as%20john.PNG)

- Display John console home

![](img/31.%20john%20console%20home.PNG)

- EC2 dashboard

![](img/32.%20ec2%20dashboard.PNG)

- enter ec2 detains and click on launch instance

![](img/33.%20launch%20ec2.PNG)

- confirm instance has been created

![](img/34.%20zappy%20webserver%20launched.PNG)

- John is denied access to access IAM users

![](img/39.%20john%20denied%20access.PNG)

- login to user Mary

![](img/35.%20login%20as%20mary.PNG)

- user Mary console home

![](img/36.%20mary%20console%20home.PNG)

- Mary is able to create an S3 bucket

![](img/37.%20S3-bucket%20created.PNG)

- Mary is denied access to view user in IAM

![](img/38.%20denied%20iam.PNG)

- select user John
![](img/40.%20john%20mfa.PNG)

- enable MFA

![](img/41.%20enable%20mfa.PNG)

- select device `authenticator`

![](img/42.%20mfa%20device.PNG)

- MFA successfully created for john

![](img/43.%20john%20mfa%20created.PNG)

- select user Mary

![](img/44.%20select%20mary.PNG)

- enable MFA

![](img/45.%20enable%20mfa.PNG)

- select device

![](img/46.%20mfa%20details.PNG)

- setup device

![](img/47.%20setup%20mfa%20device.PNG)

- Mary MFA has been created.

![](img/48.%20mary%20mfa%20created.PNG)