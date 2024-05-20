#This command is strictly for working on the HPCC CLuster
#This script is for aligning the Human and Dog Plasmid Sequences using MAFFT

#Copy lines Starting from #!/bin/bash --login to line 23 and paste it in your script file
#!/bin/bash --login
########### Define Resources Needed with SBATCH Lines ##########

#SBATCH --time=168:00:00             # limit of wall clock time - how long the job will run (same as -t)
#SBATCH --ntasks=10                  # number of tasks - how many tasks (nodes) that you require (same as -n)
#SBATCH --cpus-per-task=4           # number of CPUs (or cores) per task (same as -c)
#SBATCH --mem=16G                    # memory required per node - amount of memory (in bytes)
#SBATCH --job-name Human_and_Dog-Plasmid_Alignment_MAFFT      # you can give your job a name for easier identification (same as -J)

########## Command Lines to Run ##########


module purge # Purging all the modules that are currently activated
module load GCC/10.2.0  OpenMPI/4.0.5 # Loading the required modules before loading the software
module load MAFFT/7.475-with-extensions # Loading the Software

cd /mnt/home/white174/MAFFT_Alignment_Plasmid_Sequences/  ### change to the directory where your data is located 

mafft Human_and_Dog_Plasmid_Sequences.fasta > Human_and_Dog_Plasmid_Sequences_Alignment.fasta

scontrol show job $SLURM_JOB_ID     ### write job information to output file