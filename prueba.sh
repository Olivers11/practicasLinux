IPTABLES=/sbin/iptables
EXTIF="enp0s3"
INTIF="enp0s8"
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT 
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT 
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -F FORWARD 
$IPTABLES -t nat -F 

echo 1 > /proc/sys/net/ipv4/ip_forward
$IPTABLES -t nat -A POSTROUTING -s 10.10.10.0/24 -o $EXTIF -j MASQUERADE
echo "Servicio de internet habilitado lol"
