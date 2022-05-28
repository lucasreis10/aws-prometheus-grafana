resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "appliance" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]
}

resource "aws_instance" "appliance" {
  ami           = "ami-06eecef118bbf9259" #Region ami: us-east-1
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.appliance.id
    device_index         = 0
  }
}

resource "aws_security_group" "sg_allow_ssh_http" {
  name   = "Rule security group allow acess ports ssh and http"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP to EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}