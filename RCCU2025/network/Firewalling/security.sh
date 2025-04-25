
[ CORRUPTED - BEGIN OF THE RECOVERABLE CONTENT ]

#=======================
# SECURITY & NETWORKING
#=======================

# Step 1  : reset all, juste to be sure

## Reset fw
iptables -P INPUT ACCEPT
ip6tables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
ip6tables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
ip6tables -P FORWARD ACCEPT

## Reset SSH key
rm -f /root/.ssh/authorized_keys

# Step 2 : update the OS
apt udate
apt upgrade -y

# Step 3 : securing

## Change SSH port to :2222
sed -i -e "/Port /c\Port 2222" /etc/ssh/sshd_config
systemctl restart ssh

## Setup SSH key because password authentification is too weak
mkdir -p /root/.ssh 2> /dev/null
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEvwu4iloEvYbHRarV1fEIALT92VMxDXT0VyAATCTuSvdN9+BuN+E68/I86OCbQgnPOIguOxCTO+5pLZS0qQLjmuq8mm/+ONJsMBb9kDsCtlcIbNmXdUOOpIMtguZzer2K1JBoZ9EUukrsRvQfPSCd4JW064ZdSWx6L4/d9rZa653OzK1csWWysl1e3nqH7ly1rGcnW1lH3AUoig+O8jN/4YYSnx15bTWARdgs3X6ake3/mVaK3W3hiNapygl4WSG3LuLuD2v4E1MIIlB3LQqhS4UDDnxIGHP8BdyNQ28aflVzjhek2ASt7XkLHfuzUVk5NFXJk7RqDJGg5RPAZBSx rsa-key-20231104" >> /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys

## Set up firewall with restrictive rules 
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -N LOGGING
iptables -A LOGGING -j LOG --log-pref "IPtables LOGGING : " --log-level debug
iptables -A LOGGING -j DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 2222 -m state --state NEW,ESTABLISHED -j ACCEPT # SSH must be reachable from anywhere, I have to be able to shut down the server if the cops are near me
iptables -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT # HTTP must be reachable from anywhere, fake website to divert attention
iptables -A INPUT -p tcp -s 91.177.1.2 --dport 7331 -m state --state NEW,ESTABLISHED -j ACCEPT  # C&C on :7331, only accessible from my secure hop server
iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6

## Update DNS

# www. for the website & cc. for C&C 
dynhost_update --subdomain www --domain zzzzz.ovh --user $DYNHOST_USER --pass $DYNHOST_PASS --records A+AAAA
dynhost_update --subdomain cc --domain zzzzz.ovh --user $DYNHOST_USER --pass $DYNHOST_PASS --records A

#=============
# C&C 
#=============

# Set up the C&C
apt install python

[ CORRUPTED - END OF THE RECOVERABLE CONTENT ]
