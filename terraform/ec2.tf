resource "aws_key_pair" "my_key" {
 key_name   = "my_key"
 public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
}

resource "aws_instance" "appliance" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_a.id
  vpc_security_group_ids      = [aws_security_group.sg_ec2_instance.id]

  user_data = file("./bootstrap_instance.sh")

}

