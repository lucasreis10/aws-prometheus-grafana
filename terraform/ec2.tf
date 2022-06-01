resource "aws_instance" "appliance" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_a.id
  vpc_security_group_ids      = [aws_security_group.sg_ec2_instance.id]
  key_name                    = var.generated_key_name

  user_data = file("./bootstrap_instance.sh")

  provisioner "file" {
    source      = "./docker-compose.yml"
    destination = "/home/ec2-user/stack-prometheus/"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.generated_key_name}.pem")
      host        = aws_instance.appliance.public_ip
    }
  }
}

