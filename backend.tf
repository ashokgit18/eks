terraform {

backend "s3" {
  bucket = "talentdevops18-stategile-backup"
  region = "us-west-2"
  key = "terraform.tfstate"
  dynamodb_table= "talent-devops18-tfstate" 
}
}
