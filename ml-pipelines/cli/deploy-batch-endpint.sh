# DEPLOY
# Deploy Batch Endpoint

# create compute cluster to be used by batch cluster
#az ml compute create -n batch-cluster --type amlcompute --min-instances 0 --max-instances 3
# create batch endpoint
az ml batch-endpoint create --file deploy/batch/batch-endpoint.yml
# create batch deployment
az ml batch-deployment create --file deploy/batch/batch-deployment.yml --set-default
# invoke and test endpoint
#az ml batch-endpoint invoke --name taxi-batch-endpoint --input ../../data/taxi-batch.csv