resource "aws_security_group" "tomcat" {
  name        = "allow_tomcat"
  description = "Allow tomcat inbound traffic"
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
    from_port        = 8080
    to_port          = 8080
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
    Name = "tomcat"
    terraform="true"
  }
}

#Tomcatec2
resource "aws_instance" "Tomcat" {
  ami           = "ami-064eb0bee0c5402c5"
  instance_type = "t2.micro"
  #vpc_id=aws_vpc.vpc.id
  subnet_id = "subnet-06de794b290269766"
  vpc_security_group_ids = [aws_security_group.tomcat.id]
   key_name = aws_key_pair.newkey.id
  

  tags = {
    Name = "Tomcat-ec2"
  }
} 