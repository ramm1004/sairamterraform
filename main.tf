resource "aws_security_group" "ec2_sg" {
  name        = "deploydragons"
  description = "Allow SSH, HTTP, and custom 8080"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow custom app port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-04ec97dc75ac850b1" # Ubuntu 22.04 LTS in ap-south-1 (Mumbai). Change if in another region
  instance_type = "t2.micro"
  key_name      = "sairams3" # Use your existing key-pair name

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Sairam_Terraform-EC2-Lab-Ubuntu"
  }
}