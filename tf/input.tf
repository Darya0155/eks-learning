variable "data" {
  type = object({
    region=string
  })
  default = {
    region="ap-south-1"
  }
}