#Cloud Function Deployment for Alert formatting
resource "google_cloudfunctions_function" "function" {
  project = "terraformer-376507"
  region = "us-central1"
  name        = "cloud-monitoring-cloud-func-01"
  description = "cloud function for formatiing alerts"
  runtime     = "python39"

  available_memory_mb          = 128
  source_archive_bucket        = google_storage_bucket.bucket.name
  source_archive_object        = google_storage_bucket_object.zip.name
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  timeout                      = 60
  entry_point                  = "process_pubsub"
  labels = {
    my-label = "custom-alerts"
  }
 environment_variables = {
    WEB_HOOK_URL = var.webhookurl
  }
}
