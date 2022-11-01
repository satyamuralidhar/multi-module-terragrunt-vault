variable "location" {
}

variable "prefix" {
    default = "satya"
}

variable "tagging" {
  type = object({
    env = string
    application = string
  })
  default = {
    application = "web"
    env = "prod"
  }
  validation {
    condition = length(var.tagging.env) > 3
    error_message = "enviroment name needs to be minimum foure charecters"
  }
}

variable "subnet" {
  type = list
  default = ["192.168.1.0/24" , "192.168.2.0/24"] 
}

variable "env" {
  default = ""
}

variable "ami_id" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "azs" {
  type = list
  default = ["ap-south-1a" , "ap-south-1b"]
}
