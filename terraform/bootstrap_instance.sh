#!/bin/bash
sleep 4
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo yum install git -y
echo "/usr/bin/git clone https://gitlab.com/sg-wolfgang/stack-prometheus.git /home/ec2-user/stack-prometheus" > /home/ec2-user/clonerepo.sh
sudo chmod +x /home/ec2-user/clonerepo.sh
sudo sh /home/ec2-user/clonerepo.sh
cd /home/ec2-user/stack-prometheus/
/usr/local/bin/docker-compose up -d