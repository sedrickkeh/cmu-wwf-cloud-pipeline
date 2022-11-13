from google.cloud import compute_v1
import google.auth
from google.oauth2 import service_account
import urllib
import json

import argparse
if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--project_id', type=str, required=True)
    parser.add_argument('--zone', type=str, required=True)
    parser.add_argument('--instance_name', type=str, required=True)
    parser.add_argument('--credentials', type=str, required=True)
    args = parser.parse_args()

    credentials = service_account.Credentials.from_service_account_file(
        args.credentials,
        scopes=['https://www.googleapis.com/auth/cloud-platform'])

    request = google.auth.transport.requests.Request()
    credentials.refresh(request)

    req = urllib.request.Request(f'https://compute.googleapis.com/compute/v1/projects/{args.project_id}/zones/{args.zone}/instances/{args.instance_name}')
    req.add_header("Authorization", f"Bearer {credentials.token}")
    result = urllib.request.urlopen(req)
    d = json.loads(result.read().decode())
    print(d['networkInterfaces'][0]['accessConfigs'][0]['natIP'])