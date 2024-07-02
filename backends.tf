terraform {
  backend "s3" {
    bucket = "bucket-tf-state-test"
    region = "ap-south-1"
    key    = "terraform.tfstate"
  }
}