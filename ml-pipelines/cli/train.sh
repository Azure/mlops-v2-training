# TRAIN

# Create train job compute cluster
#az ml compute create --file train/compute.yml
# Register data asset 
az ml data create --file train/data.yml
# Register train environment 
az ml environment create --file train/environment.yml
# Create pipeline job
az ml job create --file train/pipeline.yml
# Create pipeline job with automl training job
az ml job create --file train/pipeline_automl.yml
