#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;

my %hash_matching_list;
open NEW,"$ARGV[0]" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	$hash_matching_list{$array[1]} = $array[0];
}
close NEW;

open NEW,"$ARGV[1]" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	if($array[1] =~ /hp2/){
		print "$_\n";
	}
	else{
		$_ =~ s/$array[1]/$hash_matching_list{$array[1]}/;
		print "$_\n";
	}
}
close NEW;

sub usage{
	my $die =<<DIE;
	usage : perl *.pl matching_list *.eigenvec output
DIE
}
