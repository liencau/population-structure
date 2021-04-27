#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;
my ($fam,$matching,$Q,$outtree,$NJ_order) = @ARGV;

my $b = 1000;
my %hash_family_matching;
open NEW,"$fam" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	$hash_family_matching{"shi$b"} = $array[1];
	$b++;
}
close NEW;

my %hash_matching_879accessions;
open NEW,"$matching" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	$hash_matching_879accessions{$array[0]} = $array[1];
}
close NEW;

my %hash_matching;
my $a = 1000;
open NEW,"$Q" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	$hash_matching{"shi$a"} = $_;
	$a++;
}
close NEW;

open NEW1,"$outtree" or die;
open NEW2,">$NJ_order" or die;

while(<NEW1>){
	chomp;
	while($_ =~ /(shi\d+)/g){
		my $accession = $1;
		print NEW2 "$accession\t$hash_matching_879accessions{$hash_family_matching{$accession}}\t$hash_matching{$accession}\n";
	}
}

close NEW1;
close NEW2;


sub usage{
	my $die =<<DIE;
	usage : perl *.pl *.fam 879accessions.matching *.Q outtree *.Q.NJ_order
DIE
}
