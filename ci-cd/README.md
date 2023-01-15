# Azure MLOps (v2) CI/CD Example

This is sample repo to create automated CI/CD process using Azure Pipelines or Github Actions.

## Creating CI/CD with Azure Pipelines

### Create CI using Azure Pipeline Build Pipeline
Following instructions to create CI pipeline for training:
<https://learn.microsoft.com/en-us/azure/machine-learning/how-to-devops-machine-learning>

### Create CD using Azure Pipeline Release Pipeline
1. Install Machine Learning for Azure Pipelines
![Install Machine Learning Extension for Azure Pipelines](./images/Install_ML_Extension.jpg)
2. Create a Release pipeline triggered by Azure Machine Learning Model Registry<br/>
    2.1 Add following to your release pipeline:<br />
    - Azure Machine Learning Registry <br/>
    - Inference Repo to Artifacts <br/>
    - Add stages <br/>
![Create Release Pipeline](./images/Create_Release_Pipeline.jpg)    
    2.2 Add Azure CLI task for preparing environment <br/>
![Install CLI](./images/install_ML_cli.jpg)  
    2.3 Add Azure CLI task for model deployment
    ![Deploy Pipeline](./images/deploy_pipeline.jpg)  
    2.4 Enable trigger - Continuous Deployment
    ![Configure Continuous Deployment](./images/continous_deployment.jpg)  
    2.5 Predeployment Approal<br />
    ![Predeployment Approval](./images/predeploy_approval.jpg)  



## Createing CD + CD with Github Actions

<https://learn.microsoft.com/en-us/azure/machine-learning/how-to-github-actions-machine-learning?tabs=userlevel>