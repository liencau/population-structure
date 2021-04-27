#!/bin/bash
#$ -j y
#$ -cwd
#$ -S /bin/bash
#
perl get_draw_PCA_data_structure.pl >PCA_data_structure
