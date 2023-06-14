## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_alert_policy.utilization_alert_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_monitoring_dashboard.dashboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_dashboard) | resource |
| [google_monitoring_notification_channel.basic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |


## Inputs For Nofification Channel

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID for monitoring space | `string` | n/a | yes |
| <a name="input_notification_channel_display_name"></a> [notification\_channel\_display\_name](#input\_notification\_channel\_display\_name) | Notification channel name which will be created | `string` | n/a | yes |
| <a name="input_channel_type"></a> [channel\_type](#input\_channel\_type) | Channel type (Email) | `string` | n/a | yes |


## Inputs For Alerting Policy

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | The users who wants to get notified | `string` | n/a | yes |
| <a name="input_alert_policy_display_name"></a> [alert\_policy\_display\_name](#input\_alert\_policy\_display\_name) | Alert policy name | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable alert policy (true/false) | `bool` | n/a | yes |
| <a name="input_combiner"></a> [combiner](#input\_combiner) | combine the results of multiple conditions to determine if an incident should be opened. Possible values are AND, OR, and AND\_WITH\_MATCHING\_RESOURCE. | `string` | n/a | yes |
| <a name="input_comparison"></a> [comparison](#input\_comparison) | The comparison to apply between the time series (indicated by filter and aggregation) and the threshold (indicated by threshold\_value). | `string` | n/a | yes |
| <a name="input_duration"></a> [duration](#input\_duration) | The amount of time that a time series must fail to report new data to be considered failing. Currently, only values that are a multiple of a minute--e.g. 60s, 120s, or 300s --are supported. | `string` | n/a | yes |
| <a name="input_alignment_period"></a> [alignment\_period](#input\_alignment\_period) | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | n/a | yes |
| <a name="input_cpu_threshold_value"></a> [cpu\_threshold\_value](#input\_cpu\_threshold\_value) | CPU threshold value | `number` | n/a | yes |
| <a name="input_violation_count"></a> [violation\_count](#input\_violation\_count) | The absolute number of time series that must fail the predicate for the condition to be triggered. | `number` | n/a | yes |
| <a name="input_memory_threshold_value"></a> [memory\_threshold\_value](#input\_memory\_threshold\_value) | Memory threshold value | `number` | n/a | yes |
| <a name="input_disk_threshold_value"></a> [disk\_threshold\_value](#input\_disk\_threshold\_value) | Disk threshold value | `number` | n/a | yes |








## Outputs

No outputs.
