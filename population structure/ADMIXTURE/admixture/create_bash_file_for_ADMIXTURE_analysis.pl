#!/usr/bin/perl
use strict;
use warnings;

for(my $number = 2;$number <= 20;$number++){
	open NEW,">./run_ADMIXTURE_K$number.sh" or die;
	print NEW "#!/bin/bash\n#\$ -cwd\n#\$ -j y\n#\$ -S /bin/bash\n#\n\n";

	print NEW "/NAS7/home/shijunpeng/software/admixture_linux-1.3.0/admixture --cv=10 /NAS6/shijunpeng/data/GWAS/SNP_calling/GATK/SNPs/raw_SNPs/population_structure/ADMIXTURE/10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.prunedData.bed $number -j2 | tee K$number.output \n";

	close NEW;
}
