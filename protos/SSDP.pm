#!/usr/bin/perl

package SSDP;
	our $PORT		=	1900;
#------------------------------------------------------------------------------------------
	our @DELAY		=	[1,2,3,4,5,6,7,8,9,10];
#------------------------------------------------------------------------------------------
	our $REQUEST	=	"M-SEARCH [\*] HTTP\/1\.1\r\nHOST\: [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:1900\r\nMAN\: \"[0-9A-Za-z\:\/\.]+\"\r\nMX\: [0-9]+\r\nST\: [0-9A-Za-z\:\/\.]+\r\nUSER-AGENT\: [0-9A-Za-z\:\/\. ]+\r\n\r\n";
#------------------------------------------------------------------------------------------
	our $SSDPp1	=	"HTTP/1.1 200 OK".$LF.$CR."CACHE-CONTROL: max-age=172800".$LF.$CR."DATE: ".$days[$wday]." ".$months[$mon]." ".$mday." ".$hour.":".$min.":".$sec." ".$year." GMT".$LF.$CR."EXT: ".$LF.$CR."LOCATION: http://";
	our $SSDPp2	=	"/udap/api/data?target=smartText.xml".$LF.$CR."SERVER: Linux/2.6.18-308.4.1.el5 UDAP/2.0 LGSmartTV_33/2.0".$LF.$CR."ST: urn:schemas-udap:service:smartText:1".$LF.$CR."USN: uuid:33068e81-3306-0633-619b-9b61818e0633::urn:schemas-udap:service:smartText:1".$LF.$CR.$LF.$CR;
1
