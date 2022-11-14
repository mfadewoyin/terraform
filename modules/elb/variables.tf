variable "elb_name" {
  type        = string 
}
variable "availability_zone" {
  type        = list(string)
  description = "The AZ for the subnet"
}

variable "tag_environment" {
  type        = string
  description = "A mapping of tags which should be assigned to the resource."
}
