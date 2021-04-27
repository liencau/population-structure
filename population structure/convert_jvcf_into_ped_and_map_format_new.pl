#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;
my ($jvcf,$ped,$map) = @ARGV;

open NEW1,">$ped" or die;
open NEW2,">$map" or die;

my %hash_accessions;
my %hash_genotypes;

open NEW,"$jvcf" or die;
while(<NEW>){
	chomp;
	next if (/^#/);
	my @array = split /\s+/;
	if(/^CHROM/){
		for(my $number = 3;$number < @array;$number++){
			$hash_accessions{$number} = $array[$number];
		}
	}
	else{
		$array[0] =~ /chr(\d+)/;
		print NEW2 "$1\t$1_$array[1]\t$array[1]\n";
		for(my $number = 3;$number < @array;$number++){
			if($array[$number] eq "x" or $array[$number] eq "X"){
				push @{$hash_genotypes{$number}},"0 0";
			}
			else{
				push @{$hash_genotypes{$number}},"$array[$number] $array[$number]";
			}
		}
	}
}
close NEW;

my $family_cal;
foreach my $key(sort {$a <=> $b} keys %hash_accessions){
	$family_cal++;
	print NEW1 "FAM$family_cal\t$hash_accessions{$key}\t0\t0\t0\t0\t";
	foreach my $geno(@{$hash_genotypes{$key}}){
		print NEW1 "$geno\t";
	}
	print NEW1 "\n";
}

close NEW1;
close NEW2;

sub usage{
	my $die =<<DIE;
	usage : perl *.pl *.jvcf *.ped *.map
DIE
}
