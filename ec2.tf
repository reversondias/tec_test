resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.id
  instance_type = var.ec2_size_type

  iam_instance_profile = aws_iam_role.s3-role.name
  key_name = var.key_pair_name
  #security_groups = [aws_security_group.ec2_app_sg.name,"default"] 
  vpc_security_group_ids = [aws_security_group.ec2_app_sg.id,data.aws_security_groups.default_vpc_sg_id.ids[0]]
  #subnet_id = aws_subnet.private-subnet[0].id

  user_data = file("userdata.sh")

  tags = {
    Name = var.ec2_name
  }
}