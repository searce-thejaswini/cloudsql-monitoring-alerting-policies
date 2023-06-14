import base64
import json
import requests

def process_pubsub(event, context):
    # Decode the Pub/Sub message payload
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    message_data = json.loads(pubsub_message)

    # Extract relevant information from the message_data dictionary
    incident = message_data.get('incident', {})
    condition = incident.get('condition', {})
    resource = incident.get('resource', {})
    condition_name = incident.get('condition_name', 'N/A')
    observed_value = incident.get('observed_value', 'N/A')
    threshold_value = incident.get('threshold_value', 'N/A')
    resource_type = incident.get('resource_type_display_name', 'N/A')
    url = incident.get('url', 'N/A')
    project_id = incident.get('scoping_project_id', 'N/A')
    
    #getting pod name and values

    resource_labels = resource.get('labels', {})
    cluster_name = resource_labels.get('cluster_name', 'N/A')
    namespace_name = resource_labels.get('namespace_name', 'N/A')
    pod_name = resource_labels.get('pod_name', 'N/A')


    # Construct the notification message
    notification_message = f"--------------------------------------------------------------------------------------------------------------------------------\n\n" \
                           f"*Alert*: {condition_name}\n\n" \
                           f"*Project-id*: {project_id}\n\n" \
                           f"*Resource*: {pod_name}\n\n" \
                           f"*Resource Type*: {resource_type}\n\n" \
                           f"*Observed Value*: {observed_value}\n\n" \
                           f"*Threshold Value*: {threshold_value}\n\n" \
                           f"*Description*: {pod_name} ({resource_type}) cluster-name:- {cluster_name} in the {project_id} project has {condition_name} {observed_value} in the last 5 mins which is above the set threshold value of {threshold_value}\n\n" \
                           f"*URL*: {url}\n\n" \
                           f"To access the logs, please click the above link and then click *View Logs* \n\n" \
                           f"--------------------------------------------------------------------------------------------------------------------------------" 

                        
                           

    # Send the notification to Teams
    webhook_url = 'https://hooks.slack.com/services/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'
    payload = {
        "text": notification_message,
        "mrkdwn": True
    }

    response = requests.post(webhook_url, json=payload)

    # Check the response status code
    if response.status_code == 200:
        print('Notification sent successfully')
    else:
        print('Failed to send notification')