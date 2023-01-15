# DEPLOY

# Deploy Online Endpoint
az configure --defaults group=mldemorg workspace=mldemo location=eastus
# create online endpoint
az ml online-endpoint create --file deploy/online/online-endpoint.yml
# create online deployment
az ml online-deployment create --file deploy/online/online-deployment.yml 
# allocate traffic
az ml online-endpoint update --name taxi-online-endpoint --traffic blue=100
# invoke and test endpoint
#az ml online-endpoint invoke --name taxi-online-endpoint --request-file ../../data/taxi-request.json
