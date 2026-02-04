resource "aws_instance" "task2_ec2" {
  ami           = "ami-03ea746da1a2e36e7" # Amazon Linux 2023 (us-east-2) - update if needed
  instance_type = "t3.micro"

  tags = {
    Name = "task2-terraform-ec2"
  }
}
