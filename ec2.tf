resource "aws_instance" "aws_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count

  tags = {
    Name = "server-${count.index + 1}"
  }

}


resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name

}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_range

}