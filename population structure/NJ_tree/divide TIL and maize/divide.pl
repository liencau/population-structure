#!/usr/bin/env perl
use strict;
use warnings;

open NEW,"./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list" or die;
open NEW1,">./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list.teosinte" or die;
open NEW2,">./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list.teosinte_maize" or die;
open NEW3,">./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list.maize" or die;

while(<NEW>){
	chomp;
	my @array = split /\s+/;
	if($array[0] eq $array[1]){
		next;
	}
	else{
		if($array[0] =~ /TIL/ and $array[1] =~ /TIL/){
			print NEW1 "$_\n";
		}
		elsif($array[0] =~ /TIL/ or $array[1] =~ /TIL/){
			print NEW2 "$_\n";
		}
		else{
			print NEW3 "$_\n";
		}
	}
}


close NEW;
close NEW1;
close NEW2;
close NEW3;
