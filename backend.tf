terraform {
  backend "s3" {
    bucket = "ndw-snapshot"
    key    = "0.1"
    region = "eu-north-1"
  }
}
