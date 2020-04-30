terraform {
  backend "s3" {
    bucket = "ndw-snapshot"
    key    = "global/s3/terraform.tfstate"
    region = "eu-north-1"
  }
}
