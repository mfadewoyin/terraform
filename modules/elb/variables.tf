variable "elb_name" {
  type        = string 
}
variable "subnet" {
  type        = string 
}


variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}
variable "security_groups" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}