variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "bucket_name" {
  type = string
}

variable "cidr_range" {
  type = string
}