#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;

my $total;
open NEW,"$ARGV[0]" or die;
while(<NEW>){
	chomp;
	$total += $_;
}
close NEW;

open NEW,"$ARGV[0]" or die;
while(<NEW>){
	chomp;
	my $divide = $_/$total;
	print "$_\t$divide\n";
}
close NEW;

sub usage{
	my $die =<<DIE;
	usage : perl *.pl eigenvalue output
DIE
}
