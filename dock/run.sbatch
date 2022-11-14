#!/bin/bash -l
#SBATCH -J dock
#SBATCH -n 36
#SBATCH --time=24:00:00
#SBATCH -A plgcx32-cpu
#SBATCH --mail-type=ALL
#SBATCH --mail-user=r.madaj@uw.edu.pl

module load rosetta/3.13-intel-2021a-mpi

filename=`basename ${PWD%/*}`;

mpirun -np 36 docking_protocol.mpi.linuxiccrelease @flag_dock -s "$filename".pdb -out:suffix  _docked

mkdir ../"$filename"_results

cp *sc ../"$filename"_results

sort -k2,2n -k6,6n *.sc | awk '{print $2,$6,$28}' | head -n 100 > top100

for file in $(cat top100 | awk '{print $3}'); do

cp "$file".pdb ../"$filename"_results/
cp top100 ../"$filename"_results/