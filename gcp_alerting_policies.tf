
################### MySql Cloudsql Alerting Policies ####################

#Cloudsql - Memory Utilization Alerting policy
resource "google_monitoring_alert_policy" "cloudsql_memory_utilization" {
  project      = var.project_id
  display_name = "Cloud SQL Database - Memory utilization"
  enabled      = true
  combiner     = "OR"
  conditions {
    display_name = "Memory utilization for cloud sql"
    condition_threshold {
      filter          = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/memory/utilization\""
      duration        = "0s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.9
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }
      trigger {
        count = 1
      }
    }
  }

 alert_strategy {
     auto_close = "604800s"
   }

   documentation {
     mime_type = "text/markdown"
     content   ="Cloud SQL Memory utilization threshold reached the threshold value, for the project ${var.project_id}, Please check."
   }
  # notification_channels = [google_monitoring_notification_channel.email_notification_channel.id, google_monitoring_notification_channel.slack_notification_channel.id]
  notification_channels = [google_monitoring_notification_channel.email_notification_channel.id]
}



#Cloudsql - Network Connection Utlization Alerting Policy
resource "google_monitoring_alert_policy" "cloudsql_network_connections_utilization" {
  project      = var.project_id
  display_name = "Cloud SQL Database - Cloud SQL Network Connections"
  enabled      = true
  combiner     = "OR"
  conditions {
    display_name = "Cloud SQL connections utilization"
    condition_threshold {
      filter          = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/network/connections\""
      duration        = "0s"
      comparison      = "COMPARISON_GT"
      threshold_value = 112
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }
      trigger {
        count = 1
      }
    }
  }

  alert_strategy {
     auto_close = "604800s"
   }

  documentation {
    mime_type = "text/markdown"
    content   = "Cloud SQL connections have crossed the threshold value ${var.project_id} has been generated, this alert for the 'cloudsql_database_network_connections'."
   }
   # notification_channels = [google_monitoring_notification_channel.email_notification_channel.id, google_monitoring_notification_channel.slack_notification_channel.id]
    notification_channels = [google_monitoring_notification_channel.email_notification_channel.id]
}



#Cloudsql - Disk Utilization Alerting Policy
resource "google_monitoring_alert_policy" "cloudsql_disk_utilization" {
  project      = var.project_id
  display_name = "Cloud SQL Database - Disk utilization"
  enabled      = true
  combiner     = "OR"
  conditions {
    display_name = "Disk utilization for cloud sql"
    condition_threshold {
      filter          = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/disk/utilization\""
      duration        = "0s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.9
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }
      trigger {
        count = 1
      }
    
    }
  }

  alert_strategy {
    auto_close = "604800s"
  }

  documentation {
    mime_type = "text/markdown"
    content   = "CPU utilization has crossed the threshold value ${var.project_id} has been generated, this alert for the 'cloudsql_database_disk_utilization'."
  }
  # notification_channels = [google_monitoring_notification_channel.email_notification_channel.id, google_monitoring_notification_channel.slack_notification_channel.id]
  notification_channels = [google_monitoring_notification_channel.email_notification_channel.id]
}



#Cloudsql -  Open Table Alerting policy
resource "google_monitoring_alert_policy" "cloudsql_open_tables" {
  project      = var.project_id
  display_name = "Cloud SQL Database - open tables"
  enabled      = true
  combiner     = "OR"
  conditions {
    display_name = "Cloud SQL Database MySQL open tables"
    condition_threshold {
      filter          = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/mysql/open_tables\""
      duration        = "0s"
      comparison      = "COMPARISON_GT"
      threshold_value = 4600
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }
      trigger {
        count = 1
      }
    }
  }

  alert_strategy {
    auto_close = "604800s"
  }

  documentation {
     mime_type = "text/markdown"
     content   = "Database mysql open tables ${var.project_id} has been generated, this alert for the 'cloudsql_mysql_open_tables'."
   }
  # notification_channels = [google_monitoring_notification_channel.email_notification_channel.id, google_monitoring_notification_channel.slack_notification_channel.id]
  notification_channels = [google_monitoring_notification_channel.email_notification_channel.id]
}


#Cloudsql Disk Read Alert policy (Read IOPS)
resource "google_monitoring_alert_policy" "disk_read_alert_policy" {
  project      = var.project_id
  display_name = "Cloud SQL Database - Disk read IO"
  enabled      = true
  combiner     = "OR"
  conditions {
    display_name = "Cloud SQL Database - Disk read IO -us-gen2"
    condition_threshold {
      filter          = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/disk/read_ops_count\""
      duration        = "0s"
      comparison      = "COMPARISON_GT"
      threshold_value = 21680
      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }
      trigger {
        count = 1
      }
    }
  }

  alert_strategy {
    auto_close = "604800s"
  }

  documentation {
      mime_type = "text/markdown"
      content   = "Cloud SQL connections read ops count ${var.project_id} has been generated, this alert for the 'cloudsql_database_read_ops_count'."
  }
  # notification_channels = [google_monitoring_notification_channel.email_notification_channel.id, google_monitoring_notification_channel.slack_notification_channel.id]
  notification_channels = [google_monitoring_notification_channel.email_notification_channel.id]
}



#Cloud SQL - Query Execution time Alert Policy
 resource "google_monitoring_alert_policy" "query_execution_time_alert_policy" {
   project      = var.project_id
   display_name = "Cloud SQL Instance Database - Query Execution time"
   enabled      = true
   combiner     = "OR"
   conditions {
     display_name = "Cloud SQL Instance Database - Execution time"
     condition_threshold {
       filter     = "resource.type = \"cloudsql_instance_database\" AND metric.type = \"dbinsights.googleapis.com/aggregate/execution_time\""
       duration   = "0s"
       comparison = "COMPARISON_GT"
       threshold_value = 90000000
       aggregations {
         alignment_period   = "300s"
         per_series_aligner = "ALIGN_RATE"
       }
       trigger {
         count = 1
       }
     }
   }

  alert_strategy {
         auto_close = "604800s"
       }

  documentation {
     mime_type = "text/markdown"
     content   = "Cloud SQL exceeds the execution time ${var.project_id} has been generated, this alert for the 'cloudsql_database_execution_time'."
   }
   notification_channels = [google_monitoring_notification_channel.email_notification_channel.id]
}



#Cloud SQL - Instace State Alert Policy
resource "google_monitoring_alert_policy" "cloud_sql_instace_state_alert_policy" {
   project      = var.project_id
   display_name = "Cloud SQL Database - Instance state"
   enabled      = true
   combiner     = "OR"
   conditions {
     display_name = "Cloud SQL Database - Instance state - only - running"
     condition_threshold {
       filter     = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/instance_state\" AND metric.labels.state != \"RUNNING\""
       duration   = "0s"
       comparison = "COMPARISON_GT"
       threshold_value = 1
       aggregations {
         alignment_period   = "300s"
         per_series_aligner = "ALIGN_COUNT_TRUE"
       }
       trigger {
         count = 1
       }
     }
   }

  alert_strategy {
         auto_close = "604800s"
       }

  documentation {
     mime_type = "text/markdown"
     content   = "Cloud SQL Instance state ${var.project_id} has been generated, this alert for the 'cloudsql_database_instance_state'."
   }
   notification_channels = [google_monitoring_notification_channel.email_notification_channel.id]
}


############################## PostgreSQL - Cloud SQL Alerting Policy #####################################

