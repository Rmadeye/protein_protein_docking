#!/bin/bash -l
#SBATCH -J prepack
#SBATCH -n 24
#SBATCH --time=02:00:00
#SBATCH -A plgcx32-cpu
#SBATCH --mail-type=ALL
#SBATCH --mail-user=r.madaj@uw.edu.pl

module load rosetta/3.13-intel-2021a-mpi

filename=`basename ${PWD%/*}`;

mpirun -np 24 docking_prepack_protocol.mpi.linuxiccrelease  @flags_prepack -s ../relax/minimized*.pdb -out:suffix prepacked_

cp $(sort -t, -k2,1 *.sc | awk '{print $22}' | tail -n 3 |  head -n 1).pdb ../dock/"$filename".pdb
