variable "subscription_id" {
  type    = string
  default = "455d6616-7a11-4e83-aaac-ed240458e144"
}

variable "azure_tags" {
  type = map(string)
  default = {
    Created_with = "Terraform"
    Location     = "UK South"
    Created_By   = "Louis Ruocco"
  }
}