#!/usr/bin/perl
use strict;
use warnings;

print "Q\tNumber_of_assigned\n";
for(my $number = 2;$number <= 15;$number++){
	my $cal;
	open NEW,"./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.prunedData.$number.Q" or die;
	while(<NEW>){
		chomp;
		my @array = split /\s+/;
		for(my $a = 0;$a < @array;$a++){
			##########  the lines assigned umambigously
			if($array[$a] >= 0.8){
				$cal++;
			}
		}
	}
	close NEW;
	print "$number\t$cal\n";
}
