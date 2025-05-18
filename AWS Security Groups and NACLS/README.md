# Security Grops and NACLs Mini Project

This project focuses on Security Groups and Network Access Control Lists (NACLs). OUr objective is to understand these fundamental componets of AWS infrastructure, including how Security Groups control inbound and outbound traffic to EC2 instances, and how NACLs act as subnet-level firewalls, regulating traffic entering and exiting subnets.
Through practical demonstrations and interactive exercises, we'll navigate the AWS management console to deploy and manage these critical components effectively.

### Project Goals:

- Understand the concepts of Security Groups and Network Access Control Lists (NACLs) in AWS.

- Explore how Security Groups and NACLs function as virtual firewalls to control inbound and outbound traffic

- Gain hands-on experience with configuring security groups and NACLS to allow or deny specific types of traffic.

### Learning Outcome:

- Gain proficiency in configuring Security Groups and NACLs to control network traffic within AWS environments.

- Understand the differences between Security Groups and NACLs, including their scope, statefulness, and rule configurarions.
- Learn how to troubleshoot network nonnectinvity issues by analyzing Zecurity Group and NACL configurations.
- Develop a deeper understanding of AWS network concepts and best practices for securing cloud environments.

### Security Group (SG):
**Inbound Rules:** Rules that control the incoming traffic to an AWS resource, such as an EC2 instance or an RDS database.

**Outbound Rules:** Rules that control that outgoing traffic from an AWS resource.

**Stateful:** Security groups automatically allow return traffic initiated by the instances to which they are attached.

**Port:** A communication endpoint that processes incoming and outgoing network traffic. Security groups use ports to specify the types of traffic allowed.

**Protocol:** The set of rules that governs the communication between different endpoints in a network. Common protocols include TCP, UDP, and ICMP.

###Network Access Control List (NACL):

**Subnet-level Firewall:** NACLs act as a firewall at the subnet level, controlling traffic entering and exiting the subnet.

**Stateless:** Unlike security groups, NACLs are stateless, meaning they do not automatically allow return traffic. you must explicitly configure rules for both inbound and outbound traffic.

**Allow/Deny:** NACLs rules can either allow or deny traffic based on the specified criteria.

**Ingress:** Refers to inbound traffic, i.e., traffic entering the subnet.

**Egress:** Refers to outbound traffic, i.e., traffic exiting the subnet.

**CIDR Block:** Specifies a ranges of IP addresses in CIDR notation (e.g., 10.0.0.0/24) that the NACL rule applies to.

### Default Settings:

**Default Security Group:** Every VPC comes with a default security group that allows all outbound traffic and denies all inbound traffic by default.

**Default NACL:** Every subnet within a VPC is associated with a defaulty NACL that allows all inbound and outbound traffic by default.

### What is Security Group?

Imagine you're hosting a big party at your house. You want to make sure only the people you invite can come in, and you also want to control what they can do once they're inside.

AWS security groups are like bouncers at the door of your party. They decide who gets to come in (inbound traffic) and who gets kicked out (outbound traffic). Each security group is like a set of rules that tells the bouncers what's allowed and what's not.

For example, you can create a security group for your web server that only allows traffic on port 80 (the standard port for web traffic) from the internet. This means only web traffic can get through, keeping your server safe from other kinds of attacks.

Similarly, you can have another security group for your database server that only allows traffic from your web server. This way, your database is protected, and only your web server can access it, like a VIP area at your party.

In simple terms, security group act as barriesrs that control who can access your AWS resources and what they can do once the're in. They're like digital bouncers that keep your party (or your cloud) safe and secure.

### What is NACL?

NACL stands for Network Access Control List. Think of it like a security checkpoint for your entire neighbourhood in the AWS cloud. Imagine your AWS resources are houses in a neighbourhood, and you want to control who can come in and out. That's where NACLs come in handy.

NACLs are like neighbourhood security guards. They sit at the entrance and check every person (or packet of data) that wants to enter or leave the neighbourhood.

But here's the thing: NACLs work at the subnet level, not the individual resource level like security groups. So instead of controlling access for each house (or AWS resource), they control access for the entire neighbourhood (or subnet).

You can set rules in your NACL to allow or deny traffic based on things like IP addresses, protocols, and ports. For example, you can allow web traffic (HTTP) but block trafic on other ports like FTP or SSH

Unlike security groups, which are stateful (meaning the remember previous interations), NACLs are stateless. This means you have to explicitly allow inbound and outbound traffic separately, unlike security groups where allowing inbound traffic automatically allows outbound traffic related to that session.

In simple terms, NACLs act as gatekeepers for your AWS subnets, controlling who can come in and out based on a set of rules you define. They're like the security uards that keep your neighbourhood (or your AWS network) safe and secure.

### Difference between Security Groups and NACL

Security Groups in AWS act like virtual firewalls that control traffic at the instance level. They define rules for inbound and outbound traffic based on protocols, ports, and IP addresses. Essentially, they protect individual instances by filtering traffic, allowing only authorized communication.

On the other hand, Network Access Control Lists (NACLs) fucntion at the subnet level, overseeing traffic entering and leaving subnets. They operate as a barrier for entire subnets, filtering traffic based on IP addresses and protocol numbers. Unlike security groups, NACLs are stateless, meaning they don't remember the state of the connection, and each rule applies to both inbound and outbound traffic independently.

**Note-** In security groups, there's no explicit `deny` option as seen in NACLs; any rule configured within a security group implies permission, meaning that if a rule is established, it's automatically allowed.

### Hands-on Security Group

- Initially we'll examine the configuration of inbound and outbound rules for security groups.

- Create a security group allowing HTTP for all traffic and attach it to the instance.

*** explore various scenarios:**

- implement inbound traffic rules for HTTP and SSH protocols and allow outbound traffic for all.

- Configure inbound rules for HTTP with no outbound rules.

- Remove both inbound and outbound rules.

- Have no inbound rules but configure outbound rules for all traffic.

### Part 1

EC2 instance use in hosting tinitini website

![](img/1.%20EC2%20dashboard.PNG)

Security Group, inbound rules

![](img/2.%20Security%20group%20inbound%20rule.PNG)

Security Group, outbound rules

![](img/3.%20security%20group%20outbound%20rules.PNG)

server public ip address

![](img/4.%20public%20ip%20address.PNG)

Site can't be reached

![](img/5.%20web%20site%20can't%20be%20reached.PNG)

Created a security group

![](img/6.%20create%20security%20group.PNG)

![](img/7.%20security%20group%20details.PNG)

![](img/8.%20select%20http.PNG)

Attached security group to EC2

![](img/9.%20click%20on%20action.PNG)

![](img/10.%20change%20security%20group.PNG)

![](img/11.%20new%20sg%20added.PNG)

copy the public ip again and run it

![](img/12.%20try%20the%20public%20ip%20address%20again.PNG)

![](img/13.%20it%20works.PNG)

display outbound rules

![](img/14.%20outbound%20rules.PNG)

delete outbound rules

![](img/15.%20delete%20outbound%20rules.PNG)

outbound rules deleted
![](img/16.%20no%20outbound%20rules.PNG)

Webpage still work, outbound rules doesn't affect the web page

![](img/17.%20it%20works.PNG)

Edit inbound rules
![](img/18.%20edit%20inbound%20rules.PNG)

delete inbound rule

![](img/19.%20delete%20inbound%20rules.PNG)

display no inbound rules

![](img/20.%20no%20inbound%20rule.PNG)

webpage not found

![](img/21.%20webpage%20unavailable.PNG)

![](img/22.%20edit%20outbound%20rules.PNG)

![](img/23.%20http%20selected.PNG)

![](img/24.%20traffic%20is%20going%20out%20via%20http.PNG)

### Hands-on Network Access Control List (NACL)

- Examine the default settings for both inbound and outbound rules in NACL configuration.

- Modify the inbound rules to permit traffic from any IPV4 CIDR on all ports.

- Adjust the outbound rules to allow traffic to all CIDRs.

Navigate to VPC

![](img/25.%20search%20for%20vpc.PNG)

Click on NACL and Create NACL

![](img/26.%20create%20NACLs.PNG)

![](img/27.%20NACL%20details.PNG)

Display NACL inbound rules

![](img/28.%20nacl%20inbound%20rules.PNG)

Display NACL outbound rules

![](img/29.%20nacl%20outbound%20rules.PNG)

Edit NACL inbound rules

![](img/30.%20edit%20nacl%20inbound%20rules.PNG)

![](img/31.%20add%20new%20rule.PNG)

Associate subnet to NACL

![](img/32.%20edit%20subnet%20association.PNG)
![](img/33.%20no%20subnet%20association.PNG)
![](img/34.%20associate%20with%20subnet.PNG)

Subnet successfully assocaited

![](img/35.%20successfully%20associated.PNG)
![](img/36.%20cant%20reached%20site.PNG)
![](img/37.%20all%20inbound%20rules.PNG)
![](img/38.%20edit%20outbound%20rules.PNG)
![](img/39.%20allow%20all%20traffic.PNG)

![](img/17.%20it%20works.PNG)

So we are unable to access the website. why? Even if we have allowed inbound traffic for HTTP in security group.

Imagine you're at the entrance of a building, and there's a security guard checking everyone who wants to come in. That security guard is like the NACL. They have a list of rules (like "no backpacks allowed" or "no food or drinks inside"), and they check each person against these rules as they enter.

Once you're inside the building, there's another layer of security at each room's door. These are like the security group. Each room has its own rules, like "only employees allowed" or "no pets."

These rules are specific to each room, just like security groups are specific to each EC2 instance.

So, the traffic first goes through the NACL (the security guard at the entrance), and if it passes those rules, it then goes through security group (the security check at each room's door). If it doesn't meet any of the rules along the way, it's denied entry.

The reason we can't see the website is because the NACL has denied inbound traffic. This prevents traffic from reaching the security group, much like a security guard not allowing entry to another room if access to the building is denied. Similarly, if someone can't enter a building, they can't access any rooms inside without first gaining entry to the building.

**Let's have a look on some scenarios and their outcomes,**

- NACL allows all inbound and outbound traffic, security group denies all inbound and outbound traffic: Outcome: Website access will be blocked because the Security Group denies all traffic, overriding the NACL's allowance.

- NACL denies all inbound and outboud traffic, Security Group allows all inbound and outbound traffic: Outcome: Website access will be blocked because the NACL denies all traffic, regardeless of the security group's allowances.

NACL allows HTTP inbound traffic, outbound traffic is denied, Security Group allows inbound traffic and denies outbound traffic: Outcome: Website access will be allowed because the security group allows HTTP inbound traffic, regardless of the NACLs allowances. However, if the website requires outbound traffic to function properly, it won't work due to the security groups denial of outbound traffic.

- NACL allows all inbound and outbound traffic, security group allows HTTP inbound traffic and denies outbound traffic: Outcome: Website access will be allowed because the security group allows HTTP inbound traffic, regardless of the NACL's allowances. However, if the website requires outbound traffic to function properly, it won't work due to the security group's

- NACL allows all inbound and outbound traffic, security group allows all inbound and outbound traffic: Outcome: Website access will be allowed, as both NACL and Security Group allow all traffic.

- NACL denies all inbound and outbound traffic, Security Group allows HTTP inbound traffic and denies outbound traffic: Outcome: Website access will be block because the NACL denies all traffic, regardless of the security group allowances.





