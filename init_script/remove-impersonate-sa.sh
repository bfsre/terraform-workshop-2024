PROJECT_NAME=bf-beanfun-dev
COMPUTE_ZONE=asia-east1-a
SA_NAME=workshop-admin

gcloud config set project ${PROJECT_NAME}
gcloud config set compute/zone ${COMPUTE_ZONE}

gcloud projects remove-iam-policy-binding $PROJECT_NAME \
 --member "serviceAccount:${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com" \
 --role "roles/storage.admin" \
 --condition=None

for i in $(cat member.txt)
do
    gcloud iam service-accounts remove-iam-policy-binding ${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com \
     --member="user:${i}" \
     --role="roles/iam.serviceAccountTokenCreator" \
     --condition=None
 done

 gcloud iam service-accounts delete ${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com