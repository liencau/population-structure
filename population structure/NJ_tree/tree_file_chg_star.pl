#!/usr/bin/perl -w
use strict;
die usage() unless @ARGV==3;
my ($ped,$name,$tree) = @ARGV;
open TREE,$tree or die "$!";
my @tree = <TREE>;
my $tem_tree = join('',@tree);

open NAME,$name or die "$!";
my %hash_name;
while(<NAME>){
    chomp;
    my ($alias,$name) = split;
#       $name = $name."*" if $fam eq "Public_US";
    $hash_name{$alias} = $name;
}
open PED,$ped or die "$!";
my $i = 1000;
while(<PED>){
    my ($fam,$alias) = split;
    my $print=$tem_tree =~ s/shi$i/$hash_name{$alias}/g;
    ++$i;
}

print "$tem_tree";

sub usage{
    my $die =<<DIE;
    perl *.pl <Ped file> <real name and alias> <Tree file>
DIE
}
