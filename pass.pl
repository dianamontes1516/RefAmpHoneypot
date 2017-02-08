#/usr/bin/perl
use strict;
use warnings;


my %hash2;
my $filename="datos.txt";

open FILE,"<", $filename;
my @file=(<FILE>);
for (@file){
	my %hash;
	if(m{(.*):(.*):(.*):(.*):(.*):(.*):(.*)}){
		$hash{"user"}=$1;
		$hash{"pass"}=$2;
		$hash{"uid"}=$3;
		$hash{"gid"}=$4;
		$hash{"desc"}=$5;
		$hash{"home"}=$6;
		my @temp=split /\//,$7;		
		#my @temp=split {"/"},$7;		
		@hash{"shell"}= \@temp;
	}
	my $temp=$hash{"user"};
	$hash2{$temp}=\%hash;
}
for my $var(sort keys %hash2){
	print "\nLlave : \n", $var, "Valores : \n";
	for (sort keys %{$hash2{$var}}){	
		print $_,":", $hash2{$var}{$_},"\n";
		if($_ eq "shell" ){
			for(@{$hash2{$var}{$_}}){
				print $_,"\n";
			}		
		}
	}	
}
close FILE;
