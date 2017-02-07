#!/usr/bin/perl

package QOTD;
	our $PORT		=	17;
#------------------------------------------------------------------------------------------
	our @DELAY		=	[1,2,3,4,5,6,7,8,9,10];
#------------------------------------------------------------------------------------------
	our $REQUEST	=	"";
#------------------------------------------------------------------------------------------
	my @quotes=(
		'"I play when I want to play..."',
		'"Where\'s there\'s smoke, there\'s Snoop Dogg..."',
		'"There are three things in life thats certain: death, taxes, and no one can cover 85..."'
	);
	our $RESPONSE	=	$qoutes[int(rand($#quotes+1))];
1
