resource "aws_elastic_beanstalk_application" "ndw-test" {
  name        = var.app_name
}

resource "aws_elastic_beanstalk_environment" "ndw-test" {
  name                = var.environment_name
  application         = "${aws_elastic_beanstalk_application.ndw-test.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.10.4 running Java 8" #https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html#concepts.platforms.javase

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "${aws_iam_instance_profile.ndw-profile.name}"
  }
  
  additional_settings = [
      {
        namespace = "aws:elasticbeanstalk:application:environment"
        name      = "PORT"
        value     = "8080"
      }
   ]
}

resource "aws_iam_role" "ndw" {
  name = var.iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

data "aws_iam_policy" "AWSElasticBeanstalkWebTier" {
  arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "ndw-attach" {
  role       = "${aws_iam_role.ndw.name}"
  policy_arn = "${data.aws_iam_policy.AWSElasticBeanstalkWebTier.arn}"
}

resource "aws_iam_instance_profile" "ndw-profile" {
  name = var.iam_instance_profile_name
  role = "${aws_iam_role.ndw.name}"
}

