# Tech Task 1
In this task cover the bellow down topics:  
- Create a role with s3 access.  
- Launch an ec2 instance with a role inside the private subnet of VPC, and install apache through bootstrapping.  
- Create a load balancer in public subnet.  
- Add the ec2 instance, under the load balancer  

## [ATTENTION] Important information about versions
- Terraform version: **0.12.20**  
- AWS provider version: **3.25.0**  

## Aboute S3 access
This code was made thinking to allow full access in only one S3 bucket. Then is necessary declare the name of S3 bucket.  
If necessary grant access for all S3 buckets, use **\***.    

## Variables
Almost of variables used in this code has default values.  
In the *variables.tf* file there are short descriptions aboute each variable.  

Variables with default values:  
- default_region: default = "us-east-1"  
- ami_owner: default = "099720109477"  
- ami_name_filter: default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"  
- ec2_size_type: default = "t2.micro"  
- ec2_name: default = "ec2-app"  
- letters_to_zone: default = ["a","b","c"]  
- key_pair_name: default = ""  
- count_instance: default = ""  
- health_check_interval: default = 35  
- health_check_timeout: default = 30  

Have to declare:  
- s3_name: S3 bucket name to create a policy role in AWS IAM  

**[IMPORTANT]** - Two variables it is important to say:  
- **key_pair_name**: Used to set a SSH key pair to access the instance if it wish.  
- **count_instance**: If empty the code understand as one instance is wished.  


In the repository there is a *vars.tfvars* file as a exemple variables file to use with terraform code.  