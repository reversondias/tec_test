variable "default_region" {
    type = string
    description = "The default region to using in the code."
    default = "us-east-1"
}

variable "ami_owner" {
    type = string
    description = "The AMI owner ID. The deafult is Canonical"
    default = "099720109477"
}

variable "ami_name_filter" {
    type = string
    description = "The name for looking for a instance"
    default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}

variable "ec2_size_type" {
    type = string
    description = "The kind of size to use in instances"
    default = "t2.micro"
}

variable "ec2_name" {
    type = string
    description = "The name to EC2"
    default = "ec2-my-app"
}

variable "letters_to_zone" {
    type = list(string)
    description = "Letters used to specify the AZ from region."
    default = ["a","b","c"]
}

variable "key_pair_name" {
    type = string
    description = "If necessary to use a key pair to SSH access."
    default = ""
}

variable "arn_s3" {
    type = string
    description = "ARN from S3 that EC2 will access."
    default = "arn:aws:s3:::meu-s3-reverson"
}