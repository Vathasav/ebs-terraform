variable "app_name" {
  default = "ndw-test"
  description = "The name of the application"
}

variable "environment_name" {
  default = "ndw-test"
  description = "The name of the environment"
}

variable "iam_role_name" {
  default = "ndw-iam"
  description = "The name of the iam role"
}

variable "iam_instance_profile_name" {
  default = "ndw-profile"
  description = "The name of instance profile"
}
