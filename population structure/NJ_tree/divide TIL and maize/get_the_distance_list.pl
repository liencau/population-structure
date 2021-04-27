#!/usr/bin/env perl
use strict;
use warnings;

die usage() if @ARGV == 0;
my ($id,$mdist,$output) = @ARGV;

my %hash_id;
my $cal1 = 0;
open NEW,"$id" or die;
while(<NEW>){
        chomp;
        my @array = split /\s+/;
        $hash_id{$cal1} = $array[0];
        $cal1++;
}
close NEW;

my $cal2 = 0;
open NEW,"$mdist" or die;
open NEW1,">$output" or die;
while(<NEW>){
        chomp;
        my @array = split /\s+/;
        for(my $aa = 0;$aa < @array;$aa++){
                print NEW1 "$hash_id{$cal2}\t$hash_id{$aa}\t$array[$aa]\n";
        }
        $cal2++;
}
close NEW1;
close NEW;



sub usage{
        my $die =<<DIE;
        usage : perl *.pl gatk_106.mdist.id gatk_106.mdist output
DIE
}
