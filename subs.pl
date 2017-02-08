#!/usr/bin/perl
use warnings;
use strict;

my $var1;
my $var2;

#chomp ($var1=<STDIN>);
#chomp ($var2=<STDIN>);

sub suma(){
	#@_;
	#####@_[0]; ESTO NO SE HACE
	#$_;
	my $v1=$_[0];
	my $v2=$_[1];

	my $va1=shift;
	my $va2=shift;
	print $v1+$v2;
	print $va1+$va2;
}
#&suma($var1,$var2);
my @arr2=(1..5);
my @arr1=('a'..'f');
sub arreglo{
	my @letras=@arr1;
	my @numeros=@arr2;
	print @letras,"\n";
	print @numeros,"\n";
}

&arreglo(@arr1,@arr2);











