resource "aws_s3_bucket" "artifactory"{
    bucket="artifactory-cicd-demo"
    
    tags = {
    Name = "s3-demo"
  }
  
}