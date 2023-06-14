resource "google_pubsub_topic" "example" { 
  project = var.project_id
  name = "cloualert-topic"

  labels = {
    test = "alertpolicy"
  }
  message_retention_duration = "86600s"
}


resource "google_pubsub_subscription" "subscription" {
  project = var.project_id
  name  = "cloudalert-subscription"
  topic = google_pubsub_topic.example.name

  labels = {
    user = "monitoringalertpolicy"
  }


  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true
  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  
  retry_policy {
    minimum_backoff = "10s"
  }
  enable_message_ordering    = false
}



resource "google_project_iam_member" "service_account_role" {
  project  = var.project_id
  role     = "roles/pubsub.publisher"
  member   = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-monitoring-notification.iam.gserviceaccount.com"
}




# resource "google_pubsub_subscription_iam_member" "pull_subscription_binding" {
#   project      = "terraformering"
#   subscription = google_pubsub_subscription.subscription.name
#   role = "roles/pubsub.publisher"
#    member = "serviceAccount:service-786735694665@gcp-sa-monitoring-notification.iam.gserviceaccount.com"
# }


# resource "google_pubsub_topic_iam_binding" "pubsub_topic_iam_authoritative" {
#   project       = "terraformering"
#   pubsub_topics = "cloualert-topic"
#   mode          = "authoritative"

#   bindings = {
#     "roles/pubsub.publisher" = [
#       "786735694665-compute@developer.gserviceaccount.com",
#       "group:my-group@my-org.com",
#       "user:my-user@my-org.com",
#     ]
#   }
# }
# resource "google_pubsub_topic_iam_binding" "binding" {
#   project = "terraformering"
#   topic = "cloualert-topic"
#   role = "roles/pubsub.publisher"
#   members =  "thejaswini.pacha@searce.com"
# }

# resource "google_pubsub_topic_iam_binding" "binding" {
#   depends_on = [ google_pubsub_topic.example ]
#   project = "terraformering"
#   topic = google_pubsub_topic.example.name
#   role = "roles/pubsub.publisher"
#   members = [
#     "serviceAccount:service-786735694665@gcp-sa-monitoring-notification.iam.gserviceaccount.com",
#   ]
#  }

