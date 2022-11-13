# Server-specific variabeles (probably do not need to change these)
PROJECT_ID="my-project-1519055975402"
ZONE="us-central1-a"
INSTANCE_NAME="instance-2"

# User-specific variables (probably need to change these)
GOOGLE_APPLICATION_CREDENTIALS="my-service-account-2.json"
USERNAME="sedrickkeh"


echo "======"
echo "Starting server"
python server_start.py --project_id=${PROJECT_ID} --zone=${ZONE} --instance_name=${INSTANCE_NAME} --credentials=${GOOGLE_APPLICATION_CREDENTIALS}

echo "======"
echo "Getting server address"
SERVER=$(python server_get_address.py --project_id=${PROJECT_ID} --zone=${ZONE} --instance_name=${INSTANCE_NAME} --credentials=${GOOGLE_APPLICATION_CREDENTIALS})
echo "Server address is ${SERVER}"

echo "======"
echo "Running weekly pipelines on server"
ssh ${USERNAME}@${SERVER} 'cd wwf; conda activate env; bash pipeline.sh'
ssh ${USERNAME}@${SERVER} 'cd wwf; conda activate env; bash pipeline_world.sh'

echo "======"
echo "Stopping server"
python server_stop.py --project_id=${PROJECT_ID} --zone=${ZONE} --instance_name=${INSTANCE_NAME} --credentials=${GOOGLE_APPLICATION_CREDENTIALS}

echo "====="
echo "Pipeline complete!"