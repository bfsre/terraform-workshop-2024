#!/bin/sh

PROJECT_NAME=bf-beanfun-dev
COMPUTE_ZONE=asia-east1-a
SA_NAME=workshop-admin

gcloud config set project ${PROJECT_NAME}
gcloud config set compute/zone ${COMPUTE_ZONE}

gcloud iam service-accounts create ${SA_NAME} \
--description="Workshop terrafrom service principal" \
--display-name="Workshop terraform service account"

gcloud projects add-iam-policy-binding $PROJECT_NAME \
 --member "serviceAccount:${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com"  \
 --role "roles/editor" \
 --condition=None

gcloud projects add-iam-policy-binding $PROJECT_NAME \
 --member "serviceAccount:${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com"  \
 --role "roles/iam.serviceAccountCreator" \
 --condition=None

for i in $(cat member.txt)
do
    gcloud iam service-accounts add-iam-policy-binding ${SA_NAME}@${PROJECT_NAME}.iam.gserviceaccount.com \
     --member="user:${i}" \
     --role="roles/iam.serviceAccountTokenCreator"
 done