# Permitir todo el tráfico desde localhost
execute 'iptables -A INPUT -s localhost -j ACCEPT'

# Permitir tráfico entrante en el puerto 22 (SSH)
execute 'iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT'

# Permitir todo el tráfico entrante RELATED
execute 'iptables -A INPUT -i eth0 -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT'

# Permitir tráfico entrante de queries DNS
execute 'iptables -A INPUT -i eth0 -p udp --sport 53 --dport 1024:65535 -j ACCEPT'

# Permitir tráfico entrante para NTP
execute 'iptables -A INPUT -i eth0 -p udp --sport 123 -j ACCEPT'

# Permitir tráfico entrante en puertos HTTP y HTTPS
execute 'iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT'
execute 'iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT'

# No permitir todas las otras conexiones entrantes
execute 'iptables -P INPUT DROP'

# Guardar las reglas
apt_package 'iptables-persistent'

execute 'sudo sh -c "iptables-save > /etc/iptables/rules.v4"'
