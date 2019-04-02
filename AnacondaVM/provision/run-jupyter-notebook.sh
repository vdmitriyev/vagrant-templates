#!/bin/bash

# Starting jupyter Notebook
echo "Trying to start jupyter Notebook"

#source activate analysis

notebook="/vagrant/notebooks"
password="letmein"
#passwordSHA1="sha1:1f3530c1456f:c1471dc2e37c94d4c255de795e3f18798123976d"
port=8888

mkdir $notebook

if [ -d "$notebook" ]; then
	jupyter notebook --ip='0.0.0.0' --port="$port" --notebook-dir="$notebook" --NotebookApp.token="$password" --no-browser &
	echo "Jupyter Notebook must be running on port $port"
else
	echo "ERROR: Jupyter Notebook was not started."
	echo "INFO: Try to create folder $notebook"
fi