#!/usr/bin/bash

help() {
    echo "Usage: $1 <directory name>"
    }

if [[ $# < 1 ]]; then
    help
    exit 1
fi

mkdir $1

cd $1

cp -r /home/nfs/rmadaj/coding_corner/protein_protein_docking/relax /home/nfs/rmadaj/coding_corner/protein_protein_docking/prepack /home/nfs/rmadaj/coding_corner/protein_protein_docking/dock ./

cd ..

echo "FINISHED"