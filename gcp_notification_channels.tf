
resource "google_monitoring_notification_channel" "email_notification_channel" {
  project      = data.google_project.project.number
  display_name = var.notification_channel_display_name
  type         = "email"
  enabled      = true

  labels = {
    email_address = var.notification_channel_members
  }

  force_delete = false
}




# resource "google_monitoring_notification_channel" "slack_notification_channel" {
#   project = data.google_project.project.number
#   display_name = "Test-Slack-Channel"
#   type         = "slack"#var.notification_channel_type
#   enabled = true

#   labels = {
#     "channel_name" = var.slack_channel_name  
#   }
#   # sensitive_labels {
#   #   auth_token = "one"
#   # }

#   force_delete = false
# }




#Create notification channel for Pubsub
# resource "google_monitoring_notification_channel" "opspubsub" {
#   provider     = google-beta
#   display_name = "Ops-Pubsub-notification-channel"
#   project      = var.monitoring-project
#   type         = "pubsub"
#   labels = {
#     topic = "projects/${var.monitoring-project}/topics/${google_pubsub_topic.topicalerts.name}"
#   }
# }