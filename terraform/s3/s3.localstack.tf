provider "aws" {
  region = "us-east-1"
  access_key = "anaccesskey"
  secret_key = "asecretkey"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  s3_force_path_style = true
  endpoints {
    s3         = "http://localhost:4572"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "terraform-serverless-example-go-gin"
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "object" {
  bucket = "terraform-serverless-example-go-gin"
  key    = "v${var.app_version}/${var.lambda_zip_file_name}" 
  source = "${var.lambda_zip_file_path}/${var.lambda_zip_file_name}"
  #etag   = "${md5(file(${lambda_zip_file_path}/${lambda_zip_file_name}))}"
}

variable "lambda_zip_file_name" {
  type = "string"
  default="main.zip"
}

variable "lambda_zip_file_path" {
  type = "string"
  default= "."
}

variable "app_version" {
}

