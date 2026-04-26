variable "dynamoDB_table_name" {
  description = "This variable holds dynamoDB name"
  default = "dynamoDB-remote-table"
  type = string
}

variable "env" {
  description = "This variable holds the environment"
  #default = "dev"
  type = string
}

variable "dynamoDB_table_count" {
  description = "This variable holds dynamoDB table count"
  type = number
}