#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;
my ($map,$ped) = @ARGV;

## create ped and map files
open NEW1,">$map" or die;
system("touch $ped");

for(my $number = 1;$number <= 10;$number++){
	my %hash_accessions;
	my %hash_genotypes;
	open NEW,"/NAS6/shijunpeng/data/GWAS/SNP_calling/GATK/SNPs/raw_SNPs/chr$number.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.jvcf" or die;
	while(<NEW>){
		chomp;
		next if (/^#/);
		my @array = split /\s+/;
		if(/^CHROM/){
			for(my $aa = 3;$aa < @array;$aa++){
				$hash_accessions{$aa} = $array[$aa];
			}
		}
		else{
			print NEW1 "$array[0]\t$array[0]_$array[1]\t$array[1]\n";
			for(my $aa = 3;$aa < @array;$aa++){
				if($array[$aa] eq "x" or $array[$aa] eq "X"){
					push @{$hash_genotypes{$aa}}, "0 0";
				}
				else{
					push @{$hash_genotypes{$aa}}, "$array[$aa] $array[$aa]";
				}
			}
		}
	}
	close NEW;

	open TEMP,">chr$number.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped" or die;
	my $family_cal;
	foreach my $key(sort {$a <=> $b} keys %hash_accessions){
		$family_cal++;
		print TEMP "FAM$family_cal\t$hash_accessions{$key}\t0\t0\t0\t0\t";
		foreach my $geno(@{$hash_genotypes{$key}}){
			print TEMP "$geno\t";
		}
		print TEMP "\n";
	}
	close TEMP;

	if($number == 1){
		system("mv chr$number.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped $ped");
	}
	else{
		system("cut -f 7- chr$number.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.ped | paste $ped - >$ped");
	}
}



sub usage{
	my $die =<<DIE;
	usage : perl *.pl output.map output.ped
DIE
}
