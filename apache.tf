resource "aws_security_group" "apache-cicd" {
  name        = "allow_apache"
  description = "Allow apache inbound traffic"
  vpc_id      = "vpc-08e9ce437655bfcbb"

  ingress {
    description      = "ssh from admin"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

   ingress {
    description      = "for alb"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
   # security_groups = [aws_security_group.alb.id]
   cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Apache-cicd"
    terraform="true"
  }
}