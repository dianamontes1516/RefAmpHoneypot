#!/usr/bin/perl

use strict;
use warnings;
use lib './protos/';
use CHARGEN;
use DNS;
use NetBIOS;
use NTP;
use QOTD;
use SNMP;
use SSDP;
{package PORT;
	our $NTP			=	$NTP::PORT;
	our $CHARGEN	=	$CHARGEN::PORT;
	our $QOTD		=	$QOTD::PORT;
	our $DNS			=	$DNS::PORT;
	our $SSDP		=	$SSDP::PORT;
	our $SNMP		=	$SNMP::PORT;
	our $NetBIOS	=	$NetBIOS::PORT;
}
{package REQUEST;
	our $NTP			=	$NTP::REQUEST;
	our $CHARGEN	=	$CHARGEN::REQUEST;
	our $QOTD		=	$QOTD::REQUEST;
	our $DNS			=	$DNS::REQUEST;
	our $SSDP		=	$SSDP::REQUEST;
	our $SNMP		=	$SNMP::REQUEST;
	our $NetBIOS	=	$NetBIOS::REQUEST;
}
{package RESPONSE;
	our $NTPv4		=	$NTP::RESPONSEv4;
	our $NTPv2		=	$NTP::RESPONSEv2;
	our $CHARGEN	=	$CHARGEN::RESPONSE;
	our $QOTD		=	$QOTD::RESPONSE;
	our $DNS			=	$DNS::RESPONSE;
	our $SSDP1		=	$SSDP::SSDPp1;
	our $SSDP2		=	$SSDP::SSDPp2;
	our $SNMP		=	$SNMP::RESPONSE;
	our $NetBIOS	=	$NetBIOS::RESPONSE;
}
1
