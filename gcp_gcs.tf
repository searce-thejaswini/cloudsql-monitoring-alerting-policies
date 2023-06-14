resource "google_storage_bucket" "bucket" {
  name                        = "${var.project_id}-function"
  project                     = var.project_id
  location                    = "us-central1"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false
  force_destroy               = false
  public_access_prevention    = "inherited"
}
resource "google_storage_bucket_object" "zip" {
    source       = data.archive_file.source.output_path
    content_type = "application/zip"
    name         = "custom-alert-func.zip"
    bucket       = google_storage_bucket.bucket.name
    depends_on   = [
        google_storage_bucket.bucket,  
        data.archive_file.source
    ]
}
