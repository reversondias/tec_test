resource "aws_vpc" "private_vpc" {
  cidr_block = "172.20.0.0/16"

  tags = {
    Name = "private-vpc"
  }
}

resource "aws_subnet" "private-subnet" {
  count             = 3
  vpc_id            = aws_vpc.private_vpc.id
  cidr_block        = "172.20.1${count.index}.0/24"
  availability_zone = "${var.default_region}${var.letters_to_zone[count.index]}"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_security_group" "ec2_app_sg" {
  name        = "EC2 APP SG"
  description = "This SG for APP"
  vpc_id      = aws_vpc.private_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.private_vpc.cidr_block]
  }

  ingress {
    description = "Non-TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.private_vpc.cidr_block]
  }

}