#!/usr/bin/perl
use Net::Ifconfig::Wrapper;
use Data::Validate::IP;
use HTML::Template;
open FILE,">prueba.html" or die "Error";
print FILE &showForm();
close FILE;
sub showForm{
		my $output;
		my $template = HTML::Template->new(filename => './template.tmpl');
		my $info=&inet_info;
		my @loop_data=();
		while(@{$info->[0]}){
				my %row_data;
				$row_data{iface}=shift @{$info->[0]};
				$row_data{inet}=shift @{$info->[1]};
				$row_data{netmask}=shift @{$info->[2]};
				push(@loop_data,\%row_data);
	
		}
		$template->param(interfaces => \@loop_data);
		$output.=$template->output();
		#print $output;
		return $output;
}
sub inet_info{
	my $list=&listIface();
	my @ip_address;
	my @netmask;
	my @interface_name = keys %$list;
	foreach my $iface(keys %$list){
		my @tmp=keys %{$list->{$iface}->{inet}},"\n"||" ";
		push(@ip_address,shift @tmp);
		@tmp=values %{$list->{$iface}->{inet}},"\n"||" ";
		push(@netmask,shift @tmp);
	}
	#while(@interface_name){
	#        print "\n",shift @interface_name;
	#        print "\n",shift @ip_address;
	#        print "\n",shift @netmask;
	#}
	my @info=(\@interface_name,\@ip_address,\@netmask);
	return \@info;
}
sub listIface{
	my $interfaces=Net::Ifconfig::Wrapper::Ifconfig('list','','','');
	return $interfaces;
}
