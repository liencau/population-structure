#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;

my %hash_fam;
my ($fam,$matching_list,$Q) = @ARGV;
my $number;
open NEW,"$fam" or die;
while(<NEW>){
        chomp;
        $number++;
        my @array = split /\s+/;
        $hash_fam{$number} = $array[1];
}
close NEW;

my %hash_matching_list;
open NEW,"$matching_list" or die;
while(<NEW>){
        chomp;
        my @array = split /\s+/;
        $hash_matching_list{$array[0]} = $array[1];
}
close NEW;

my $number1;
open NEW,"$Q" or die;
while(<NEW>){
        chomp;
        $number1++;
        print "$hash_matching_list{$hash_fam{$number1}}\t$hash_fam{$number1}\t$_\n";
}
close NEW;


sub usage{
        my $die =<<DIE;
        usage : perl *.pl *.fam matching_list *.Q
DIE
}
