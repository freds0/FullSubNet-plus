#!/bin/bash

# Check if exactly one argument (the input folder) is passed
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_folder>"
    exit 1
fi

# Store the argument (input folder path) in a variable
INPUT_FOLDER=$1
OUTPUT_FOLDER="enhanced_samples"

# Echoing the input folder to let the user know which folder is being used
echo "Using input folder: $INPUT_FOLDER"

# Execute the inference command with the provided input folder
python -m speech_enhance.tools.inference \
  -C config/inference.toml \
  -M checkpoints/best_model.tar \
  -I "${INPUT_FOLDER}" \
  -O "${OUTPUT_FOLDER}"

# Optionally, echo a message after successful execution
echo "Inference completed. Outputs are saved in '${OUTPUT_FOLDER}' directory."
