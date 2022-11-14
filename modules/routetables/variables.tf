variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "tag_name" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}

variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}