# Security Group for the Load Balancer
resource "aws_security_group" "lb_sg" {
  name        = "${var.name}-sg"
  description = "Allow inbound traffic for the load balancer"
  vpc_id      = var.vpc_id

  ingress {
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

# Application Load Balancer
resource "aws_alb" "app_lb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  # Removed access_logs block as it's not used
}

# Target Groups for the Load Balancer
resource "aws_alb_target_group" "app_tg" {
  count             = var.target_group_count
  name              = "${var.name}-tg-${count.index}"
  port              = 3000
  protocol          = "HTTP"
  vpc_id            = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Listener for the Load Balancer
resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_alb_target_group.app_tg[0].arn
      }
    }
  }
}
