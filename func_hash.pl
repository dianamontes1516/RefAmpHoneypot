my $cmd;
my %HoF = (                           # Compose a hash of functions
    salir   =>  sub { exit },
    suma    =>  \&suma,
    resta   =>  \&resta,
    multi   =>  \&multi,
    divi    =>  \&divi,
);
#while(1){
$cmd=$ARGV[0];
   if($HoF{lc $cmd}){
    $HoF{lc $cmd}->($ARGV[1],$ARGV[2]);
   }
   else {
    warn "Unknown command: `$cmd'; Try `help' next time\n";
   }
#}

sub suma{
   my $a=shift;
   my $b=shift;
   print $a+$b,"\n";
}
sub resta{
   my $a=shift;
   my $b=shift;
   print $a-$b,"\n";
}
sub multi{
   my $a=shift;
   my $b=shift;
   print $a*$b,"\n";
}
sub divi{
   my $a=shift;
   my $b=shift;
   print $a/$b,"\n";
}

