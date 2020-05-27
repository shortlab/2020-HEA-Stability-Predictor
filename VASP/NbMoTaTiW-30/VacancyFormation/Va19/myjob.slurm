#!/bin/bash
#SBATCH -N 1                 # Number of nodes
#SBATCH -n 32                # 32 tasks per node
#SBATCH --ntasks-per-node 32 # up to 32 CPUs on each node
#SBATCH -c 1                 # cpus per task
#SBATCH --time=4:00:00       # Run time hours:minutes:seconds
#SBATCH -p sched_mit_nse     # Name of queue - Sam use NSE
#SBATCH -o STDOUT            # Scheduler output file
#SBATCH -e STDERR            # Scheduler error report

# Load the necessary modules for VASP
module purge
module add intel-cluster-runtime/intel64/3.7
module add mpich/ge/gcc/64/3.1

# Run VASP
vasp_exe=/home/software/vasp/5.4.4/build/std/vasp
mpirun $vasp_exe
echo 'VASP is done!'
