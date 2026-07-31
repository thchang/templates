#!/bin/bash
#SBATCH --job-name=torchtitan_sft_run
##SBATCH --nodes=N_NODES
#SBATCH --nodelist=NODE_1,NODE_2,NODE_3
#SBATCH --ntasks=1
#SBATCH --gpus-per-task=N_GPUS
#SBATCH --cpus-per-task=N_CPUS
#SBATCH --partition=PARTITION_NAME
#SBATCH --output=/PATH/TO/WORKDIR/%x_%j.log

# Conda environment details
export CONDA_EXE=micromamba
export CONDA_ENV=torchtitan

# Set the workdir
export WORKDIR="/PATH/TO/WORKDIR"

# Set the path to the torchtitan install
export TORCHTITAN="/PATH/TO/GIT/TORCHTITAN"
# torchtitan config file module path (separated by dots, .py omitted)
export TORCHTITAN_CONFIG_MODULE="torchtitan.models.llama3.sft_configs"
# torchtitan config name in the above module file
export TORCHTITAN_CONFIG="llama3_8b_sft"
# torchtitan output path
export TORCHTITAN_DUMP_FOLDER="/any/path/to/output/folder"

# Training / hardware details
export NUM_GPUS=8
export NUM_TRAINING_STEPS=20

# torchtitan logging and errors
export LOGLEVEL=INFO
export NCCL_DEBUG=WARN
export PYTHONFAULTHANDLER=1

# Go to workdir
cd "$WORKDIR"

# Activate torchtitan environment
$CONDA_EXE activate $CONDA_ENV

# Add the current WORKDIR to the PYTHONPATH for convenience
export PYTHONPATH="$WORKDIR:$PYTHONPATH"

# Run the training job
NGPU=$NUM_GPUS MODULE=$TORCHTITAN_CONFIG_MODULE CONFIG=$TORCHTITAN_CONFIG \
    srun $TORCHTITAN/run_train.sh --training.steps $NUM_TRAINING_STEPS \
    --dump_folder=$TORCHTITAN_DUMP_FOLDER
