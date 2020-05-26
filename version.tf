#variable "appversion" {
#  type = "string"
#  default = "0.1-SNAPSHOT"
#}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "elastic-beanstalk-ndw-${var.appversion}"
  application = "${aws_elastic_beanstalk_application.ndw-test.name}"
  description = "application version created by terraform"
  bucket      = "${data.aws_s3_bucket.ndw-test.id}"
  key         = "${data.aws_s3_bucket_object.application-jar.key}"
}

data "aws_s3_bucket" "ndw-test" {
  bucket = var.s3_bucket_name
}

data "aws_s3_bucket_object" "application-jar" {
  bucket = "${data.aws_s3_bucket.ndw-test.id}"
  key    = var.s3_bucket_key
}
