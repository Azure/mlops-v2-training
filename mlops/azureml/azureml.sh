# TRAIN

# Create train job compute cluster
az ml compute create -n cpu-cluster --type amlcompute --min-instances 0 --max-instances 4

# Create data asset
az ml data create --file data/data.yml

# Create train environment
az ml environment create --file environment/train-env.yml

# Create standalone job
az ml job create --file train/train.yml

# Create pipeline job
az ml job create --file train/pipeline.yml

# Create pipeline rai job
az ml job create --file train/pipeline-rai.yml

# DEPLOY

# Deploy Online Endpoint

# create online endpoint
az ml online-endpoint create --file deploy/online/online-endpoint.yml
# create online deployment
az ml online-deployment create --file deploy/online/online-deployment.yml
# allocate traffic
az ml online-endpoint update --name taxi-online-endpoint --traffic blue=100
# invoke and test endpoint
az ml online-endpoint invoke --name taxi-online-endpoint --request-file ../../data/taxi-request.json

# Deploy Batch Endpoint

# create compute cluster to be used by batch cluster
az ml compute create -n batch-cluster --type amlcompute --min-instances 0 --max-instances 3
# create batch endpoint
az ml batch-endpoint create --file deploy/batch/batch-endpoint.yml
# create batch deployment
az ml batch-deployment create --file deploy/batch/batch-deployment.yml --set-default
# invoke and test endpoint
az ml batch-endpoint invoke --name taxi-batch-endpoint --input ../../data/taxi-batch.csv