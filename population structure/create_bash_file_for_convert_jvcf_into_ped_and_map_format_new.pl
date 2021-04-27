#!/usr/bin/perl
use strict;
use warnings;

for(my $number = 1;$number <= 10;$number++){
	open NEW,">./run_convert_jvcf_into_ped_and_map_format_new_chr$number.sh" or die;
	print NEW "#!/bin/bash\n#\$ -cwd\n#\$ -j y\n#\$ -S /bin/bash\n#\n\n";
	print NEW "perl ./convert_jvcf_into_ped_and_map_format_new.pl /NAS6/shijunpeng/data/GWAS/SNP_calling/GATK/SNPs/raw_SNPs/chr$number.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.jvcf ./chr$number.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped ./chr$number.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.map";
	close NEW;
}
