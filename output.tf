output "aws_command" {
  value = module.java-webapp.ebs_update_environment_command
  description = "The command to deploy a version of app to environment"
}
