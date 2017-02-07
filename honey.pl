#!/usr/bin/perl -w
$|=1;								#Buffer en 1 para imprimir sin encolar
use strict;						#Pragma para buenas practicas de programacion
use warnings;
use lib '.';
use HoneyConf;
use Net::RawIP;				#Modulo para creacion de paquetes IP
use Net::PcapUtils;			#Modulo para captura de trafico
use NetPacket::Ethernet;	#Modulo para manejo de cabeceras Ethernet
use NetPacket::IP;			#Modulo para manejo de cabeceras IP
use NetPacket::UDP;			#Modulo para manejo de cabeceras ICMP
use Net::Address::IP::Local;#Modulo para obtener direccion IP
#my $src_ip = Net::Address::IP::Local->public; #Direccion IP del equipo local
my $src_ip = '192.168.178.159'; #Direccion IP del equipo local
my $dst_ip;
#Rutina que captura paquetes IP
Net::PcapUtils::loop(
	\&process_pkt,
   PROMISC => 1,			#Operar en modo promiscuo
   NUMPACKETS => -1,		#Paquetes a monitorear (-1 = loop forever)
   DEV => 'eth0'			#Interfaz de monitoreo
);
sub sendResponse{
        my ($data,$dst_ip,$dst_port,$src_port)=@_;						#Obtiene los datos a transmitir
        my $packet = new Net::RawIP ({		#Crea un nuevo objeto RawIP
                ip => {						#Cabecara IP
                        saddr => $src_ip,	#Direccion IP origen
                        daddr => $dst_ip,	#Direccion IP destino
                },
                udp => {
                        source	=> $src_port,
                        dest		=> $dst_port,
								len		=> length $data,
								#data		=> pack("H*",$data),
								data		=> $data,
                },
        });
        $packet->send();					#Enviar el paquete
}
sub process_pkt {
	my ($user_data,$hdr,$pkt)=@_;
	my $eth=NetPacket::Ethernet->decode($pkt);				#Decodificar la cabecera Ethernet
	if($eth->{type} == 2048){										#Verificar que sea de tipo IP
		my $ip=NetPacket::IP->decode($eth->{data});			#Decodificar la cabecera IP
		if($ip->{proto} == 17){										#Verificar que sea de tipo UDP
			my $udp=NetPacket::UDP->decode($ip->{data});		#Decodificar la cabecera UDP
			#Verificar que el puerto destino sea CHARGEN y que contenga el payload de la vulnerabiliad
			if($udp->{dest_port} eq $PORT::CHARGEN or $udp->{data} =~ /$REQUEST::CHARGEN/s){	
				&sendResponse($RESPONSE::CHARGEN,$ip->{src_ip},$udp->{src_port},$PORT::CHARGEN);			#Obtener direccion IP del equipo que transmite
			}
			#Verificar que el puerto destino sea DNS y que contenga el payload de la vulnerabiliad
			if($udp->{dest_port} eq $PORT::DNS and $udp->{data} =~ /$REQUEST::DNS/s){	
				$dst_ip=$ip->{src_ip};						#Obtener direccion IP del equipo que transmite
				print "Devuelvo respuesta DNS\n";
			}
			#Verificar que el puerto destino sea NetBIOS y que contenga el payload de la vulnerabiliad
			if($udp->{dest_port} eq $PORT::NetBIOS and $udp->{data} =~ /$REQUEST::NetBIOS/s){	
				#print hex int(substr $udp->{data},0,1);
				#print hex int(substr $udp->{data},1,1);
				my ($ch1,$ch2)=unpack "H2H2",$udp->{data};
				&sendResponse((chr hex $ch1).(chr hex $ch2).$RESPONSE::NetBIOS,$ip->{src_ip},$udp->{src_port},$PORT::NetBIOS);						#Obtener direccion IP del equipo que transmite
				#print ($ch1,$ch2);
				#print $udp->{data},"\n";
			}
			#Verificar que el puerto destino sea NTP y que contenga el payload de la vulnerabiliad
			if($udp->{dest_port} eq $PORT::NTP and $udp->{data} =~ /$REQUEST::NTP/s){	
				print "Devuelvo respuesta NTPv2\n";
				&sendResponse($RESPONSE::NTPv2,$ip->{src_ip},$udp->{src_port},$PORT::NTP);					#Obtener direccion IP del equipo que transmite
			}
			elsif($udp->{dest_port} eq $PORT::NTP){
				#print "Devuelvo respuesta NTPv4\n";
				&sendResponse($RESPONSE::NTPv4,$ip->{src_ip},$udp->{src_port},$PORT::NTP);					#Obtener direccion IP del equipo que transmite
			}
			#Verificar que el puerto destino sea QOTD y que contenga el payload de la vulnerabiliad
			if($udp->{dest_port} eq $PORT::QOTD or $udp->{data} =~ /$REQUEST::QOTD/s){
				#print "Devuelvo respuesta QOTD\n";
				&sendResponse($RESPONSE::QOTD,$ip->{src_ip},$udp->{src_port},$PORT::QOTD);					#Obtener direccion IP del equipo que transmite
			}
			#Verificar que el puerto destino sea SNMP y que contenga el payload de la vulnerabiliad
			if($udp->{dest_port} eq $PORT::SNMP and $udp->{data} =~ /$REQUEST::SNMP/s){
				print "Devuelvo respuesta SNMP\n";
				&sendResponse($RESPONSE::SNMP,$ip->{src_ip},$udp->{src_port},$PORT::SNMP);					#Obtener direccion IP del equipo que transmite
			}
			#Verificar que el puerto destino sea SSDP y que contenga el payload de la vulnerabiliad
			if($udp->{dest_port} eq $PORT::SSDP and $udp->{data} =~ /$REQUEST::SSDP/s){
				$dst_ip=$ip->{src_ip};						#Obtener direccion IP del equipo que transmite
				print "Devuelvo respuesta SSDP\n";
			}
		}
	}
}
