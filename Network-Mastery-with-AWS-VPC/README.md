# Network Mastery with AWS VPC mini project

In this session, we'll explore the core concepts of Amazon Web Service (AWS), focusing specifically on Virtual Private Clouds (VPCs). Our objective is to understand the fundamental components of VPC infrastructure, including subnets, gateways, and routing tables. Through practical demonstrations and interactive exercises, we'll navigate the AWS management console to deploy and mange these critical components effectively.

### Project Goals

- Understand the fundamentals of Virtual Private Cloud (VPC) and its components.
- Gain hands-on experience in setting up and configuring VPC, subnets, internet gateway, NAT gateway, and VPC peering connections.
- Learn how to enable internet connectivity securely with a VPC.
- Implement outbound internet access through the NAT gateway.
- Establish direct communication between VPCs using peering.

### Learning Outcomes:

- Acquired knowledge about VPC and its essential components, such as subnets, gateways, and route tables.
- Developed skills in creating and configuring VPC resources using AWS management console.
- Learned how to set up routing tables to enable internet connectivity and outbound internet access securely.
- Gained understanding of VPC peering and its significance in connecting multiple VPCs within the same or different regions.
- Enhanced understanding of network security principles and best practices for cloud environments.

### What is VPC, Subnets, Internet Gateway and NAT Gateway?

You can imagine you're building a virtual space for the company tinitini.com so that the computers can communicate securely. That's what VPC is all about. Its like creating a private room in the cloud just for tinitini.com use.

**Here's an example:** Think of tinitini.com office building. Inside, there are different departments like HR, Finance, and IT. Each department has its own area with specific access rules. Similarly, in a VPC, tinitini.com can create different sections, called `Subnets`, for different parts of the business.

Now, lets say tinitini.com wants to connect its office to the internet. They'd use a router to control the flow of data in and out of the building. In a VPC, tinitini.com has something similar called an `Internet Gateway`. It lets their VPC communicate with the internet securely.

`NAT (Network Address Translation) Gateway` as a secret agent between tinitini.com computers and the internet. When a computer inside their virtual office wants to talk to the internet, the NAT Gateway steps in. It tranlates the computers message and sends it out, but it hides who sent it. Its like sending a letter without your return address. This way, the internet only sees the NAT Gateways address, keeping tinitini.com computers safe and anonymous online.

### Part-1

- Navigate tot he search bar, enter `VPC`

![](img/1.%20search%20for%20vpc.PNG)

- click on `your VPCs`
![](img/2.%20create%20vpc.PNG)

-select `VPC` details and click on `create VPC`

![](img/3.%20vpc%20details.PNG)

- VPC successfully created

![](img/4.%20vpc%20created.PNG)

- display created VPC with IPV4 CIDR block

![](img/5.%20display%20created%20vpc.PNG)

### Part-2

- Navigate to the `Subnets` option located on the left sidebar

![](img/6.%20create%20a%20subnet.PNG)

- select the ID of the VPC that you created in the previous step

![](img/7.%20select%20vpc.PNG)

- enter details for subnet and click create subnet

![](img/8.%20subnet%20details.PNG)

- Subnet successfully created

![](img/9.%20subnet%201%20created.PNG)

- Display created subnet

![](img/10.%20display%20created%20subnet.PNG)

- Diagramatic ilustration of VPC and subnet

![](img/10.%20vpc%20diagram%201.PNG)

### Part-3

- Navigate to the `Internet Gateway` option on the left sidebar.

![](img/11.%20create%20internet%20gateway.PNG)

- enter details for internet gateway and click create internet gateway

![](img/12.%20internet%20gateway%20created.PNG)

- Internet gateway successfully created

![](img/13.%20igw%20created.PNG)

- Attach internet gateway to VPC

![](img/14.%20attach%20to%20vpc.PNG)
![](img/15.%20select%20vpc%20to%20attached.PNG)
![](img/16.%20igw%20attached.PNG)
~[](img/46.%20diagram%205.PNG)

### Part-4

- Navigate to the `Route Tables` option located on the left sidebar.

- Once there, click on the  Create route table` button.

![](img/17.%20create%20route%20table.PNG)
![](img/18.%20route%20table%20details.PNG)

- Subnet association

![](img/19.%20subnet%20association.PNG)
![](img/20.%20save%20associations.PNG)
![](img/21.%20edit%20route.PNG)
![](img/22.%20select%20default%20static%20route.PNG)

- Internet gateway is connected to public subnet

![](img/47.%20diagram%206.PNG)

### Part-5

- Navigate to the `NAT Gateways` section, then click on `Create NAT Gateway.`

![](img/23.%20create%20NAT%20gateway.PNG)
![](img/24.%20NAT%20gateway%20details.PNG)

- NAT gateway created

![](img/25.%20nat%20gw%20created.PNG)
![](img/26.%20edit%20private%20route%20table.PNG)
![](img/27.%20edit%20route.PNG)
![](img/28.%20edit%20route%20details.PNG)
![](img/29.%20edit%20subnet%20associations.PNG)
![](img/30.%20save%20associations.PNG)
![](img/31.%20private%20subnet%20associated.PNG)

- Connect NAT Gateway

![](img/48.%20connect%20NAT%20gateway.PNG)

### What is VPC Peering?

VPC peering is like connecting two virtual offices in the cloud so they can talk to each other directly, Just imagine tow neighbouring offices sharing files and chatting wihtout going through a middleman.

- By default, EC2 instances in different VPCs cannot communicate with each other.

- To enable communication between EC2 instances in different VPCs, you can set up VPC peering, VPN connections, or AWS Direct Connect.

- VPC peering establishes a direct network connection between the VPCs, allowing EC2 instances in one VPC to communicate with EC2 instances in the other VPC.

### Why do we need VPC Peering?

We need VPC peering when we want different parts of our cloud network (VPCs) to work together smoothly. Maybe you have one VPC for your development team and another for your marketing team, and you want them to share data securely. That's where VPC peering comes in handy, it lets these VPCs communicate directly, making things easier for everyone.

**Additionally, there are some key points that you should be aware of.

- Two VPCs cannot connect to each other. You need to set up VPC peering or use a VPN or Direct Connect to establish connectivity between VPCs.

- Subnets within the same VPC can communicate with each other by default. AWS sets up route tables to allow communication within the same VPC.

- EC2 instances in the subnet can communicate with each other by default, assuming they have proper security group rules allowing the desired traffic.

- EC2 instances in different subnets with the same VPC can also communicate with each other by default, as long as their associated route tables are configured to allow traffic between subnets.

### Part-6

- Lets begin by creating two VPCs in the same region namely: accepter and requester.

![](img/32.%20create%20requester%20vpc.PNG)
![](img/33.%20create%20accept%20vpc.PNG)
![](img/34.%20vpc%20c.PNG)

- Navigate to the `Peering Conections` option on the left sidebar.

![](img/35.%20create%20peering%20connection.PNG)
![](img/36.%20peering%20details.PNG)
![](img/37.%20accept%20vpc%20peering%20request.PNG)
![](img/38.%20click%20accept%20request.PNG)
![](img/39.%20main%20route%20table%20for%20accepter.PNG)
![](img/40.%20edit%20routes.PNG)
![](img/41.%20add%20route.PNG)
![](img/42.%20edit%20route%20and%20save%20changes.PNG)

- Diagrame ilustrating VPC peering

![](img/43.%20vpc%20peering%20diagram.PNG)

### VPC endPoint

Think of a VPC endpoint like a dedicated, secure tunnel between your house (VPC) and a library (AWS service). Instead of going through the bustling streets (public internet), you have a direct pathway from your home to the library. This pathway ensures that only you and authorized users can access the library's resources, like books or documents, without exposing them to outside risks. It's a private, efficient way to access what you need, keeping your data safe from prying eyes on the internet.

**Let's understand the problem we were facing**

When you're backing up data from an EC2 instance to an S3 bucket, it usually goes over the internet, whether the instance is in a public or private subnet. But if the data is sensitive, that means it's risky because hackers could try to get it while it's traveling over the internet.

![](img/44.%20diagram%203.PNG)

To avoid this risk, we can use something called VPC endpoints. These endpoints make a private connection between the VPC and S3, so the data doesn't have to go over the internet. This way, even sensitive data stays safe from hackers and other threats.

![](img/45.%20diagram%204.PNG)
