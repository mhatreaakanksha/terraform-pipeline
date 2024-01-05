terraform {
  backend "s3" {
    bucket = "devops-aakanksha"
    key    = "global/s3/terraform.tfstate"
    region = "ap-south-1"
  }
}