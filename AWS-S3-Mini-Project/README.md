# AWS S3 Mini Project

### Project Goals:

The primary goal of this project is to familiarize participants with Amazon S3 (Simple Storage Service) and its fundamental concepts. Participant will learn how to create and manage S3 buckets, upload objects, enable versioning set permissions for public access, and implement life cycle policies.

### What is Amazon S3?

Amazon S3 or Simple Storage Service, is like a big digital ware house where you can store all kins of data. It's part of Amazon Web Services (AWS), which is a collection of cloud computing services.

Think of S3 as a giant virtual filing cabinet in the cloud. You can put files, documents, pictures, videos, or any other digital stuff you want to keep safe and accesible.

What's coll about S3 is that its supper reliable and secure. Your data is stored across multiple servers in different locations, so even if something goes wrong with one server, your files are still safe.

### S3 Benefits

Amazon S3 offers a range of benefits that make it atop choice for storing and managing data in the cloud.

- Firstly, S3 provides exceptional durability and reliability. Your data is stored across multiple servers and data centers, ensuring that even if one server fails, your files remain safe and accessible.

- Secondly, S3 offers scalability, meaning you can easily increae or decrease your storage capacity as needed. Whether you 're storing a few gigabytes or petabytes of data, S3 handle it without any hassle.

- Another key benefit of S3 is its accessibility. You can access your data from anywhere in the world using the internet, making it convenient for remote teams or distributed applications.

- Security is also a top priority with S3. You have full control over who can access your data and can encrypt your files to ensure they remain confidential and secure.

- Additionally, S3 is cost-effective. You only pay for the storage you use, with no upfront fees or long-term contracts, making it a budget-friendly option for businesses of all sizes.

### S3 Use Cases

**Backup:** Think of it as a safe place to keep copies of important files, like your computer's backup. If anything happens to your computer, you can get your files back from S3.

**Website Stuff:** S3 can also hold all the pieces of a website, like images and videos. So, when you visit a website, some of the stuff you see might be stored in S3.

**Videos and Photos:** You know all those videos and photos you share online? They 're often stored in S3 because it's really good at keeping them safe and making sure they load fast.

**Big Data:** Companies use S3 to store huge amounts of data for things like analyzing customer behavior or trends: It's like having a big library where you can find all sorts of useful information.

**Emergency Backup:** Some companies use S3 to store copies of their data in case something bad happens, like a natural disaster. It's like having a backup plan to keep things going no matter what. 

**Keeping Old Stuff:** Sometimes, companies have to keep old records for legal reasons. S3 has special storage options that are really cheap, so its's a good place to keep all that old stuff without spending too much money.

**Sending Stuff Fast:** S3 works with a service called CloudFront, which helps deliver stuff really quickly to people all over the world. So, if you are watching a video or downloading a file, S3 helps make sure it gets to you fast.

### Step by Step Creating of S3 bucket, versioning and implement lifecycle policy.

- Navigate to the search bar on the AWS console.

![](img/1.%20search%20for%20S3.PNG)

- Locate and click on `create bucket` button

![](img/2.%20click%20on%20create%20bucket.PNG)

- enter bucket details
![](img/3.%20bucket%20details.PNG)

- Bucket successfully created

![](img/4.%20bucket%20successfully%20created.PNG)

- create a text file

![](img/5.%20create%20helloworld.PNG)

- upload the file

![](img/6.%20upload-file.PNG)
![](img/7.%20add%20file.PNG)

- click on upload
![](img/8.%20upload%20helloworld.PNG)

- file is successfully uploaded

![](img/9.%20file%20successfully%20uploaded.PNG)

- click on versioning

![](img/10.%20edit%20versioning.PNG)

- select enable

![](img/11.%20enable%20versioning.PNG)

- versioning successfully enable

![](img/12.%20bucket%20versioning%20enable.PNG)

- add more text to the text file

![](img/14.%20add%20to%20textfile.PNG)

- edit public access

![](img/15.%20edit%20public%20access.png)
![](img/16.%20uncheck%20block%20all%20public%20access.png)

- successfully turn off block all public access

![](img/17.%20turnoff%20block%20all%20public%20access.png)

- Edit bucket policy

![](img/18.%20edit%20bucket%20policy.png)

- bucket policy generator

![](img/19.%20click%20policy%20generator.png)


![](img/20.%20generate%20policy.png)
![](img/21.%20json%20generated%20policy.png)
![](img/22.%20generated%20policy.png)

- Display file before versioning was enable

![](img/23.%20display%20file%20before%20versioning.png)
![](img/24.%20b4%20versioning%20url.png)
![](img/25.%20first%20file%20display%20on%20browser.png)

- display file after enabling versioning

![](img/26.%20versioning%20file.png)
![](img/26.%20versioning%20file%20url.png)
![](img/28.%20display%20on%20url.png)

- Implementing Lifecycle

![](img/29.%20create%20lifecycle%20rule.png)
![](img/30.%20lifecycle%20details.png)
![](img/31.%20lifecycle%20actions.png)

- Successfully implemented lifecycle

![](img/32.%20my-lifecycle-created.png)