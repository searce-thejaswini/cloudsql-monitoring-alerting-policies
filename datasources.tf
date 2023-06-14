data "google_project" "project" {
  project_id = var.project_id
}
data "archive_file" "source" {
  type        = "zip"
  source_dir  = "./src"
  output_path = "./tmp/function.zip"
}
