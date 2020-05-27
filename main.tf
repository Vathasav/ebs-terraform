
module "dev-webapp" {
    source = "./modules/java-webapp"
    
    app_name = var.app_name
    environment_name = var.environment_name
    s3_bucket_name = var.s3_bucket_name
    s3_bucket_key = var.s3_bucket_key
    appversion = var.appversion
}
