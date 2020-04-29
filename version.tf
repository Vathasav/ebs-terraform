variable "appversion" {
  type = "string"
  default = "0.1-SNAPSHOT"
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "elastic-beanstalk-ndw-${var.appversion}"
  application = "${aws_elastic_beanstalk_application.ndw-test.name}"
  description = "application version created by terraform"
  bucket      = "${data.aws_s3_bucket.ndw-test.id}"
  key         = "${data.aws_s3_bucket_object.application-jar.key}"
}

data "aws_s3_bucket" "ndw-test" {
  bucket = "ndw-snapshot"
}

data "aws_s3_bucket_object" "application-jar" {
  bucket = "${data.aws_s3_bucket.ndw-test.id}"
  key    = "ndw-snapshot/0.1/ndw-${var.appversion}.jar"
}
