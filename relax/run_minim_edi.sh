#!/bin/bash 

#SBATCH -J minim_rosetta
#SBATCH -n 1
#SBATCH -p cpu
#SBATCH --mem=16GB      # 8 GB of RAM



/opt/apps/rosetta-3.12/main/source/bin/relax.default.linuxgccrelease -relax:constrain_relax_to_start_coords -relax:coord_constrain_sidechains -relax:ramp_constraints false -s *.pdb @flags_minim -out:file:o minimzed.pdb

mv *0001.pdb minimized.pdb
