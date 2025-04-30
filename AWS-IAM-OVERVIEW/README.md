# Understanding IAM User

### What is IAM user?

IAM users are like individual accounts for different people or entities within your AWS environment.

For example, if you have a team working on a project, you can create separate IAM users for each team member. Each IAM user would have their own unique username and password, allowing them to access the AWS resources they need for their work.

IAM users help you manage and control access to your AWS resources securely, ensuring that each user only has access to the resources the need to perform their tasks.

### What is IAM Role?

An IAM role defines what someone or something (like an application or service) can do within your AWS account. Each role has a set of permissions that determine which actions it can perform and which AWS resources it can access.

For example, you might have an “admin” role that gives full access to all resources, or a “developer” role that only allows access to a certain services for building applications.
Or if we take another example, imagine you have a visitor who needs temporary access to your house to fix something. Instead of giving them a permanent key (IAM user), you give them a temporary key (IAM role) that only works for a limited time and grants access to specific rooms (AWS resources).

IAM roles are flexible and can be assumed by users, services, or application as needed. They are commonly used for tasks such as granting permissions to AWS services, allowing cross-account access, or providing temporary access to external users. IAM roles enhance security and efficiency by providing controlled access to AWS resources without the need for permanent credentials.

### What is IAM Policy?

An IAM policy is a set of rules that define what actions a role can take. These rules specify the permissions granted to the role. Think of a policy as a rulebook for the role. It outlines which actions are allowed and which are not, helping to ensure secure and controlled access to your AWS resources.

For example, the rulebook might say that the “admin” key (IAM role or user) can open any door and perform any action within the house (AWS resources), while the viewer key (IAM role or user) can only open certain doors and look around, but not make any changes.

IAM policies define the permission granted to IAM roles and users, specifying which AWS resources they can access and what actions they can take. They are essential for maintain security and controlling access to AWS resources, ensuring that only authorized actions are performed by users and roles with your AWS account.

### What is IAM group?

IAM Groups are like collections of IAM users. Instead of managing permissions for each user individually, you can organize users into groups based on their roles or responsibilities.

You can think IAM Groups as these neat little collections of users with similar roles or responsibilities. It’s like putting everyone into teams based on their tasks. So, you might have a group for developers, another for administrators, and so on. So instead of setting permissions for each person one by one, you set them up for the whole group at once.

For example, let’s say you have a development team working on a project. Instead of assigning permissions to each developer one by one, you can create an IAM Group called “Developers” and add all the developers to that group. Then, you assign permissions to the group as a whole. So, if you want all developers to have access to the same resources, you only need to set it up once for the group.

### Best Practices:
- `Give only the permissions needed:` Don’t give more access than necessary.

- `Use roles instead of users:` Roles are safer and can be used when needed

- `Review roles regularly:` Remove unused roles to keep things tidy and secure

- `Add extra security with MFA:` use Multi-Factor Authentication for extra protection

- `Use ready-made policies:` They are safer and easier to use.
- `Keep policies simple:` Make separate policies for different tasks

- `Keep track of changes:` keep a record of who changes what

- `Test policies before using them:` Make sure the work the way you want them to before applying them to real stuff.

- `Use descriptive names:` Choose clear and descriptive names for IAM groups to facilitate understanding and management.

- `Enforce strong password policies:` Encourage users to create strong passwords and implement expiration and complexity requirements

### Hands-on: Understanding IAM
- Navigate to the AWS Management Console
    - use the search bar to locate the Identity and Access Management (IAM) service.

![](img/1.%20search%20for%20iam.PNG)

- click on policies and create policy

![](img/2.%20click%20policies%20and%20ec2fullaccess.PNG)

- select EC2 and check all ec2 action

![](img/3.%20select%20ec2.PNG)

- create a policy for user eric

![](img/4.%20eric_policy_created.PNG)

- create user eric

![](img/5.%20create%20user.PNG)

- enter details for user Eric

![](img/6.%20eric%20details.PNG)

- attached policy_for_eric to user eric

![](img/7.%20attached%20policy%20to%20eric.PNG)

- user Eric successful created

![](img/8.%20user%20eric%20created.PNG)

- create development team group

![](img/9.%20create%20user%20group.PNG)

- enter details for development team

![](img/10.%20group%20user%20details.PNG)

- development team group successfully created

![](img/11.%20user%20group%20created.PNG)

- create user jack

![](img/12.%20create%20jack%20user.PNG)

- check development team
![](img/13.%20add%20user%20to%20group.PNG)

- user jack successfully created

![](img/14.%20user%20jack%20created.PNG)

- create user ade

![](img/15.%20create%20ade%20user.PNG)

- assign user ade to development team group and create user ade

![](img/16.%20add%20ade%20to%20group.PNG)

- create policy for development team
![](img/17.%20choose%20ec2%20and%20s3.PNG)

- select ec2 and S3 
![](img/18.%20select%20ec2%20and%20s3.PNG)

- development team policy created

![](img/19.%20group%20policy%20created.PNG)

- go to user group and select development team group
![](img/20.%20select%20development-team.PNG)

- attached development team policy to development team
![](img/21.%20attached%20policy%20to%20group.PNG)

- policy successful attached to group.

![](img/22.%20policy%20successfully%20attached.PNG)


