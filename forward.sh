# Script didacctico Firewall
IPTABLES=/sbin/iptables
EXTIF="enp0s3"
INTERNA="10.10.10.25"
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -F FORWARD
$IPTABLES -t nat -F
echo "Reglas limpiadas"
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Bitacora"
$IPTABLES -A INPUT -p icmp -j LOG --log-prefix "Tráfico PING"
$IPTABLES -A INPUT -p tcp --dport 22 -j LOG --log-prefix "Tráfico SSH"
echo "IP forward habilitado"
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 22 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp --dport 22 -j DNAT --to $INTERNA:22 && echo "Reenvio trafico puerto 22 a INTERNA OK"
$IPTABLES -t nat -A POSTROUTING -s 10.10.10.0/24 -o $EXTIF -j MASQUERADE && echo "Regla 4 OK"
echo "Servicio de internet habilitado"
