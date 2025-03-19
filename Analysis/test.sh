###!/bin/sh
### General options
### -- specify queue --
###BSUB -q man
### -- set the job Name --
#BSUB -J XX_name_sc
### -- ask for number of cores (default: 1) -- can go until 32
#BSUB -n 8
### -- specify that we need a certain architecture --
###BSUB -R "select[model == XeonGold6226R]"
### -- specify that the cores must be on the same host --
#BSUB -R "span[hosts=1]"
### -- specify that we need X GB of memory per core/slot --
#BSUB -R "rusage[mem=10GB]"
### -- specify that we want the job to get killed if it exceeds X GB per core/slot --
#BSUB -M 10.1GB
### -- set walltime limit: hh:mm --
#BSUB -W 24:00
### -- set the email address --
#BSUB -u s233240@dtu.dk
### -- send notification at start --
###BSUB -B
### -- send notification at completion -- N is yes, B is no
###BSUB -N
### -- Specify the output and error file. %J is the job-id --
### -- -o and -e mean append, -oo and -eo mean overwrite --
#BSUB -o ./Logs/GSA_base_%J.out
#BSUB -e ./Logs/GSA_base_%J.err
# here follow the commands you want to execute with input.in as the input file

### Get paths to GAMS 47 ### adapt it to mine
export PATH=/appl/gams/47.6.0:$PATH
export LD_LIBRARY_PATH=/appl/gams/47.6.0:$LD_LIBRARY_PATH

# Running Balmorel 
module load python3/3.12.4
source gams/bin/activate
cd /work3/thbal/base_GREAT_biogas/Balmorel/base/model  ### adapt to mine
gams Balmorel license=/work3/thbal/gams/gamslice.txt   --scenario_name $name ### change path to license file