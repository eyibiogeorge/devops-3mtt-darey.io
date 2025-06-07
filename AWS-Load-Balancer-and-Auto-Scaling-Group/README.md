# Mini Project: Configuring Auto Scaling with ALB using Launch Template

In this mini project, you will learn how to configure Auto Scaling in AWS with an Application Load Balancer (ALB) using a Launch Template. The project aims to demonstrate the automatic scaling of EC2 instances based on demand, while leveraging the benefits of a Launch Template.

### Objectives:

1. **Create Launch Template:**
    - Learn how to create a Lauch Template with the required specifications

2. **Set Up Auto Scaling Group:**
    - Configure an Auto Scaling group to manage the desired number of EC2 instances using the Launch Template.

3. **Configure Scaling Policies:**
    - Set up scaling policies to adjust the number of instances based on demand.

4. **Attach ALB to Autoscaling Group:**
    -Connect the Auto Scaling group to an existing ALB

5. **Test Auto Scaling:**
    - Verify that the Auto Scaling group adjusts the number of instances in response to changes in demand.

### Task 1: Create Launch Template

1. Login to the AWS Management console.
![](img/1.%20aws%20management%20console.PNG)

2. Navigate to the EC2 service.
![](img/2.%20ec2%20dashboard.PNG)

3. In the left navigation pane, click on "Launch Templates."
![](img/3.%20click%20on%20launch%20template.PNG)

4. Click the "Create launch template" button.
![](img/4.%20create%20launch%20template.PNG)

5. Configure the launch template settings, including the AMI, instance type, and user data.
![](img/5.%20launch%20template%20details.PNG)

### Task 2: Set Up Auto Scaling Group

1. In the AWS Management Console, navigate to the EC2 service.
![](img/2.%20ec2%20dashboard.PNG)

2. In the left navigation pane, click on "Auto Scaling Groups."
![](img/6.%20click%20on%20auto%20scaling%20group.PNG)

3. Click the "Create Auto Scaling group" button.
![](img/7,%20create%20auto%20scaling%20group.PNG)

4. Choose "Use Launch Template" and select the Lauch Template you created.
![](img/8.%20auto%20scaling%20group%20details.PNG)

5. Configure the Auto Scaling group settings, including the group name, desired capacity, and initial instances.

    - choose launch template
![](img/8.%20auto%20scaling%20group%20details.PNG)
    -  select desire capacity
![](img/11.%20capacity%20size.PNG)
    - don't attach load balancer yet
![](img/10.%20no%20load%20balancer%20selected.PNG)

6. setup addition configurations such as network settings, subnets, and scaling policies.
    - select availability zone and subbets
![](img/9.%20select%20availability%20zones.PNG)
    - skip to review
![](img/12.%20skip%20to%20review.PNG)
    - review the entire page
![](img/13.%20review.PNG)
    - click create auto scaling group
![](img/14.%20auto%20scaling%20group%20created.PNG)
    - instance launched by asg
![](img/15.%20asg%20launched%20instances.PNG)

### Task 3: Configure Scaling Policies

1. In the Auto Scaling group configuration, navigate to the "Scaling policies" section.
![](img/25.%20scaling%20policy.PNG)

2. Click on "Create scaling policy" and configure policies for scaling in and scaling out based on demand.
![](img/26.%20asg-scaling%20policy.PNG)


### Task 4: Attach ALB to Auto Scaling Group

1. In the Auto scaling group configuration, navigate to the "Load balancing" section
    - click on load balancer and create load balancer
![](img/16.%20create%20load%20balancer.PNG)
    - select application load balancer
![](img/17.%20create%20application%20load%20balancer.PNG)
    - Application load balancer details
![](img/18.%20select%20ALB%20details.PNG)
    - create target group
![](img/19.%20target%20group.PNG)
    - application load balancer created
![](img/20.%20application%20load%20balancer%20created.PNG)
    - edit security group for load balancer
![](img/21.%20alb%20security%20group.PNG)
    - edit auto scaling group
![](img/24.%20edit%20asg.PNG)

2. Click on "Edit" and select the ALB to associate with the Auto Scaling group
![](img/23.%20attached%20ASG%20to%20ALB.PNG)
    - paste dns of application load balance on browser.
![](img/22.%20ALB%20dns%20on%20the%20browser.PNG)
