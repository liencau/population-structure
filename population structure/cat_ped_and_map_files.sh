#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#

## cat the map files 

cat ./chr1.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr2.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr3.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr4.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr5.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr6.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr7.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr8.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr9.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map ./chr10.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map >./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map

## cat all the ped files

cut -f 7- ./chr2.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr1.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped - >./chr2.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr3.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr2.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr3.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr4.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr3.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr4.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr5.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr4.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr5.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr6.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr5.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr6.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr7.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr6.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr7.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr8.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr7.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr8.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr9.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr8.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr9.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cut -f 7- ./chr10.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste ./chr9.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste - >./chr10.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste
cp ./chr10.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped.paste ./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped
