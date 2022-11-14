variable "security_group_name" {
  type        = string 
}

variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC."
}