#Base Provider configuration
provider "google" {
    region      = "europe-west1"
    credentials = file("./sa/sa.json") # gcp service account json key config for terraform
}




provider "google-beta" {}


# # #Terraform Backend GCS
# terraform {
#   backend "gcs" {
#     bucket      = "sa-terraform-state-bucket"
#     prefix      = "terraform/5-Monitoring"
#     credentials = "../sa/sa.json"
#   }
# }