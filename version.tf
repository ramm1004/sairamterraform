terraform {
  backend "s3" {
    bucket = "sairam-bucket"
    key = "sairam.tfstate"
    region = "eu-west-3"
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

}
