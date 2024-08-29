# Create Security Group for EC2 Instances
resource "aws_security_group" "ec2_sg" {
  name        = "${var.name}-ec2-sg"
  description = "Allow inbound traffic for EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-ec2-sg"
  }
}

# Create EC2 Instances
resource "aws_instance" "app_instance" {
  count         = 3
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name      = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y nodejs npm
    git clone ${var.git_repo} /home/ubuntu/app
    cd /home/ubuntu/app
    npm install
    node server.js
  EOF

  tags = {
    Name = "${var.name}-instance-${count.index + 1}"
  }
}

# Output EC2 Public IPs (for reference)
output "ec2_public_ips" {
  value = aws_instance.app_instance.*.public_ip
}

# Output EC2 Private IPs (for Load Balancer)
output "ec2_private_ips" {
  value = aws_instance.app_instance.*.private_ip
}
