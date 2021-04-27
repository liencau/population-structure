#!/bin/bash
#$ -j y
#$ -cwd
#$ -S /bin/bash
#

perl ./convert_jvcf_into_ped_and_map_format.pl ./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped
