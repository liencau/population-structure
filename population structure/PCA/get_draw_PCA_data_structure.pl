#!/usr/bin/perl
use strict;

open FILE,"/NAS6/shijunpeng/data/GWAS/SNP_calling/GATK/SNPs/raw_SNPs/population_structure/ADMIXTURE/ADMIXTURE/10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.prunedData.12.Q.NJ_order.names.xls";
my %hash_line;


while(<FILE>){
	chomp;
	my @line=split;
	my $max=0;
	my %hash;
	for(my $n=2;$n<@line;$n++){
		if($line[$n]>$max){
			$max=$line[$n];
			$hash{$max}=$n-1;
		}
	}
	if($max>=0.8){
		$hash_line{$line[1]}=$hash{$max};
	
	}else{
		$hash_line{$line[1]}=20;
	}
}
close FILE;

open FILE,"/NAS6/shijunpeng/data/GWAS/SNP_calling/GATK/SNPs/raw_SNPs/population_structure/PCA/10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.eigenvec.names";
print "Line\tPC1\tPC2\tPC3\tGroup\n";

while(<FILE>){
	chomp;
	my @line=split;
	print "$line[1]\t$line[2]\t$line[3]\t$line[4]\t$hash_line{$line[1]}\n";
}
close FILE;
