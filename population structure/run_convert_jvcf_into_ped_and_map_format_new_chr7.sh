#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#

perl ./convert_jvcf_into_ped_and_map_format_new.pl /NAS6/shijunpeng/data/GWAS/SNP_calling/GATK/SNPs/raw_SNPs/chr7.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.jvcf ./chr7.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped ./chr7.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map