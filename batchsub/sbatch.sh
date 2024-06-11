#!/bin/bash

#SBATCH -J job_name                 # Set the job name
#SBATCH -p bdwall                   # Set the job queue
#SBATCH -A MY_PROJ_ID               # Set the project code

#SBATCH -N 1                        # Set the number of nodes
#SBATCH --ntasks-per-node=1         # Set the number of tasks per node
#SBATCH --cpus-per-task=36          # Set the number of cpus per task

#SBATCH -o tlib.%j.%N.out           # Set the std output file
#SBATCH -e tlib.%j.%N.error         # Set the error log file
#SBATCH -t 3-00:00:00               # Set the time dd-hh:mm:ss

#SBATCH --mail-type=ALL             # Receive email updates
#SBATCH --mail-user=user@anl.gov    # Email address

# Hello world from node
echo -e "Slurm job ID: $SLURM_JOBID"

## Set the workdir
#cd $PBS_O_WORKDIR
cd $SLURM_SUBMIT_DIR

# A little useful information for the log file...
echo -e "Master process running on: $HOSTNAME"
echo -e "Directory is:  $PWD"

# load modules
module load gcc/10.2.0-z53hda3
module load python/3.8.10-6kl7zkj
module load anaconda3/2020.07

# activate environment?
conda activate parmoo_v2

# Set any environment vars
export PYTHONPATH=$PYTHONPATH:$HOME/libensemble
export PATH=$PATH:`pwd`

## Uncomment below if a machinefile is needed by MPI
## Get resources and add to: node_list
#srun hostname | sort -u > node_list
## Add manager node to machinefile
#head -n 1 node_list > machinefile.$SLURM_JOBID
## Add worker node to machinefile
#cat node_list >> machinefile.$SLURM_JOBID

# Put in a timestamp
echo Starting executation at: `date`

# Define the run command
cmd="./run_timings.sh"

# Print directory info
echo Working directory: `pwd`
echo Threads: `nproc --all`

# Print commands
echo -e "The command is:\n\n $cmd \n\n"
echo -e "End PBS script information." 
echo -e "All further output is from the process being run and not the pbs script."

# Run commands
$cmd

# Print the date again -- when finished
echo Finished at: `date`
