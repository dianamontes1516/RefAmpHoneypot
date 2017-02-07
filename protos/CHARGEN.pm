#!/usr/bin/perl

package CHARGEN;
	our $PORT		=	19;
#------------------------------------------------------------------------------------------
	our @DELAY		=	[1,2,3,4,5,6,7,8,9,10];
#------------------------------------------------------------------------------------------
	our $REQUEST	=	"";	
#------------------------------------------------------------------------------------------
	my $CR=chr 0x0d;
	my $LF=chr 0x0a;
	our $RESPONSE	=substr '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefgh'.$LF.$CR.'!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefgh'.$LF.$CR.'!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefgh'.$LF.$CR.'!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefgh'.$LF.$CR.'!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefgh'.$LF.$CR.'!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefgh'.$LF.$CR.'!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcd',0,int(rand(513)) ;
1
