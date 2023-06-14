variable "project_id" {
  type        = string
  description = "Project ID for monitoring space"

  # validation {
  #   condition     = var.shared_monitoring_project_id == ""
  #   error_message = "The variable shared_monitoring_project_id can not be empty, Please enter a project ID to proceed."
  # }
}

variable "notification_channel_display_name" {
  type        = string
  description = "Notification Channel Name"
  default     = "email-notification-channel"

}

# variable "slack_channel_name" {
#   type        = string
#   description = "Notification Channel Name"
#   default     = "slack-notification-channel"

# }

variable "gcs_bucket_size_alert_threshold" {
  type        = number
  description = "GCS bucket size alerting threshold in bytes"
  default     = 10737418240 #10GB in bytes
}

variable "notification_channel_members" {
  type        = string
  description = "GCS bucket size alerting threshold in bytes"
  default     = ""

  # validation {
  #   condition     = var.notification_channel_members == []
  #   error_message = "notification_channel_members can not be empty, Please enter at least one email id under tfvars to receive alerts"
  # }
}

# Alerting variables

variable "duration" {
  type        = string
  description = "Enter the duration time in seconds."
  default     = "300s"
}

variable "alignment_period" {
  type        = string
  description = "Enter the alignment_period time in seconds."
  default     = "300s"
}
variable "webhookurl" {
  type = string
}