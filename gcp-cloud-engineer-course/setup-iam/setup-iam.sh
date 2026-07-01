#Para crear un Service account
PROJECT_ID='astral-archive-501113-v0'
SERVICE_ACCOUNT='dev-deployer'
SERVICE_ACCOUNT_VISIBLE_NAME='Deployer SA'



gcloud iam service-accounts create ${SERVICE_ACCOUNT} --display-name "${SERVICE_ACCOUNT_VISIBLE_NAME}"


# Para asignar roles al Service account

# 1 solo rol
ROLES='roles/compute.viewer'
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com" --role="$ROLES"

# + de 1 rol

$ROLES = @(
  'roles/compute.viewer'
  'roles/storage.objectViewer'
)

foreach ($ROLE in $ROLES) {
  gcloud projects add-iam-policy-binding $PROJECT_ID `
    --member="serviceAccount:$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com" `
    --role="$ROLE"
}





$SERVICE_ACCOUNT='dev-deployer'
$PROJECT_ID='astral-archive-501113-v0'
$ROLES='projects/astral-archive-501113-v0/roles/VMIniciarDetener'
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com" --role="$ROLES"

