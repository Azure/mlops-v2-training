# Azure MLOps (v2) Training

This training demo is inspired by the [MLOps v2 solution accelerator](https://github.com/Azure/mlops-v2). For this demo, we will be using the classical use case (Tabular data), Azure Machine Learning CLI v2 or SDK v2 for model training and deployment, and Azure Devops for CI/CD, and terraform as an infrastructure as code tool. 

## Repo structure 

```bash
├── data
│   ├── taxi-data.csv - data used for training & testing ML model
│   ├── taxi-batch.csv - data used as input for testing batch endpoint
│   ├── taxi-request.json - data used as input for testing online endpoint
├── data_science
│   ├── experiment - experimentation notebooks to get started with ML workload
│   ├── src - python scripts of ML workload
│   │   ├── prep
│   │   |   ├── prep.py - python script that reads raw data and prepare train, val and test datasets
│   │   |   ├── test_prep.py - python script used when unit testing `prep.py` 
│   │   ├── train
│   │   |   ├── train.py - python script that reads train data, trains and saves an ML model
│   │   |   ├── test_train.py - python script used when unit testing `train.py` 
│   │   ├── evaluate
│   │   |   ├── evaluate.py - python script that reads test data and trained model and evaluates model performance
│   │   |   ├── test_evaluate.py - python script used when unit testing `evaluate.py` 
│   │   ├── register
│   │   |   ├── register.py - python script that register trained model in AzureML Model Registry
│   │   |   ├── test_register.py - python script used when unit testing `register.py` 
│   ├── environment - environments needed execute ML workload
│   │   ├── train-conda.yml - environment conda specification needed to execute python scripts in ML workload
│   ├── components - AzureML Components definitions
│   │   ├── prep.yml - AzureML Component definition for `prep.py` 
│   │   ├── train.yml - AzureML Component definition for `train.py` 
│   │   ├── evaluate.yml - AzureML Component definition for `evaluate.py` 
│   │   ├── register.yml - AzureML Component definition for `register.py` 
├── mlops
│   ├── azureml - yaml configurations of AzureML assets & workflows
│   │   ├── train - yaml configurations of AzureML training assets & workflows
│   │   |   ├── compute.yml - yaml configuration of AzureML training compute cluster
│   │   |   ├── data.yml - yaml configuration of AzureML training (input) data asset
│   │   |   ├── environment.yml - AzureML yaml configuration of training environment
│   │   |   ├── pipeline.yml - AzureML yaml configuration of training pipeline
│   │   ├── deploy - AzureML yaml configurations of AzureML endpoints & deployments
│   │   |   ├── online - AzureML yaml configurations of AzureML online endpoint
│   │   |   |   ├── online-endpoint.yml - AzureML yaml configuration of AzureML online endpoint
│   │   |   |   ├── online-deployment.yml - AzureML yaml configuration of AzureML online deployment
│   │   |   ├── batch - AzureML yaml configurations of AzureML batch endpoint
│   │   |   |   ├── batch-endpoint.yml - AzureML yaml configuration of AzureML batch endpoint
│   │   |   |   ├── batch-deployment.yml - AzureML yaml configuration of AzureML batch deployment
│   │   ├── azureml-cliv2 - A notebook to execute training & deployment workflows with cliv2
│   │   ├── azureml-sdkv2 - A notebook to execute training & deployment workflows with sdkv2
│   ├── devops-pipelines - yaml configurations of AzureDevops Pipelines
│   │   ├── depoly-model-training-pipeline - yaml configuration of AzureDevops pipeline that performs the training workflow
│   │   ├── depoly-online-training-pipeline - yaml configuration of AzureDevops pipeline that performs the online endpoint deployment
│   │   ├── depoly-batch-training-pipeline - yaml configuration of AzureDevops pipeline that performs the batch endpoint deployment
├── infrastructure - modules needed for infrastructure setup
│   ├── pipelines 
│   │   ├── tf-ado-deploy-infra.yml - yaml configuration of Azure Devops pipeline that setups the infrastructure (terraform)
```

## Getting Started with MLOps (v2) training

In order to execute the training, you can follow the following guide:

1- Understand the data science use case: Go to `data-science/experiment/`, execute and understand the ML workflow done in the notebooks: `prep.ipynb`, `train.ipynb` and `evaluate.ipynb`. 

In order to properly execute these notebooks, you'll need to install the `requirements.txt` on your python virtual environment, or build a virtual environment from the conda specification defined in `data-sciece/environment/train-conda.yml`.

2- Notebooks can't be used in production. Notebooks are usually refactored into python scripts: Go to `data-science/src/` and check out the corresponding python scripts of the same ML workflow: `prep.py`, `train.py`, `evaluate.py` and `register.py`.

Pay attention to the input and output arguments of these scripts and how are they used. When it comes to arguments, think about variables that need to change from one execution to another.

3- It's time to use AzureML platform capabilities for ML training and deployment: Go to `mlops/azureml` and execute the notebooks `azure-sdkv2.ipynb` or `azureml-cliv2.ipynb` depending on your `sdk`/`cli` preference. 

4- The objective of the CI/CD pipelines available in `mlops/azure-devops` is to automate the model training and deployment delivery process (executed in notebook `azureml-cliv2.ipynb`) using CI/CD Azure Devops pipelines.










