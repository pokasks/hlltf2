variable "KeyPair_pub" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3yu+bHuOILNTi8jUEsglJAIxTdXpfFaQQYau5u5QKuLaoPEM/i55hNPNYSPimu9UCB7s4XE2Bos31IU6+6l4jHdkGJjGUzFE8TGZXAEY547ajp0JiQ8jQdjB+LUU/c74/QW7OaHyT8bHJML222lkIfgDo9Sln3HLvCp3/EWWGwqJKC6F6npJ1nj0VDgPiU8JIKwmxkLCjprKa5I2kjx4weoNzHNLor00+PT/nvyXpXv9LLvqiB4mkooVcDz7lHdqDCQxY8oziCnzQe9MJpaRUOkLp7Nbd8vh40ppwRDar759qOC9BD6PXSr99PvG217YlJWkblfdwRx1s4m1hqh19"
  description = "Provide your ssh public key, or use included one."
}
variable "aws_inst_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance Type"
}
variable "aws_ami_id" {
  // us-east-1 only
  type        = string
  default     = "ami-0885b1f6bd170450c"
  description = "Image ID ami-0885b1f6bd170450c - for Ubuntu 20.04 LTS or ami-0be2609ba883822ec for AmazonLinux"
}
variable "add_elastic_ip" {
  type        = bool
  default     = false
  description = "Attach elastic IP"
}