IPTABLES=/sbin/iptables
EXTIF="enp0s3"
INTIF="enp0s8"
DMZIF="enp0s9"
INTERNA="110.10.70.200"
DMZ="210.20.70.200"
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
$IPTABLES -A INPUT -p tcp --dport 10000  -j LOG --log-prefix "Tráfico WEBMIN"
$IPTABLES -A INPUT -p tcp --dport 22 -j LOG --log-prefix "Tráfico SSH"
$IPTABLES -A INPUT -p tcp --dport 3306 -j LOG --log-prefix "Tráfico mysql interna"
$IPTABLES -A INPUT -p tcp --dport 3307 -j LOG --log-prefix "Tráfico mysql DMZ"
echo "IP forward habilitado"
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 22 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp --dport 22 -j DNAT --to $INTERNA:22 && echo "Reenvio tráfico puerto 22 a interna OK"
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 10000 -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 10001 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp --dport 10001 -j DNAT --to $INTERNA:10000 && echo "Regla 1 OK"
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 10002 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp --dport 10002 -j DNAT --to $DMZ:10000 && echo "Regla 2 OK"
$IPTABLES -t nat -A POSTROUTING -s 110.10.70.0/24 -o $EXTIF -j MASQUERADE && echo "Regla 3 OK"
$IPTABLES -t nat -A POSTROUTING -s 210.20.70.0/24 -o $EXTIF -j MASQUERADE && echo "regla 4 ok"
$IPTABLES -A FORWARD -s 110.10.70.0/24 -d 210.20.70.0/24 -p ICMP -j DROP
echo "Servicio webmin desde exterior"
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 3306 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp --dport 3306 -j DNAT --to $INTERNA:3306
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 3307 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp --dport 3307 -j DNAT --to $DMZ:3306
echo "Servicio mysql transparente funcionando"
echo "Ya tiene internet"
