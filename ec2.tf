resource "aws_instance" "apache" {
  ami           = "ami-064eb0bee0c5402c5"
  instance_type = "t2.micro"
  #vpc_id=aws_vpc.vpc.id
  subnet_id = "subnet-06de794b290269766"
  vpc_security_group_ids = [aws_security_group.apache-cicd.id]
   key_name = aws_key_pair.newkey.id
   user_data = <<-EOF
            #!/bin/bash
            yum update -y
            yum install httpd -y
             systemctl start httpd
             systemctl enable httpd
             EOF

  tags = {
    Name = "apache-ec2"
  }
}

#cicdec2
resource "aws_instance" "cicd" {
  ami           = "ami-064eb0bee0c5402c5"
  instance_type = "t2.micro"
  #vpc_id=aws_vpc.vpc.id
  subnet_id = "subnet-06de794b290269766"
  vpc_security_group_ids = [aws_security_group.cicd.id]
   key_name = aws_key_pair.newkey.id
   user_data = <<-EOF
            #!bin/bash
             wget -O /etc/yum.repos.d/jenkins.repo \
                 https://pkg.jenkins.io/redhat-stable/jenkins.repo
            rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
            yum update -y
# Add required dependencies for the jenkins package
#sudo yum install java-11-openjdk
             amazon-linux-extras install java-openjdk11
             yum install jenkins -y
               systemctl start jenkins
             systemctl enable jenkins
             cd /opt
             wget https://dlcdn.apache.org/maven/maven-3/3.9.1/binaries/apache-maven-3.9.1-bin.tar.gz
              tar -xzf apache-maven-3.9.1-bin.tar.gz
              mv apache-maven-3.9.1 maven39
             EOF
  tags = {
    Name = "cicd"
  }
}