# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
"""
Registers trained ML model if deploy flag is True.
"""

import argparse
from pathlib import Path
import pickle
import mlflow

import os 
import json

def parse_args():
    '''Parse input arguments'''

    parser = argparse.ArgumentParser()
    parser.add_argument('--model_name', type=str, help='Name under which model will be registered')
    parser.add_argument('--model_path', type=str, help='Model directory')
    parser.add_argument(
        "--model_info_output_path", type=str, help="Path to write model info JSON"
    )
    args, _ = parser.parse_known_args()
    print(f'Arguments: {args}')

    return args


def main(args):
    '''Loads model, registers it if deply flag is True'''

    print("Registering ", args.model_name)
    
    # Get Run ID from model path
    print("Getting model path")
    mlmodel_path = os.path.join(args.model_path, "MLmodel")
    runid = ""
    with open(mlmodel_path, "r") as modelfile:
        for line in modelfile:
            if "run_id" in line:
                runid = line.split(":")[1].strip()

    # Construct Model URI from run ID extract previously
    model_uri = "runs:/{}/outputs/".format(runid)
    print("Model URI: " + model_uri)

    # Register the model with Model URI and Name of choice
    print(f"Registering model as {args.model_name}")
    mlflow_model = mlflow.register_model(model_uri, args.model_name)
    model_version = mlflow_model.version

    # write model info
    print("Writing JSON")
    dict = {"id": "{0}:{1}".format(args.model_name, model_version)}
    output_path = os.path.join(args.model_info_output_path, "model_info.json")
    with open(output_path, "w") as of:
        json.dump(dict, fp=of)


if __name__ == "__main__":

    mlflow.start_run()
    
    # ---------- Parse Arguments ----------- #
    # -------------------------------------- #

    args = parse_args()
    
    lines = [
        f"Model name: {args.model_name}",
        f"Model path: {args.model_path}",
    ]

    for line in lines:
        print(line)

    main(args)

    mlflow.end_run()
