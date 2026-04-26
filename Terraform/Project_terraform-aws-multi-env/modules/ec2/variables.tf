# values can be changed in runtime / values are available throughout the folder:
variable "ec2_instance_name" {
  description = "This variable holds EC2 instance name"
  default = "terra-automate-server"
  type = string
}

variable "ec2_instance_size" {
  description = "This variable holds EC2 instance size"
  default = 10
  type = number
}

variable "ec2_instance_state" {
  description = "This variable holds EC2 instance state"
  default = "running"
  type = string
}

variable "ec2_instance_count" {
  description = "This variable holds EC2 instance count"
  #default = 1
  type = number
}

variable "ec2_ami_id" {
  description = "This variable holds EC2 instance ami id"
  default = "ami-0ec10929233384c7f"
  type = string
}

variable "ec2_instance_type" {
  description = "This variable holds EC2 instance type"
  default = "t3.micro"
  type = string
}

variable "env" {
  description = "This variable holds the environment"
  #default = "dev"
  type = string
}
