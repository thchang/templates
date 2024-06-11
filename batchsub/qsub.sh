#!/bin/bash

## Template script for SGE job submission -- update as needed

## Sets the job queue and project code, if relevant
#$ -q reddev.q
##$ -P my_project

## Sets the job name
#$ -N test_1

## Uncomment one of the following to set the working directory
#$ -cwd
##$ -pwd `pwd`

## Passes all environment variables to the job
#$ -V

## Uncomment below to set a hard runtime limit
##$ -l h_rt=<hh:mm:ss>

## Uncomment to set email address and receive email updates on job status
##$ -M firstname.lastname@siemens.com
##$ -m ea

## Uncomment one of the following to set parallelism mode
##$ -pe smp 6   ## Uncomment for OpenMP with 6 slots 
##$ -pe orte 6  ## Uncomment for OpenMPI with 6 slots

## Uncomment to request memory resources (per slot) in MB
##$ -l h_vmem=3500   ## This will request 3.5 GB per slot (so 7 GB for 2 slots)


## Startup info
echo ""
now="$(date +"%T")"
echo "Starting job at $now"
echo "All future output is from the user script..."
echo ""


## User commands go here
echo $USER


## Exit info
echo ""
now="$(date +"%T")"
echo "Finished job at $now"
echo ""
