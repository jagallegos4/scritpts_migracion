# 2024-06-06 15:22:31 by RouterOS 7.14.2
# software id = SSXB-J5Q7
#
# model = CCR1009-7G-1C-1S+
# serial number = 91500953448F
/interface bridge
add name=br100 protocol-mode=none
add name=loopback port-cost-mode=short protocol-mode=none
/interface ethernet
set [ find default-name=combo1 ] comment="HACIA NODO COMPANIA"
set [ find default-name=ether1 ] comment=WAN
set [ find default-name=ether3 ] comment="UPLINK OLT VSOL"
set [ find default-name=ether4 ] comment="HACIA SW-2011"
set [ find default-name=ether7 ] comment=CONSOLA
/interface wireguard
add listen-port=51820 mtu=1420 name=wireguard1
/interface vlan
add comment="UPLINK OLT 1-CLIENTES" interface=ether3 name=vlan100 vlan-id=100
add interface=sfp-sfpplus1 name=vlan100-olt-HW vlan-id=100
add comment=ADMINISTRACION interface=ether4 name=vlan105 vlan-id=105
add comment="RED INTERNA" interface=ether4 name=vlan106 vlan-id=106
add comment="Hacia Nodo Compania" interface=combo1 name=vlan110 vlan-id=110
/interface list
add name=Lista_WAN_WispHub
/interface lte apn
set [ find default=yes ] ip-type=ipv4 use-network-apn=no
/ip pool
add name=dhcp_pool2 ranges=192.168.70.2-192.168.70.254
add name=poolVPN ranges=192.168.26.30-192.168.26.254
add name=dhcp_pool3 ranges=192.168.120.2-192.168.120.254
add name=dhcp_pool5 ranges=172.20.1.200-172.20.1.250
/ip dhcp-server
add address-pool=dhcp_pool5 interface=vlan106 lease-time=10m name=dhcp1
/ip smb users
set [ find default=yes ] disabled=yes
/port
set 0 name=serial0
set 1 name=serial1
/ppp profile
add dns-server=8.8.8.8 local-address=192.168.26.1 name=profileVPN \
    remote-address=poolVPN use-compression=yes use-encryption=yes
add local-address=192.168.166.1 name="VPN L2TP IMBACOOP" remote-address=\
    192.168.166.5 use-compression=yes use-encryption=yes use-mpls=yes
add local-address=10.10.10.1 name=PLAN_FO
add name=wisphub-profile
add name=adminolt-profile
/interface sstp-client
add comment="AdminOLT VPN" connect-to=vpn.adminolt.co disabled=no name=\
    AdminOLTVPN profile=adminolt-profile user=adminolt3wmvwh19c7msx1i
add comment="WispHub VPN" connect-to=vpn9.wisphub.net disabled=no name=\
    WisphubVPN profile=wisphub-profile user=wisphubd8uxmww56nsb7e6
/queue simple
add burst-time=10s/10s max-limit=50M/50M name=prueba1 target=10.10.0.1/32
add burst-time=10s/10s max-limit=50M/50M name=10001 target=10.10.0.3/32
add burst-time=10s/10s max-limit=50M/50M name=10002 target=10.10.0.4/32
add burst-time=10s/10s max-limit=50M/50M name=10005 target=10.10.0.5/32
add burst-time=10s/10s max-limit=50M/50M name=10004 target=10.10.0.2/32
add burst-time=10s/10s max-limit=50M/50M name=10006 target=10.10.0.6/32
add burst-time=10s/10s max-limit=50M/50M name=10007 target=10.10.0.7/32
add burst-time=10s/10s max-limit=50M/50M name=10008 target=10.10.0.8/32
add burst-time=10s/10s max-limit=50M/50M name=10009 target=10.10.0.9/32
add burst-time=10s/10s max-limit=50M/50M name=10010 target=10.10.0.10/32
add burst-time=10s/10s max-limit=50M/50M name=10011 target=10.10.0.11/32
add burst-time=10s/10s max-limit=50M/50M name=10012 target=10.10.0.12/32
add burst-time=10s/10s max-limit=50M/50M name=10013 target=10.10.0.13/32
add burst-time=10s/10s max-limit=50M/50M name=10014 target=10.10.0.14/32
add burst-time=10s/10s max-limit=50M/50M name=10015 target=10.10.0.15/32
add burst-time=10s/10s max-limit=50M/50M name=10016 target=10.10.0.16/32
add burst-time=10s/10s max-limit=50M/50M name=10017 target=10.10.0.17/32
add burst-time=10s/10s max-limit=50M/50M name=10018 target=10.10.0.18/32
add burst-time=10s/10s max-limit=50M/50M name=10019 target=10.10.0.19/32
add burst-time=10s/10s max-limit=50M/50M name=10020 target=10.10.0.20/32
add burst-time=10s/10s max-limit=50M/50M name=10021 target=10.10.0.21/32
add burst-time=10s/10s max-limit=50M/50M name=10022 target=10.10.0.22/32
add burst-time=10s/10s max-limit=50M/50M name=10023 target=10.10.0.23/32
add burst-time=10s/10s max-limit=50M/50M name=10024 target=10.10.0.24/32
add burst-time=10s/10s max-limit=50M/50M name=10026 target=10.10.0.26/32
add burst-time=10s/10s max-limit=50M/50M name=10027 target=10.10.0.27/32
add burst-time=10s/10s max-limit=50M/50M name=10028 target=10.10.0.28/32
add burst-time=10s/10s max-limit=50M/50M name=10029 target=10.10.0.29/32
add burst-time=10s/10s max-limit=50M/50M name=10030 target=10.10.0.30/32
add burst-time=10s/10s max-limit=50M/50M name=10031 target=10.10.0.31/32
add burst-time=10s/10s max-limit=50M/50M name=10032 target=10.10.0.32/32
add burst-time=10s/10s max-limit=50M/50M name=10033 target=10.10.0.33/32
add burst-time=10s/10s max-limit=50M/50M name=10034 target=10.10.0.34/32
add burst-time=10s/10s max-limit=50M/50M name=10035 target=10.10.0.35/32
add burst-time=10s/10s max-limit=50M/50M name=10036 target=10.10.0.36/32
add burst-time=10s/10s max-limit=50M/50M name=10037 target=10.10.0.37/32
add burst-time=10s/10s max-limit=50M/50M name=10038 target=10.10.0.38/32
add burst-time=10s/10s max-limit=50M/50M name=10039 target=10.10.0.39/32
add burst-time=10s/10s max-limit=50M/50M name=10040 target=10.10.0.40/32
add burst-time=10s/10s max-limit=50M/50M name=10041 target=10.10.0.41/32
add burst-time=10s/10s max-limit=50M/50M name=10042 target=10.10.0.42/32
add burst-time=10s/10s max-limit=50M/50M name=10043 target=10.10.0.43/32
add burst-time=10s/10s max-limit=50M/50M name=10044 target=10.10.0.44/32
add burst-time=10s/10s max-limit=50M/50M name=10045 target=10.10.0.45/32
add burst-time=10s/10s max-limit=50M/50M name=10046 target=10.10.0.46/32
add burst-time=10s/10s max-limit=50M/50M name=10047 target=10.10.0.47/32
add burst-time=10s/10s max-limit=50M/50M name=10048 target=10.10.0.48/32
add burst-time=10s/10s max-limit=50M/50M name=10049 target=10.10.0.49/32
add burst-time=10s/10s max-limit=50M/50M name=10050 target=10.10.0.50/32
add burst-time=10s/10s max-limit=50M/50M name=10051 target=10.10.0.51/32
add burst-time=10s/10s max-limit=50M/50M name=10052 target=10.10.0.52/32
add burst-time=10s/10s max-limit=50M/50M name=10053 target=10.10.0.53/32
add burst-time=10s/10s max-limit=50M/50M name=10054 target=10.10.0.54/32
add burst-time=10s/10s max-limit=50M/50M name=10055 target=10.10.0.55/32
add burst-time=10s/10s max-limit=50M/50M name=10056 target=10.10.0.56/32
add burst-time=10s/10s max-limit=50M/50M name=10057 target=10.10.0.57/32
add burst-time=10s/10s max-limit=50M/50M name=10058 target=10.10.0.58/32
add burst-time=10s/10s max-limit=50M/50M name=10059 target=10.10.0.59/32
add burst-time=10s/10s max-limit=50M/50M name=10060 target=10.10.0.60/32
add burst-time=10s/10s max-limit=50M/50M name=10061 target=10.10.0.61/32
add burst-time=10s/10s max-limit=50M/50M name=10062 target=10.10.0.62/32
add burst-time=10s/10s max-limit=50M/50M name=10063 target=10.10.0.63/32
add burst-time=10s/10s max-limit=50M/50M name=10064 target=10.10.0.64/32
add burst-time=10s/10s max-limit=50M/50M name=10066 target=10.10.0.66/32
add burst-time=10s/10s max-limit=50M/50M name=10067 target=10.10.0.67/32
add burst-time=10s/10s max-limit=50M/50M name=10068 target=10.10.0.68/32
add burst-time=10s/10s max-limit=50M/50M name=10069 target=10.10.0.69/32
add burst-time=10s/10s max-limit=50M/50M name=10070 target=10.10.0.70/32
add burst-time=10s/10s max-limit=50M/50M name=10071 target=10.10.0.71/32
add burst-time=10s/10s max-limit=50M/50M name=10072 target=10.10.0.72/32
add burst-time=10s/10s max-limit=50M/50M name=10073 target=10.10.0.73/32
add burst-time=10s/10s max-limit=50M/50M name=10074 target=10.10.0.74/32
add burst-time=10s/10s max-limit=50M/50M name=10075 target=10.10.0.75/32
add burst-time=10s/10s max-limit=50M/50M name=10076 target=10.10.0.76/32
add burst-time=10s/10s max-limit=50M/50M name=10077 target=10.10.0.77/32
add burst-time=10s/10s max-limit=50M/50M name=10079 target=10.10.0.79/32
add burst-time=10s/10s max-limit=50M/50M name=10078 target=10.10.0.78/32
add burst-time=10s/10s max-limit=50M/50M name=10080 target=10.10.0.80/32
add burst-time=10s/10s max-limit=50M/50M name=10081 target=10.10.0.81/32
add burst-time=10s/10s max-limit=50M/50M name=10082 target=10.10.0.82/32
add burst-time=10s/10s max-limit=50M/50M name=10083 target=10.10.0.83/32
add burst-time=10s/10s max-limit=50M/50M name=10084 target=10.10.0.84/32
add burst-time=10s/10s max-limit=50M/50M name=10086 target=10.10.0.86/32
add burst-time=10s/10s max-limit=50M/50M name=10087 target=10.10.0.87/32
add burst-time=10s/10s max-limit=50M/50M name=10088 target=10.10.0.88/32
add burst-time=10s/10s max-limit=50M/50M name=10089 target=10.10.0.89/32
add burst-time=10s/10s max-limit=50M/50M name=10090 target=10.10.0.90/32
add burst-time=10s/10s max-limit=50M/50M name=10091 target=10.10.0.91/32
add burst-time=10s/10s max-limit=50M/50M name=10092 target=10.10.0.92/32
add burst-time=10s/10s max-limit=50M/50M name=10093 target=10.10.0.93/32
add burst-time=10s/10s max-limit=50M/50M name=10094 target=10.10.0.94/32
add burst-time=10s/10s max-limit=50M/50M name=10095 target=10.10.0.95/32
add burst-time=10s/10s max-limit=50M/50M name=10096 target=10.10.0.96/32
add burst-time=10s/10s max-limit=50M/50M name=10097 target=10.10.0.97/32
add burst-time=10s/10s max-limit=50M/50M name=10098 target=10.10.0.98/32
add burst-time=10s/10s max-limit=50M/50M name=10099 target=10.10.0.99/32
add burst-time=10s/10s max-limit=50M/50M name=10100 target=10.10.0.100/32
add burst-time=10s/10s max-limit=50M/50M name=10101 target=10.10.0.101/32
add burst-time=10s/10s max-limit=50M/50M name=10102 target=10.10.0.102/32
add burst-time=10s/10s max-limit=50M/50M name=10103 target=10.10.0.103/32
add burst-time=10s/10s max-limit=50M/50M name=10105 target=10.10.0.104/32
add burst-time=10s/10s max-limit=50M/50M name=10106 target=10.10.0.106/32
add burst-time=10s/10s max-limit=50M/50M name=10107 target=10.10.0.107/32
add burst-time=10s/10s max-limit=50M/50M name=10108 target=10.10.0.108/32
add burst-time=10s/10s max-limit=50M/50M name=10109 target=10.10.0.109/32
add burst-time=10s/10s max-limit=50M/50M name=10110 target=10.10.0.110/32
add burst-time=10s/10s max-limit=50M/50M name=10111 target=10.10.0.111/32
add burst-time=10s/10s max-limit=50M/50M name=10112 target=10.10.0.112/32
add burst-time=10s/10s max-limit=50M/50M name=10113 target=10.10.0.113/32
add burst-time=10s/10s max-limit=50M/50M name=10114 target=10.10.0.114/32
add burst-time=10s/10s max-limit=50M/50M name=10115 target=10.10.0.115/32
add burst-time=10s/10s max-limit=50M/50M name=10118 target=10.10.0.118/32
add burst-time=10s/10s max-limit=50M/50M name=10119 target=10.10.0.119/32
add burst-time=10s/10s max-limit=50M/50M name=10120 target=10.10.0.120/32
add burst-time=10s/10s max-limit=50M/50M name=10121 target=10.10.0.121/32
add burst-time=10s/10s max-limit=50M/50M name=10122 target=10.10.0.122/32
add burst-time=10s/10s max-limit=50M/50M name=10123 target=10.10.0.123/32
add burst-time=10s/10s max-limit=50M/50M name=10124 target=10.10.0.124/32
add burst-time=10s/10s max-limit=50M/50M name=10125 target=10.10.0.125/32
add burst-time=10s/10s max-limit=50M/50M name=10126 target=10.10.0.126/32
add burst-time=10s/10s max-limit=50M/50M name=10127 target=10.10.0.127/32
add burst-time=10s/10s max-limit=50M/50M name=10128 target=10.10.0.128/32
add burst-time=10s/10s max-limit=50M/50M name=10129 target=10.10.0.129/32
add burst-time=10s/10s max-limit=50M/50M name=10130 target=10.10.0.130/32
add burst-time=10s/10s max-limit=50M/50M name=10131 target=10.10.0.131/32
add burst-time=10s/10s max-limit=50M/50M name=10132 target=10.10.0.132/32
add burst-time=10s/10s max-limit=50M/50M name=10133 target=10.10.0.133/32
add burst-time=10s/10s max-limit=50M/50M name=10134 target=10.10.0.134/32
add burst-time=10s/10s max-limit=50M/50M name=10135 target=10.10.0.135/32
add burst-time=10s/10s max-limit=50M/50M name=10136 target=10.10.0.136/32
add burst-time=10s/10s max-limit=50M/50M name=10137 target=10.10.0.137/32
add burst-time=10s/10s max-limit=50M/50M name=10138 target=10.10.0.138/32
add burst-time=10s/10s max-limit=50M/50M name=10139 target=10.10.0.139/32
add burst-time=10s/10s max-limit=50M/50M name=10140 target=10.10.0.140/32
add burst-time=10s/10s max-limit=50M/50M name=10141 target=10.10.0.141/32
add burst-time=10s/10s max-limit=50M/50M name=10142 target=10.10.0.142/32
add burst-time=10s/10s max-limit=50M/50M name=10143 target=10.10.0.143/32
add burst-time=10s/10s max-limit=50M/50M name=10144 target=10.10.0.144/32
add burst-time=10s/10s max-limit=50M/50M name=10145 target=10.10.0.145/32
add burst-time=10s/10s max-limit=50M/50M name=10146 target=10.10.0.146/32
add burst-time=10s/10s max-limit=50M/50M name=10147 target=10.10.0.147/32
add burst-time=10s/10s max-limit=50M/50M name=10148 target=10.10.0.148/32
add burst-time=10s/10s max-limit=50M/50M name=10149 target=10.10.0.149/32
add burst-time=10s/10s max-limit=50M/50M name=10150 target=10.10.0.150/32
add burst-time=10s/10s max-limit=50M/50M name=10151 target=10.10.0.151/32
add burst-time=10s/10s max-limit=50M/50M name=10152 target=10.10.0.152/32
add burst-time=10s/10s max-limit=50M/50M name=10153 target=10.10.0.153/32
add burst-time=10s/10s max-limit=50M/50M name=10154 target=10.10.0.154/32
add burst-time=10s/10s max-limit=50M/50M name=10155 target=10.10.0.155/32
add burst-time=10s/10s max-limit=50M/50M name=10156 target=10.10.0.156/32
add burst-time=10s/10s max-limit=50M/50M name=10158 target=10.10.0.158/32
add burst-time=10s/10s max-limit=50M/50M name=10159 target=10.10.0.159/32
add burst-time=10s/10s max-limit=50M/50M name=10160 target=10.10.0.160/32
add burst-time=10s/10s max-limit=50M/50M name=10161 target=10.10.0.161/32
add burst-time=10s/10s max-limit=50M/50M name=10162 target=10.10.0.162/32
add burst-time=10s/10s max-limit=50M/50M name=10163 target=10.10.0.163/32
add burst-time=10s/10s max-limit=50M/50M name=10164 target=10.10.0.164/32
add burst-time=10s/10s max-limit=50M/50M name=10165 target=10.10.0.165/32
add burst-time=10s/10s max-limit=50M/50M name=10166 target=10.10.0.166/32
add burst-time=10s/10s max-limit=50M/50M name=10167 target=10.10.0.167/32
add burst-time=10s/10s max-limit=50M/50M name=10168 target=10.10.0.168/32
add burst-time=10s/10s max-limit=50M/50M name=10169 target=10.10.0.169/32
add burst-time=10s/10s max-limit=50M/50M name=10171 target=10.10.0.171/32
add burst-time=10s/10s max-limit=50M/50M name=10170 target=10.10.0.170/32
add burst-time=10s/10s max-limit=50M/50M name=10172 target=10.10.0.172/32
add burst-time=10s/10s max-limit=50M/50M name=10173 target=10.10.0.173/32
add burst-time=10s/10s max-limit=50M/50M name=10174 target=10.10.0.174/32
add burst-time=10s/10s max-limit=50M/50M name=10175 target=10.10.0.175/32
/queue type
add kind=cake name=cake-imp
/ppp profile
set *0 queue-type=cake-imp
/routing bgp template
set default disabled=no output.network=bgp-networks
/routing ospf instance
add disabled=no name=default-v2 originate-default=always redistribute=\
    connected,static,ospf router-id=172.16.0.1
/routing ospf area
add disabled=no instance=default-v2 name=backbone-v2
/routing table
add fib name=wisphub
add fib name=adminolt
/user group
set read policy="read,winbox,password,sensitive,!local,!telnet,!ssh,!ftp,!rebo\
    ot,!write,!policy,!test,!web,!sniff,!api,!romon,!rest-api"
add name=wisphub policy="local,ftp,reboot,read,write,policy,test,password,snif\
    f,sensitive,api,romon,!telnet,!ssh,!winbox,!web,!rest-api"
/interface bridge port
add bridge=br100 interface=ether3
add bridge=br100 interface=sfp-sfpplus1
add bridge=br100 interface=vlan100
add bridge=br100 interface=vlan100-olt-HW
/ip firewall connection tracking
set udp-timeout=10s
/ip settings
set max-neighbor-entries=8192
/ipv6 settings
set max-neighbor-entries=8192
/interface bridge vlan
add bridge=br100 vlan-ids=100
/interface list member
add interface=ether1 list=Lista_WAN_WispHub
/interface ovpn-server server
set auth=sha1,md5
/interface pppoe-server server
add disabled=no interface=br100 max-mtu=1492 service-name=PPPOE_SERVER1
/interface pptp-server server
# PPTP connections are considered unsafe, it is suggested to use a more modern VPN protocol instead
set authentication=pap,chap,mschap1,mschap2
/interface wireguard peers
add allowed-address=192.168.200.2/32 endpoint-port=51820 interface=wireguard1 \
    public-key="vwASiUSKDoRdNHgLVeIg2c1d77Y5LcWPdrj140ImYCk="
/ip address
add address=192.168.70.1/24 comment=CONSOLA disabled=yes interface=ether7 \
    network=192.168.70.0
add address=45.239.49.233 comment="WAN CON FIBRAMAX" interface=ether1 \
    network=45.239.49.232
add address=172.16.0.1 interface=loopback network=172.16.0.1
add address=10.0.0.25/30 comment="Hacia nodo compania" interface=vlan110 \
    network=10.0.0.24
add address=172.20.0.1/24 comment="ADMINISTRACION OLT" interface=vlan105 \
    network=172.20.0.0
add address=172.20.1.1/24 comment="RED INTERNA" interface=vlan106 network=\
    172.20.1.0
add address=10.20.20.1/30 disabled=yes interface=*1B network=10.20.20.0
add address=192.168.200.1/24 interface=wireguard1 network=192.168.200.0
/ip cloud
set ddns-enabled=yes
/ip cloud advanced
set use-local-address=yes
/ip dhcp-server network
add address=172.20.1.0/24 gateway=172.20.1.1
add address=192.168.70.0/24 gateway=192.168.70.1
/ip dns
set servers=8.8.8.8,8.8.4.4,200.63.105.194,45.236.107.126
/ip firewall address-list
add address=192.241.222.19 list=servers_wisphub
add address=107.170.255.167 list=servers_wisphub
add address=104.26.12.125 list=servers_wisphub
add address=104.26.13.125 list=servers_wisphub
add address=172.67.72.161 list=servers_wisphub
add address=192.241.192.207 list=servers_wisphub
add address=servers-corte.wisphub.net list=servers_wisphub
add address=clientes.portalinternet.net list=servers_wisphub
add address=192.168.0.0/16 disabled=yes list=NAT_GENERAL_ISP
add address=192.168.28.110 comment=0441 list=Moroso
add address=192.168.27.224 comment=0429 list=Moroso
add address=192.168.27.94 comment=0427 list=Moroso
add address=192.168.27.92 comment=0420 list=Moroso
add address=192.168.28.121 comment=0419 list=Moroso
add address=192.168.27.132 comment=0381 list=Moroso
add address=192.168.27.194 comment=0355 list=Moroso
add address=192.168.27.152 comment=0291 list=Moroso
add address=192.168.28.80 comment=0214 list=Moroso
add address=192.168.28.74 comment=0186 list=Moroso
add address=192.168.27.81 comment=0043 list=Moroso
add address=192.168.27.96 comment=0021 list=Moroso
add address=192.168.27.142 comment=0168 list=Moroso
add address=192.168.63.208 comment=0494 list=Moroso
add address=192.168.63.207 comment=0493 list=Moroso
add address=192.168.27.245 comment=0485 list=Moroso
add address=192.168.27.244 comment=0482 list=Moroso
add address=192.168.27.243 comment=0481 list=Moroso
add address=192.168.27.234 comment=0459 list=Moroso
add address=192.168.27.227 comment=0438 list=Moroso
add address=192.168.27.215 comment=0415 list=Moroso
add address=192.168.27.212 comment=0400 list=Moroso
add address=192.168.27.202 comment=0378 list=Moroso
add address=192.168.27.131 comment=0283 list=Moroso
add address=192.168.27.205 comment=0242 list=Moroso
add address=192.168.27.134 comment=0205 list=Moroso
add address=192.168.27.118 comment=0204 list=Moroso
add address=192.168.27.115 comment=0200 list=Moroso
add address=192.168.28.71 comment=0161 list=Moroso
add address=192.168.27.141 comment=0098 list=Moroso
add address=192.168.27.240 comment=0063 list=Moroso
add address=192.168.27.154 comment=0061 list=Moroso
add address=192.168.28.70 comment=0097 list=Moroso
add address=192.168.28.114 comment=0479 list=Moroso
add address=192.168.27.2 comment=0410 list=Moroso
add address=192.168.27.66 comment=0204 list=Moroso
add address=192.168.28.105 comment=0156 list=Moroso
add address=192.168.27.214 comment=0414 list=Moroso
add address=192.168.28.104 comment=0242 list=Moroso
add address=192.168.27.222 comment=0448 list=Moroso
add address=192.168.27.236 comment=0436 list=Moroso
add address=192.168.27.95 comment=0433 list=Moroso
add address=192.168.27.88 comment=0362 list=Moroso
add address=192.168.21.220 comment=0058 list=Moroso
add address=192.168.28.69 comment=0035 list=Moroso
add address=192.168.28.57 comment=0033 list=Moroso
add address=192.168.27.57 comment=0014 list=Moroso
add address=192.168.28.96 comment=0054 list=Moroso
add address=10.10.0.72 comment=10072 list=Moroso
add address=10.10.0.26 comment=10026 list=Moroso
add address=10.10.0.59 comment=10059 list=Moroso
add address=10.10.0.91 comment=10091 list=Moroso
add address=10.10.0.18 comment=10018 list=Moroso
add address=10.10.0.79 comment=10079 list=Moroso
add address=10.10.0.126 comment=10126 list=Moroso
add address=10.10.0.113 comment=10113 list=Moroso
add address=10.10.0.101 comment=10101 list=Moroso
add address=10.10.0.11 comment=10011 list=Moroso
add address=10.10.0.132 comment=10132 list=Moroso
add address=10.10.0.121 comment=10121 list=Moroso
add address=10.10.0.1 comment=prueba1 list=Moroso
add address=10.10.0.135 comment=10135 list=Moroso
add address=10.10.0.122 comment=10122 list=Moroso
add address=10.10.0.110 comment=10110 list=Moroso
add address=10.10.0.109 comment=10109 list=Moroso
add address=amz.smartolt.com list=CloudOLT
/ip firewall filter
add action=drop chain=input comment=\
    "WispHub - Bloquear puerto WebProxy desde WANs" dst-port=999 \
    in-interface-list=Lista_WAN_WispHub protocol=tcp
/ip firewall nat
add action=masquerade chain=srcnat comment=\
    "NAT ENMASCARADE NO USAR CON IPS PUBLICAS ADMINSITRABLES" out-interface=\
    ether1
add action=src-nat chain=srcnat disabled=yes src-address-list=NAT_GENERAL_ISP \
    to-addresses=45.239.49.233
add action=accept chain=dstnat comment=\
    "WispHub - Permitir pagina web morosos" dst-address-list=servers_wisphub \
    src-address-list=Moroso
add action=accept chain=dstnat comment="WispHub - Permitir pagina web avisos" \
    dst-address-list=servers_wisphub src-address-list=Aviso
add action=dst-nat chain=dstnat disabled=yes dst-address=177.234.232.83 \
    dst-port=8443 protocol=tcp to-addresses=192.168.27.33 to-ports=8443
add action=redirect chain=dstnat comment=\
    "WispHub - Suspension de clientes(TCP)" dst-port=!8291 in-interface-list=\
    !Lista_WAN_WispHub protocol=tcp src-address-list=Moroso to-ports=999
add action=redirect chain=dstnat comment=\
    "WispHub - Suspension de clientes(UDP)" dst-port=!8291,53 \
    in-interface-list=!Lista_WAN_WispHub protocol=udp src-address-list=Moroso \
    to-ports=999
add action=redirect chain=dstnat comment=\
    "WispHub - Aviso de Pago en Pantalla de clientes(UDP)" dst-port=!8291,53 \
    in-interface-list=!Lista_WAN_WispHub protocol=udp src-address-list=Aviso \
    to-ports=999
add action=redirect chain=dstnat comment=\
    "WispHub - Aviso de Pago en Pantalla de clientes(TCP)" dst-port=!8291 \
    in-interface-list=!Lista_WAN_WispHub protocol=tcp src-address-list=Aviso \
    to-ports=999
add action=masquerade chain=srcnat comment=CloudOLT dst-address-list=CloudOLT \
    src-address=172.20.0.100
add action=dst-nat chain=dstnat comment=CloudOLT dst-address=45.239.49.233 \
    dst-port=2333 protocol=tcp src-address-list=CloudOLT to-addresses=\
    172.20.0.100 to-ports=23
add action=dst-nat chain=dstnat comment=CloudOLT dst-address=45.239.49.233 \
    dst-port=2322 protocol=tcp src-address-list=CloudOLT to-addresses=\
    172.20.0.100 to-ports=22
add action=dst-nat chain=dstnat comment=CloudOLT dst-address=45.239.49.233 \
    dst-port=2161 protocol=udp src-address-list=CloudOLT to-addresses=\
    172.20.0.100 to-ports=161
/ip proxy
set enabled=yes port=999
/ip proxy access
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0071@lineass/71/ \
    comment=0071-Aviso local-port=999 src-address=192.168.41.59
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0412@lineass/412/ \
    comment=0412-Moroso local-port=999 src-address=192.168.27.187
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0355@lineass/355/ \
    comment=0355-Moroso local-port=999 src-address=192.168.27.194
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0291@lineass/291/ \
    comment=0291-Moroso local-port=999 src-address=192.168.27.152
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0264@lineass/264/ \
    comment=0264-Moroso local-port=999 src-address=192.168.41.98
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0159@lineass/159/ \
    comment=0159-Moroso local-port=999 src-address=192.168.27.100
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0067@lineass/67/ \
    comment=0067-Moroso local-port=999 src-address=192.168.41.115
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0071@lineass/71/ \
    comment=0071-Aviso local-port=999 src-address=192.168.41.59
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0071@lineass/71/ \
    comment=0071-Moroso local-port=999 src-address=192.168.41.59
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0448@lineass/448/ \
    comment=0448-Aviso local-port=999 src-address=192.168.27.250
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0436@lineass/436/ \
    comment=0436-Aviso local-port=999 src-address=192.168.27.235
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0095@lineass/95/ \
    comment=0095-Aviso local-port=999 src-address=192.168.41.72
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0288@lineass/288/ \
    comment=0288-Aviso local-port=999 src-address=192.168.41.103
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0441@lineass/441/ \
    comment=0441-Moroso local-port=999 src-address=192.168.27.229
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0429@lineass/429/ \
    comment=0429-Moroso local-port=999 src-address=192.168.27.224
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0417@lineass/417/ \
    comment=0417-Moroso local-port=999 src-address=192.168.27.75
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0381@lineass/381/ \
    comment=0381-Moroso local-port=999 src-address=192.168.27.132
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0355@lineass/355/ \
    comment=0355-Moroso local-port=999 src-address=192.168.27.194
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0291@lineass/291/ \
    comment=0291-Moroso local-port=999 src-address=192.168.27.152
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0067@lineass/67/ \
    comment=0067-Moroso local-port=999 src-address=192.168.41.115
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0095@lineass/95/ \
    comment=0095-Moroso local-port=999 src-address=192.168.41.72
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0473@lineass/473/ \
    comment=0473-Aviso local-port=999 src-address=192.168.41.125
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0469@lineass/469/ \
    comment=0469-Aviso local-port=999 src-address=192.168.41.124
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0463@lineass/463/ \
    comment=0463-Aviso local-port=999 src-address=192.168.41.123
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0424@lineass/424/ \
    comment=0424-Aviso local-port=999 src-address=192.168.41.122
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0423@lineass/423/ \
    comment=0423-Aviso local-port=999 src-address=192.168.41.119
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0399@lineass/399/ \
    comment=0399-Aviso local-port=999 src-address=192.168.41.117
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0386@lineass/386/ \
    comment=0386-Aviso local-port=999 src-address=192.168.41.116
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0341@lineass/341/ \
    comment=0341-Aviso local-port=999 src-address=192.168.41.109
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0321@lineass/321/ \
    comment=0321-Aviso local-port=999 src-address=192.168.41.111
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0320@lineass/320/ \
    comment=0320-Aviso local-port=999 src-address=192.168.41.110
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0307@lineass/307/ \
    comment=0307-Aviso local-port=999 src-address=192.168.41.107
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0303@lineass/303/ \
    comment=0303-Aviso local-port=999 src-address=192.168.41.112
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0300@lineass/300/ \
    comment=0300-Aviso local-port=999 src-address=192.168.41.105
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0290@lineass/290/ \
    comment=0290-Aviso local-port=999 src-address=192.168.41.104
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0288@lineass/288/ \
    comment=0288-Aviso local-port=999 src-address=192.168.41.103
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0271@lineass/271/ \
    comment=0271-Aviso local-port=999 src-address=192.168.41.114
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0268@lineass/268/ \
    comment=0268-Aviso local-port=999 src-address=192.168.41.100
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0257@lineass/257/ \
    comment=0257-Aviso local-port=999 src-address=192.168.41.102
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0235@lineass/235/ \
    comment=0235-Aviso local-port=999 src-address=192.168.41.93
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0196@lineass/196/ \
    comment=0196-Aviso local-port=999 src-address=192.168.41.88
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0195@lineass/195/ \
    comment=0195-Aviso local-port=999 src-address=192.168.41.89
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0190@lineass/190/ \
    comment=0190-Aviso local-port=999 src-address=192.168.41.86
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0187@lineass/187/ \
    comment=0187-Aviso local-port=999 src-address=192.168.41.83
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0179@lineass/179/ \
    comment=0179-Aviso local-port=999 src-address=192.168.41.80
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0178@lineass/178/ \
    comment=0178-Aviso local-port=999 src-address=192.168.41.81
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0164@lineass/164/ \
    comment=0164-Aviso local-port=999 src-address=192.168.41.79
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0119@lineass/119/ \
    comment=0119-Aviso local-port=999 src-address=192.168.41.118
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0096@lineass/96/ \
    comment=0096-Aviso local-port=999 src-address=192.168.41.73
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0094@lineass/94/ \
    comment=0094-Aviso local-port=999 src-address=192.168.41.71
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0093@lineass/93/ \
    comment=0093-Aviso local-port=999 src-address=192.168.41.94
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0092@lineass/92/ \
    comment=0092-Aviso local-port=999 src-address=192.168.41.85
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0091@lineass/91/ \
    comment=0091-Aviso local-port=999 src-address=192.168.41.31
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0089@lineass/89/ \
    comment=0089-Aviso local-port=999 src-address=192.168.41.65
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0072@lineass/72/ \
    comment=0072-Aviso local-port=999 src-address=192.168.41.61
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0071@lineass/71/ \
    comment=0071-Aviso local-port=999 src-address=192.168.41.121
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0069@lineass/69/ \
    comment=0069-Aviso local-port=999 src-address=192.168.41.55
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0066@lineass/66/ \
    comment=0066-Aviso local-port=999 src-address=192.168.41.51
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0469@lineass/469/ \
    comment=0469-Moroso local-port=999 src-address=192.168.41.124
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0463@lineass/463/ \
    comment=0463-Moroso local-port=999 src-address=192.168.41.123
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0424@lineass/424/ \
    comment=0424-Moroso local-port=999 src-address=192.168.41.122
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0399@lineass/399/ \
    comment=0399-Moroso local-port=999 src-address=192.168.41.117
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0320@lineass/320/ \
    comment=0320-Moroso local-port=999 src-address=192.168.41.110
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0257@lineass/257/ \
    comment=0257-Moroso local-port=999 src-address=192.168.41.102
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0214@lineass/214/ \
    comment=0214-Moroso local-port=999 src-address=192.168.27.121
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0195@lineass/195/ \
    comment=0195-Moroso local-port=999 src-address=192.168.41.89
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0179@lineass/179/ \
    comment=0179-Moroso local-port=999 src-address=192.168.41.80
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0119@lineass/119/ \
    comment=0119-Moroso local-port=999 src-address=192.168.41.118
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0096@lineass/96/ \
    comment=0096-Moroso local-port=999 src-address=192.168.41.73
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0094@lineass/94/ \
    comment=0094-Moroso local-port=999 src-address=192.168.41.71
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0092@lineass/92/ \
    comment=0092-Moroso local-port=999 src-address=192.168.41.85
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0091@lineass/91/ \
    comment=0091-Moroso local-port=999 src-address=192.168.41.31
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0071@lineass/71/ \
    comment=0071-Moroso local-port=999 src-address=192.168.41.121
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0055@lineass/55/ \
    comment=0055-Moroso local-port=999 src-address=192.168.27.216
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0156@lineass/156/ \
    comment=0156-Moroso local-port=999 src-address=192.168.27.209
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0112@lineass/112/ \
    comment=0112-Moroso local-port=999 src-address=192.168.27.157
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0459@lineass/459/ \
    comment=0459-Aviso local-port=999 src-address=192.168.27.234
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0419@lineass/419/ \
    comment=0419-Aviso local-port=999 src-address=192.168.27.218
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0186@lineass/186/ \
    comment=0186-Moroso local-port=999 src-address=192.168.27.109
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0419@lineass/419/ \
    comment=0419-Moroso local-port=999 src-address=192.168.27.218
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0420@lineass/420/ \
    comment=0420-Moroso local-port=999 src-address=192.168.27.220
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0327@lineass/327/ \
    comment=0327-Moroso local-port=999 src-address=192.168.27.177
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0427@lineass/427/ \
    comment=0427-Moroso local-port=999 src-address=192.168.27.223
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0494@lineass/494/ \
    comment=0494-Aviso local-port=999 src-address=192.168.63.208
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0459@lineass/459/ \
    comment=0459-Aviso local-port=999 src-address=192.168.27.234
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0059@lineass/59/ \
    comment=0059-Aviso local-port=999 src-address=192.168.27.52
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0021@lineass/21/ \
    comment=0021-Aviso local-port=999 src-address=192.168.27.96
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0442@lineass/442/ \
    comment=0442-Moroso local-port=999 src-address=192.168.27.230
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0313@lineass/313/ \
    comment=0313-Moroso local-port=999 src-address=192.168.27.165
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0234@lineass/234/ \
    comment=0232-Moroso local-port=999 src-address=192.168.27.135
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0221@lineass/221/ \
    comment=0221-Moroso local-port=999 src-address=192.168.27.123
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0216@lineass/216/ \
    comment=0216-Moroso local-port=999 src-address=192.168.27.122
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0189@lineass/189/ \
    comment=0189-Moroso local-port=999 src-address=192.168.27.110
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0114@lineass/114/ \
    comment=0114-Moroso local-port=999 src-address=192.168.27.200
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0107@lineass/107/ \
    comment=0107-Moroso local-port=999 src-address=192.168.27.221
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0059@lineass/59/ \
    comment=0059-Moroso local-port=999 src-address=192.168.27.52
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0045@lineass/45/ \
    comment=0045-Moroso local-port=999 src-address=192.168.27.92
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0043@lineass/43/ \
    comment=0043-Moroso local-port=999 src-address=192.168.27.168
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0021@lineass/21/ \
    comment=0021-Moroso local-port=999 src-address=192.168.27.96
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0008@lineass/8/ \
    comment=0008-Moroso local-port=999 src-address=192.168.27.199
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0441@lineass/441/ \
    comment=0441-Moroso local-port=999 src-address=192.168.28.110
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0214@lineass/214/ \
    comment=0214-Moroso local-port=999 src-address=192.168.28.80
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0186@lineass/186/ \
    comment=0186-Moroso local-port=999 src-address=192.168.28.74
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0441@lineass/441/ \
    comment=0441-Moroso local-port=999 src-address=192.168.28.110
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0429@lineass/429/ \
    comment=0429-Moroso local-port=999 src-address=192.168.27.224
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0427@lineass/427/ \
    comment=0427-Moroso local-port=999 src-address=192.168.27.94
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0420@lineass/420/ \
    comment=0420-Moroso local-port=999 src-address=192.168.27.92
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0419@lineass/419/ \
    comment=0419-Moroso local-port=999 src-address=192.168.28.121
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0418@lineass/418/ \
    comment=0418-Moroso local-port=999 src-address=192.168.27.90
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0417@lineass/417/ \
    comment=0417-Moroso local-port=999 src-address=192.168.27.75
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0381@lineass/381/ \
    comment=0381-Moroso local-port=999 src-address=192.168.27.132
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0355@lineass/355/ \
    comment=0355-Moroso local-port=999 src-address=192.168.27.194
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0291@lineass/291/ \
    comment=0291-Moroso local-port=999 src-address=192.168.27.152
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0214@lineass/214/ \
    comment=0214-Moroso local-port=999 src-address=192.168.28.80
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0186@lineass/186/ \
    comment=0186-Moroso local-port=999 src-address=192.168.28.74
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0043@lineass/43/ \
    comment=0043-Moroso local-port=999 src-address=192.168.27.81
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0021@lineass/21/ \
    comment=0021-Moroso local-port=999 src-address=192.168.27.96
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0494@lineass/494/ \
    comment=0494-Aviso local-port=999 src-address=192.168.63.208
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0488@lineass/488/ \
    comment=0488-Aviso local-port=999 src-address=192.168.27.248
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0486@lineass/486/ \
    comment=0486-Aviso local-port=999 src-address=192.168.27.247
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0485@lineass/485/ \
    comment=0485-Aviso local-port=999 src-address=192.168.27.245
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0482@lineass/482/ \
    comment=0482-Aviso local-port=999 src-address=192.168.27.244
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0481@lineass/481/ \
    comment=0481-Aviso local-port=999 src-address=192.168.27.243
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0479@lineass/479/ \
    comment=0479-Aviso local-port=999 src-address=192.168.27.241
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0476@lineass/476/ \
    comment=0476-Aviso local-port=999 src-address=192.168.27.239
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0475@lineass/475/ \
    comment=0475-Aviso local-port=999 src-address=192.168.27.238
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0459@lineass/459/ \
    comment=0459-Aviso local-port=999 src-address=192.168.27.234
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0444@lineass/444/ \
    comment=0444-Aviso local-port=999 src-address=192.168.27.231
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0438@lineass/438/ \
    comment=0438-Aviso local-port=999 src-address=192.168.27.227
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0415@lineass/415/ \
    comment=0415-Aviso local-port=999 src-address=192.168.27.215
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0400@lineass/400/ \
    comment=0400-Aviso local-port=999 src-address=192.168.27.212
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0378@lineass/378/ \
    comment=0378-Aviso local-port=999 src-address=192.168.27.202
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0356@lineass/356/ \
    comment=0356-Aviso local-port=999 src-address=192.168.27.219
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0349@lineass/349/ \
    comment=0349-Aviso local-port=999 src-address=192.168.27.192
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0326@lineass/326/ \
    comment=0326-Aviso local-port=999 src-address=192.168.27.185
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0323@lineass/323/ \
    comment=0323-Aviso local-port=999 src-address=192.168.27.176
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0319@lineass/319/ \
    comment=0319-Aviso local-port=999 src-address=192.168.27.173
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0318@lineass/318/ \
    comment=0318-Aviso local-port=999 src-address=192.168.27.172
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0314@lineass/314/ \
    comment=0314-Aviso local-port=999 src-address=192.168.27.162
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0302@lineass/302/ \
    comment=0302-Aviso local-port=999 src-address=192.168.27.156
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0242@lineass/242/ \
    comment=0242-Aviso local-port=999 src-address=192.168.27.205
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0241@lineass/241/ \
    comment=0241-Aviso local-port=999 src-address=192.168.27.151
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0226@lineass/226/ \
    comment=0226-Aviso local-port=999 src-address=192.168.27.124
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0213@lineass/213/ \
    comment=0213-Aviso local-port=999 src-address=192.168.27.120
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0205@lineass/205/ \
    comment=0205-Aviso local-port=999 src-address=192.168.27.134
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0204@lineass/204/ \
    comment=0204-Aviso local-port=999 src-address=192.168.27.118
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0200@lineass/200/ \
    comment=0200-Aviso local-port=999 src-address=192.168.27.115
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0194@lineass/194/ \
    comment=0194-Aviso local-port=999 src-address=192.168.27.113
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0192@lineass/192/ \
    comment=0192-Aviso local-port=999 src-address=192.168.27.112
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0098@lineass/98/ \
    comment=0098-Aviso local-port=999 src-address=192.168.27.141
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0063@lineass/63/ \
    comment=0063-Aviso local-port=999 src-address=192.168.27.240
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0061@lineass/61/ \
    comment=0061-Aviso local-port=999 src-address=192.168.27.154
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0054@lineass/54/ \
    comment=0054-Aviso local-port=999 src-address=192.168.27.169
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0039@lineass/39/ \
    comment=0039-Aviso local-port=999 src-address=192.168.27.167
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0019@lineass/19/ \
    comment=0019-Aviso local-port=999 src-address=192.168.27.144
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0018@lineass/18/ \
    comment=0018-Aviso local-port=999 src-address=192.168.27.133
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0014@lineass/14/ \
    comment=0014-Aviso local-port=999 src-address=192.168.27.82
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0168@lineass/168/ \
    comment=0168-Moroso local-port=999 src-address=192.168.27.142
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0494@lineass/494/ \
    comment=0494-Moroso local-port=999 src-address=192.168.63.208
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0485@lineass/485/ \
    comment=0485-Moroso local-port=999 src-address=192.168.27.245
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0482@lineass/482/ \
    comment=0482-Moroso local-port=999 src-address=192.168.27.244
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0481@lineass/481/ \
    comment=0481-Moroso local-port=999 src-address=192.168.27.243
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0459@lineass/459/ \
    comment=0459-Moroso local-port=999 src-address=192.168.27.234
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0438@lineass/438/ \
    comment=0438-Moroso local-port=999 src-address=192.168.27.227
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0415@lineass/415/ \
    comment=0415-Moroso local-port=999 src-address=192.168.27.215
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0400@lineass/400/ \
    comment=0400-Moroso local-port=999 src-address=192.168.27.212
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0378@lineass/378/ \
    comment=0378-Moroso local-port=999 src-address=192.168.27.202
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0283@lineass/283/ \
    comment=0283-Moroso local-port=999 src-address=192.168.27.131
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0242@lineass/242/ \
    comment=0242-Moroso local-port=999 src-address=192.168.27.205
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0205@lineass/205/ \
    comment=0205-Moroso local-port=999 src-address=192.168.27.134
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0204@lineass/204/ \
    comment=0204-Moroso local-port=999 src-address=192.168.27.118
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0200@lineass/200/ \
    comment=0200-Moroso local-port=999 src-address=192.168.27.115
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0098@lineass/98/ \
    comment=0098-Moroso local-port=999 src-address=192.168.27.141
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0063@lineass/63/ \
    comment=0063-Moroso local-port=999 src-address=192.168.27.240
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0061@lineass/61/ \
    comment=0061-Moroso local-port=999 src-address=192.168.27.154
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0319@lineass/319/ \
    comment=0319-Aviso local-port=999 src-address=192.168.27.82
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0097@lineass/97/ \
    comment=0097-Aviso local-port=999 src-address=192.168.28.70
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0097@lineass/97/ \
    comment=0097-Moroso local-port=999 src-address=192.168.28.70
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0490@lineass/490/ \
    comment=0490-Aviso local-port=999 src-address=192.168.27.251
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0448@lineass/448/ \
    comment=0448-Aviso local-port=999 src-address=192.168.27.222
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0436@lineass/436/ \
    comment=0436-Aviso local-port=999 src-address=192.168.27.236
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0433@lineass/433/ \
    comment=0433-Aviso local-port=999 src-address=192.168.27.95
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0410@lineass/410/ \
    comment=0410-Aviso local-port=999 src-address=192.168.27.2
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0339@lineass/339/ \
    comment=0339-Aviso local-port=999 src-address=192.168.27.85
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0319@lineass/319/ \
    comment=0319-Aviso local-port=999 src-address=192.168.27.82
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0060@lineass/60/ \
    comment=0060-Aviso local-port=999 src-address=192.168.27.191
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0410@lineass/410/ \
    comment=0410-Moroso local-port=999 src-address=192.168.27.2
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0156@lineass/156/ \
    comment=0156-Moroso local-port=999 src-address=192.168.28.105
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0414@lineass/414/ \
    comment=0414-Moroso local-port=999 src-address=192.168.27.214
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0498@lineass/498/ \
    comment=0498-Aviso local-port=999 src-address=192.168.28.119
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0490@lineass/490/ \
    comment=0490-Aviso local-port=999 src-address=192.168.27.251
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0488@lineass/488/ \
    comment=0488-Aviso local-port=999 src-address=192.168.27.102
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0485@lineass/485/ \
    comment=0485-Aviso local-port=999 src-address=192.168.27.99
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0459@lineass/459/ \
    comment=0459-Aviso local-port=999 src-address=192.168.27.105
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0448@lineass/448/ \
    comment=0448-Aviso local-port=999 src-address=192.168.27.222
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0436@lineass/436/ \
    comment=0436-Aviso local-port=999 src-address=192.168.27.236
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0433@lineass/433/ \
    comment=0433-Aviso local-port=999 src-address=192.168.27.95
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0392@lineass/392/ \
    comment=0392-Aviso local-port=999 src-address=192.168.28.107
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0372@lineass/372/ \
    comment=0372-Aviso local-port=999 src-address=192.168.27.89
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0349@lineass/349/ \
    comment=0349-Aviso local-port=999 src-address=192.168.27.87
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0339@lineass/339/ \
    comment=0339-Aviso local-port=999 src-address=192.168.27.85
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0326@lineass/326/ \
    comment=0326-Aviso local-port=999 src-address=192.168.27.84
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0323@lineass/323/ \
    comment=0323-Aviso local-port=999 src-address=192.168.28.98
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0319@lineass/319/ \
    comment=0319-Aviso local-port=999 src-address=192.168.27.82
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0230@lineass/230/ \
    comment=0230-Aviso local-port=999 src-address=192.168.27.69
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0227@lineass/227/ \
    comment=0227-Aviso local-port=999 src-address=192.168.28.90
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0210@lineass/210/ \
    comment=0210-Aviso local-port=999 src-address=192.168.28.78
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0192@lineass/192/ \
    comment=0192-Aviso local-port=999 src-address=192.168.27.63
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0085@lineass/85/ \
    comment=0085-Aviso local-port=999 src-address=192.168.27.155
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0063@lineass/63/ \
    comment=0063-Aviso local-port=999 src-address=192.168.28.113
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0060@lineass/60/ \
    comment=0060-Aviso local-port=999 src-address=192.168.27.191
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0058@lineass/58/ \
    comment=0058-Aviso local-port=999 src-address=192.168.21.220
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0041@lineass/41/ \
    comment=0041-Aviso local-port=999 src-address=192.168.27.59
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0035@lineass/35/ \
    comment=0035-Aviso local-port=999 src-address=192.168.28.69
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0027@lineass/27/ \
    comment=0027-Aviso local-port=999 src-address=192.168.28.52
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0024@lineass/24/ \
    comment=0024-Aviso local-port=999 src-address=192.168.27.56
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0020@lineass/20/ \
    comment=0020-Aviso local-port=999 src-address=192.168.27.60
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0242@lineass/242/ \
    comment=0242-Moroso local-port=999 src-address=192.168.28.104
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0448@lineass/448/ \
    comment=0448-Moroso local-port=999 src-address=192.168.27.222
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0436@lineass/436/ \
    comment=0436-Moroso local-port=999 src-address=192.168.27.236
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0433@lineass/433/ \
    comment=0433-Moroso local-port=999 src-address=192.168.27.95
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0362@lineass/362/ \
    comment=0362-Moroso local-port=999 src-address=192.168.27.88
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0058@lineass/58/ \
    comment=0058-Moroso local-port=999 src-address=192.168.21.220
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0035@lineass/35/ \
    comment=0035-Moroso local-port=999 src-address=192.168.28.69
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0014@lineass/14/ \
    comment=0014-Moroso local-port=999 src-address=192.168.27.57
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0054@lineass/54/ \
    comment=0054-Aviso local-port=999 src-address=192.168.28.96
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/0054@lineass/54/ \
    comment=0054-Aviso local-port=999 src-address=192.168.28.96
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-corte/0054@lineass/54/ \
    comment=0054-Moroso local-port=999 src-address=192.168.28.96
add action=redirect action-data=\
    clientes.portalinternet.net/landing/lineass/aviso-pago/10072@lineass/622/ \
    comment=10072-Aviso local-port=999 src-address=10.10.0.72
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10072@lineass/622/" comment=10072-Moroso local-port=999 \
    src-address=10.10.0.72
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10026@lineass/544/" comment=10026-Moroso local-port=999 \
    src-address=10.10.0.26
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10059@lineass/608/" comment=10059-Moroso local-port=999 \
    src-address=10.10.0.59
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10091@lineass/645/" comment=10091-Moroso local-port=999 \
    src-address=10.10.0.91
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10018@lineass/537/" comment=10018-Moroso local-port=999 \
    src-address=10.10.0.18
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10079@lineass/629/" comment=10079-Moroso local-port=999 \
    src-address=10.10.0.79
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10126@lineass/687/" comment=10126-Moroso local-port=999 \
    src-address=10.10.0.126
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10113@lineass/669/" comment=10113-Moroso local-port=999 \
    src-address=10.10.0.113
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10101@lineass/656/" comment=10101-Moroso local-port=999 \
    src-address=10.10.0.101
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10011@lineass/530/" comment=10011-Moroso local-port=999 \
    src-address=10.10.0.11
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10132@lineass/697/" comment=10132-Moroso local-port=999 \
    src-address=10.10.0.132
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10121@lineass/676/" comment=10121-Moroso local-port=999 \
    src-address=10.10.0.121
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/prueba@lineass/519/" comment=prueba1-Moroso local-port=999 \
    src-address=10.10.0.1
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10135@lineass/703/" comment=10135-Moroso local-port=999 \
    src-address=10.10.0.135
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10122@lineass/677/" comment=10122-Moroso local-port=999 \
    src-address=10.10.0.122
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10110@lineass/666/" comment=10110-Moroso local-port=999 \
    src-address=10.10.0.110
add action=redirect action-data="clientes.portalinternet.net/landing/lineass/a\
    viso-corte/10109@lineass/665/" comment=10109-Moroso local-port=999 \
    src-address=10.10.0.109
/ip route
add disabled=no dst-address=0.0.0.0/0 gateway=45.239.49.232
add disabled=no distance=1 dst-address=172.26.191.0/24 gateway=WisphubVPN \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10
add distance=1 dst-address=10.134.0.0/16 gateway=WisphubVPN routing-table=\
    wisphub
add distance=1 dst-address=172.20.63.0/24 gateway=AdminOLTVPN
add distance=1 dst-address=172.31.228.0/24 gateway=AdminOLTVPN routing-table=\
    adminolt
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www address=192.168.0.0/16,10.0.0.0/8,172.16.0.0/12 port=8090
set ssh disabled=yes
set api address=172.26.160.0/19,10.134.0.0/16
/ip smb shares
set [ find default=yes ] directory=/pub
/ppp secret
add name=soportelineass profile=profileVPN service=pptp
add comment="Maria Blanca Morales Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10001 remote-address=10.10.0.3 service=pppoe
add comment="Jose Jason Morales Morales" local-address=10.10.10.1 name=10002 \
    remote-address=10.10.0.4 service=pppoe
add comment="Luis Alberto Males Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10005 remote-address=10.10.0.5 service=pppoe
add comment="Luz Maria Potosi Males" local-address=10.10.10.1 name=10004 \
    remote-address=10.10.0.2 service=pppoe
add comment=10006 local-address=10.10.10.1 name=10006 remote-address=\
    10.10.0.6 service=pppoe
add comment="German Sinchico Morales" local-address=10.10.10.1 name=10007 \
    remote-address=10.10.0.7 service=pppoe
add comment="Ernesto Sinchico Arias" local-address=10.10.10.1 name=10008 \
    remote-address=10.10.0.8 service=pppoe
add comment="Maria Mercedes Santellan Ascanta" local-address=10.10.10.1 name=\
    10009 remote-address=10.10.0.9 service=pppoe
add comment="Maria Elena Amagua\C3\B1a Flores" local-address=10.10.10.1 name=\
    10010 remote-address=10.10.0.10 service=pppoe
add comment="Males Arias Tamya Marisol" local-address=10.10.10.1 name=10011 \
    remote-address=10.10.0.11 service=pppoe
add comment="Jaime Atanacio Cando Ca\C3\B1amar" local-address=10.10.10.1 \
    name=10012 remote-address=10.10.0.12 service=pppoe
add comment="Klever Lisandro Sinchico Morales" local-address=10.10.10.1 name=\
    10013 remote-address=10.10.0.13 service=pppoe
add comment="Ana Gabriela Casta\C3\B1eda Ascanta" local-address=10.10.10.1 \
    name=10014 remote-address=10.10.0.14 service=pppoe
add comment="Luis Enrique Padilla Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10015 remote-address=10.10.0.15 service=pppoe
add comment=10016 local-address=10.10.10.1 name=10016 remote-address=\
    10.10.0.16 service=pppoe
add comment="Marco Antonio Casta\C3\B1eda Morales" local-address=10.10.10.1 \
    name=10017 remote-address=10.10.0.17 service=pppoe
add comment=10018 local-address=10.10.10.1 name=10018 remote-address=\
    10.10.0.18 service=pppoe
add comment=10019 local-address=10.10.10.1 name=10019 remote-address=\
    10.10.0.19 service=pppoe
add comment="Nelson Eduardo Arias Cepeda" local-address=10.10.10.1 name=10020 \
    remote-address=10.10.0.20 service=pppoe
add comment="RICHARD JAVIER CASTA\C3\91EDA CA\C3\91AMAR" local-address=\
    10.10.10.1 name=10021 remote-address=10.10.0.21 service=pppoe
add comment="CAMUENDO CAMUENDO JOSE RAFAEL" local-address=10.10.10.1 name=\
    10022 remote-address=10.10.0.22 service=pppoe
add comment="Jhon Alex Cisneros Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10023 remote-address=10.10.0.23 service=pppoe
add comment="Luis Oswaldo Males Cando" local-address=10.10.10.1 name=10024 \
    remote-address=10.10.0.24 service=pppoe
add comment="Benito Anrango Anrango" local-address=10.10.10.1 name=10026 \
    remote-address=10.10.0.26 service=pppoe
add comment=10027 local-address=10.10.10.1 name=10027 remote-address=\
    10.10.0.27 service=pppoe
add comment="Luis Humberto Males Males" local-address=10.10.10.1 name=10028 \
    remote-address=10.10.0.28 service=pppoe
add comment="Luz Mila Ascanta Maldonado" local-address=10.10.10.1 name=10029 \
    remote-address=10.10.0.29 service=pppoe
add comment="Maria Yolanda Casta\C3\B1eda Morales 2" local-address=10.10.10.1 \
    name=10030 remote-address=10.10.0.30 service=pppoe
add comment="Wilian Edison Ascanta Cepeda" local-address=10.10.10.1 name=\
    10031 remote-address=10.10.0.31 service=pppoe
add comment="Maria Fabiola" local-address=10.10.10.1 name=10032 \
    remote-address=10.10.0.32 service=pppoe
add comment="Norma Veronica Cando Ascanta" local-address=10.10.10.1 name=\
    10033 remote-address=10.10.0.33 service=pppoe
add comment="Bertha Eulalia Cepeda Ascanta" local-address=10.10.10.1 name=\
    10034 remote-address=10.10.0.34 service=pppoe
add comment="Alicia Ascanta Morales" local-address=10.10.10.1 name=10035 \
    remote-address=10.10.0.35 service=pppoe
add comment=10036 local-address=10.10.10.1 name=10036 remote-address=\
    10.10.0.36 service=pppoe
add comment=10037 local-address=10.10.10.1 name=10037 remote-address=\
    10.10.0.37 service=pppoe
add comment="Edwin Jovany Cepeda Ascanta" local-address=10.10.10.1 name=10038 \
    remote-address=10.10.0.38 service=pppoe
add comment="Luis Alfonso Villagran Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10039 remote-address=10.10.0.39 service=pppoe
add comment="Mirian del Carmen Catucuamba Chiza" local-address=10.10.10.1 \
    name=10040 remote-address=10.10.0.40 service=pppoe
add comment="Jose Aurelio Males Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10041 remote-address=10.10.0.41 service=pppoe
add comment="Julio Cesar Males Maldonado" local-address=10.10.10.1 name=10042 \
    remote-address=10.10.0.42 service=pppoe
add comment="Maria Fabiola Padilla Cando" local-address=10.10.10.1 name=10043 \
    remote-address=10.10.0.43 service=pppoe
add comment="Mariela Estefania Remache Morales" local-address=10.10.10.1 \
    name=10044 remote-address=10.10.0.44 service=pppoe
add comment="Ana Lucia Morales Males" local-address=10.10.10.1 name=10045 \
    remote-address=10.10.0.45 service=pppoe
add comment="Maria Mercedes Morales Morales" local-address=10.10.10.1 name=\
    10046 remote-address=10.10.0.46 service=pppoe
add comment="Rafael Morales Casta\C3\B1eda" local-address=10.10.10.1 name=\
    10047 remote-address=10.10.0.47 service=pppoe
add comment="Ana Beatriz Cando Males" local-address=10.10.10.1 name=10048 \
    remote-address=10.10.0.48 service=pppoe
add comment="Segundo Morales Morales" local-address=10.10.10.1 name=10049 \
    remote-address=10.10.0.49 service=pppoe
add comment="Maria Elena Cando Salazar" local-address=10.10.10.1 name=10050 \
    remote-address=10.10.0.50 service=pppoe
add comment="Luis Antonio Casta\C3\B1eda Casta\C3\B1eda" local-address=\
    10.10.10.1 name=10051 remote-address=10.10.0.51 service=pppoe
add comment="Luis Humberto Flores Morales" local-address=10.10.10.1 name=\
    10052 remote-address=10.10.0.52 service=pppoe
add comment="Luis Orlando Burga Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10053 remote-address=10.10.0.53 service=pppoe
add comment="RAFAEL CAMUENDO CAMUENDO" local-address=10.10.10.1 name=10054 \
    remote-address=10.10.0.54 service=pppoe
add comment="Ana Beatriz Males Cando" local-address=10.10.10.1 name=10055 \
    remote-address=10.10.0.55 service=pppoe
add comment="Maria Rebeca Cachiguango" local-address=10.10.10.1 name=10056 \
    remote-address=10.10.0.56 service=pppoe
add comment="Luis Jaime Casta\C3\B1eda Cepeda" local-address=10.10.10.1 name=\
    10057 remote-address=10.10.0.57 service=pppoe
add comment="Segundo Cordova" local-address=10.10.10.1 name=10058 \
    remote-address=10.10.0.58 service=pppoe
add comment="Jose Jaime Casta\C3\B1eda Potosi" local-address=10.10.10.1 name=\
    10059 remote-address=10.10.0.59 service=pppoe
add comment="Rosa Maria Cando Casta\C3\B1eda" local-address=10.10.10.1 name=\
    10060 remote-address=10.10.0.60 service=pppoe
add comment="Nohem\C3\AD Maribel Tocagon Casta\C3\B1eda" local-address=\
    10.10.10.1 name=10061 remote-address=10.10.0.61 service=pppoe
add comment="Jessica Alexandra Males Cando" local-address=10.10.10.1 name=\
    10062 remote-address=10.10.0.62 service=pppoe
add comment="Segundo Cepeda Camuendo" local-address=10.10.10.1 name=10063 \
    remote-address=10.10.0.63 service=pppoe
add comment="Susana Loza Casta\C3\B1eda" local-address=10.10.10.1 name=10064 \
    remote-address=10.10.0.64 service=pppoe
add comment="Luis Alfonso Sinchico Arias" local-address=10.10.10.1 name=10066 \
    remote-address=10.10.0.66 service=pppoe
add comment="Ernesto Sinchico Arias" local-address=10.10.10.1 name=10067 \
    remote-address=10.10.0.67 service=pppoe
add comment="Maria Esthela Cando Ca\C3\B1amar" local-address=10.10.10.1 name=\
    10068 remote-address=10.10.0.68 service=pppoe
add comment="Blanca Jenny Padilla Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10069 remote-address=10.10.0.69 service=pppoe
add comment="Aurelio Flores Casta\C3\B1eda" local-address=10.10.10.1 name=\
    10070 remote-address=10.10.0.70 service=pppoe
add comment="Luz Maria Camuendo Males" local-address=10.10.10.1 name=10071 \
    remote-address=10.10.0.71 service=pppoe
add comment="Jaime Orlando Casta\C3\B1eda Casta\C3\B1eda" local-address=\
    10.10.10.1 name=10072 remote-address=10.10.0.72 service=pppoe
add comment="NODO ROSA ELENA" local-address=10.10.10.1 name=10073 \
    remote-address=10.10.0.73 service=pppoe
add comment="Francisco Casta\C3\B1eda Casta\C3\B1eda" local-address=\
    10.10.10.1 name=10074 remote-address=10.10.0.74 service=pppoe
add comment="Jose Rafael Padilla Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10075 remote-address=10.10.0.75 service=pppoe
add comment="Jose Isama Vasquez" local-address=10.10.10.1 name=10076 \
    remote-address=10.10.0.76 service=pppoe
add comment="Jaime Flores Morales" local-address=10.10.10.1 name=10077 \
    remote-address=10.10.0.77 service=pppoe
add comment=10079 local-address=10.10.10.1 name=10079 remote-address=\
    10.10.0.79 service=pppoe
add comment="Marco Antonio Morales Padilla" local-address=10.10.10.1 name=\
    10078 remote-address=10.10.0.78 service=pppoe
add comment="Maria Ermelinda Perugachi Yacelga" local-address=10.10.10.1 \
    name=10080 remote-address=10.10.0.80 service=pppoe
add comment="Jos\C3\A9 Carlos Lutoala Oto" local-address=10.10.10.1 name=\
    10081 remote-address=10.10.0.81 service=pppoe
add comment="Jessica Maribel Cepeda Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10082 remote-address=10.10.0.82 service=pppoe
add comment="Jennifer Jazmin Chuscagua Cabascango" local-address=10.10.10.1 \
    name=10083 remote-address=10.10.0.83 service=pppoe
add comment="Luis Humberto Guerrero Arias" local-address=10.10.10.1 name=\
    10084 remote-address=10.10.0.84 service=pppoe
add comment="Ana Lucia Guerrero Arias" local-address=10.10.10.1 name=10086 \
    remote-address=10.10.0.86 service=pppoe
add comment="Maria Elene Perugachi Panama" local-address=10.10.10.1 name=\
    10087 remote-address=10.10.0.87 service=pppoe
add comment="Jessica Tatiana Arias Santillan" local-address=10.10.10.1 name=\
    10088 remote-address=10.10.0.88 service=pppoe
add comment="Jose Roberto Morales Cando" local-address=10.10.10.1 name=10089 \
    remote-address=10.10.0.89 service=pppoe
add comment="Milton Rodrigo Flores Casta\C3\B1eda" local-address=10.10.0.1 \
    name=10090 remote-address=10.10.0.90 service=pppoe
add comment="Edwin Giovanny Maldonado Morales" local-address=10.10.10.1 name=\
    10091 remote-address=10.10.0.91 service=pppoe
add comment="Maria Martha Farinango Morales" local-address=10.10.0.1 name=\
    10092 remote-address=10.10.0.92 service=pppoe
add comment="Maria Arias Cando" local-address=10.10.0.1 name=10093 \
    remote-address=10.10.0.93 service=pppoe
add comment="Mar\C3\ADa Arias Cando" local-address=10.10.0.1 name=10094 \
    remote-address=10.10.0.94 service=pppoe
add comment="Rosa Elena Morales Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10095 remote-address=10.10.0.95 service=pppoe
add comment="Jeison David Ramos Santillan" local-address=10.10.0.1 name=10096 \
    remote-address=10.10.0.96 service=pppoe
add comment="Maria Dolores Guajan Maldonado" local-address=10.10.10.1 name=\
    10097 remote-address=10.10.0.97 service=pppoe
add comment="Jose Rafael Casta\C3\B1eda Males" local-address=10.10.10.1 name=\
    10098 remote-address=10.10.0.98 service=pppoe
add comment="Jose Miguel Conejo Maldonado" local-address=10.10.10.1 name=\
    10099 remote-address=10.10.0.99 service=pppoe
add comment="Nataly Samanta Camuendo Farinango" local-address=10.10.10.1 \
    name=10100 remote-address=10.10.0.100 service=pppoe
add comment="Mar\C3\ADa Dolores Remache Morales" local-address=10.10.10.1 \
    name=10101 remote-address=10.10.0.101 service=pppoe
add comment="Luis Fabi\C3\A1n Cando Salaza" local-address=10.10.10.1 name=\
    10102 remote-address=10.10.0.102 service=pppoe
add comment="Jos\C3\A9 Rafael Potosi Males" local-address=10.10.10.1 name=\
    10103 remote-address=10.10.0.103 service=pppoe
add comment="Mar\C3\ADa Dolores Remache Morales" local-address=10.10.10.1 \
    name=10105 remote-address=10.10.0.104 service=pppoe
add comment="Jorge Luis Casta\C3\B1eda Remache" local-address=10.10.10.1 \
    name=10106 remote-address=10.10.0.106 service=pppoe
add comment="Cristian Mauricio Maldonado Flores" local-address=10.10.10.1 \
    name=10107 remote-address=10.10.0.107 service=pppoe
add comment="Jos\C3\A9 Luis Enrique Amagua\C3\B1a Ascanta" local-address=\
    10.10.10.1 name=10108 remote-address=10.10.0.108 service=pppoe
add comment="steveen potosi cushcagua" local-address=10.10.10.1 name=10109 \
    remote-address=10.10.0.109 service=pppoe
add comment="Ana Cecilia Aras Aluis" local-address=10.10.10.1 name=10110 \
    remote-address=10.10.0.110 service=pppoe
add comment="Janeth Liliana Isama Cahuasqui" local-address=10.10.10.1 name=\
    10111 remote-address=10.10.0.111 service=pppoe
add comment="Charly Lanchimba" local-address=10.10.10.1 name=10112 \
    remote-address=10.10.0.112 service=pppoe
add comment="Luis Morales Cepeda" local-address=10.10.10.1 name=10113 \
    remote-address=10.10.0.113 service=pppoe
add comment="Comunidad La Compa\C3\B1ia" local-address=10.10.0.1 name=10114 \
    remote-address=10.10.0.114 service=pppoe
add comment="Gonzalo Javier Cando Padilla" local-address=10.10.10.1 name=\
    10115 remote-address=10.10.0.115 service=pppoe
add comment="Mirian Janneth Bonilla Males" local-address=10.10.0.1 name=10118 \
    remote-address=10.10.0.118 service=pppoe
add comment="Luz Maria Remache Padilla" local-address=10.10.10.1 name=10119 \
    remote-address=10.10.0.119 service=pppoe
add comment="Jose Rafael Ajala Remache" local-address=10.10.10.1 name=10120 \
    remote-address=10.10.0.120 service=pppoe
add comment="Jhon Tocachi Espinoza" local-address=10.10.10.1 name=10121 \
    remote-address=10.10.0.121 service=pppoe
add comment="Mar\C3\ADa Rosario Cando Casta\C3\B1eda" local-address=\
    10.10.10.1 name=10122 remote-address=10.10.0.122 service=pppoe
add comment="Jose Fausto Males Casta\C3\B1eda" local-address=10.10.10.1 name=\
    10123 remote-address=10.10.0.123 service=pppoe
add comment="Segundo Cando Cando" local-address=10.10.10.1 name=10124 \
    remote-address=10.10.0.124 service=pppoe
add comment="Luis Alberto Trav\C3\A9s Mendoza" local-address=10.10.10.1 name=\
    10125 remote-address=10.10.0.125 service=pppoe
add comment=10126 local-address=10.10.10.1 name=10126 remote-address=\
    10.10.0.126 service=pppoe
add comment="Elena Arias Aluisa" local-address=10.10.0.1 name=10127 \
    remote-address=10.10.0.127 service=pppoe
add comment="Raul Salazar Anrango" local-address=10.10.10.1 name=10128 \
    remote-address=10.10.0.128 service=pppoe
add comment=10129 local-address=10.10.10.1 name=10129 remote-address=\
    10.10.0.129 service=pppoe
add comment=10130 local-address=10.10.10.1 name=10130 remote-address=\
    10.10.0.130 service=pppoe
add comment="Mar\C3\ADa Luzmila Males Cando" local-address=10.10.10.1 name=\
    10131 remote-address=10.10.0.131 service=pppoe
add comment="Luis Richar Camuendo Sinchico" local-address=10.10.0.1 name=\
    10132 remote-address=10.10.0.132 service=pppoe
add comment="Wilmer Orlando Quishpe Lushpa" local-address=10.10.0.1 name=\
    10133 remote-address=10.10.0.133 service=pppoe
add comment="Wilson Casta\C3\B1eda Flores" local-address=10.10.10.1 name=\
    10134 remote-address=10.10.0.134 service=pppoe
add comment="Jose Luis Arias Chiza" local-address=10.10.10.1 name=10135 \
    remote-address=10.10.0.135 service=pppoe
add comment="Luis Rodrigo Farinango Cando" local-address=10.10.10.1 name=\
    10136 remote-address=10.10.0.136 service=pppoe
add comment="Noemi Karina Moposita Casta\C3\B1eda" local-address=10.10.10.1 \
    name=10137 remote-address=10.10.0.137 service=pppoe
add comment="Jaime Gustavo Casta\C3\B1eda Cando" local-address=10.10.10.1 \
    name=10138 remote-address=10.10.0.138 service=pppoe
add comment="Maria Cecilia Remache Santillan" local-address=10.10.10.1 name=\
    10139 remote-address=10.10.0.139 service=pppoe
add comment="Gonzalo Santillan Males" local-address=10.10.10.1 name=10140 \
    remote-address=10.10.0.140 service=pppoe
add comment="Maria Dolores Cando Salazar" local-address=10.10.10.1 name=10141 \
    remote-address=10.10.0.141 service=pppoe
add comment="Luis Alejandro Cotacachi Maldonado 2" local-address=10.10.10.1 \
    name=10142 remote-address=10.10.0.142 service=pppoe
add comment="Mayra Vanessa Pulig Fuerez" local-address=10.10.10.1 name=10143 \
    remote-address=10.10.0.143 service=pppoe
add comment="Elsa Cristina Morales Cabascango" local-address=10.10.10.1 name=\
    10144 remote-address=10.10.0.144 service=pppoe
add comment="Nuevo Salazar" local-address=10.10.10.1 name=10145 \
    remote-address=10.10.0.145 service=pppoe
add comment="Luis Alberto Picuasi Titua\C3\B1a" local-address=10.10.0.1 name=\
    10146 remote-address=10.10.0.146 service=pppoe
add comment="Jairo Maldonado Casta\C3\B1eda" local-address=10.10.0.1 name=\
    10147 remote-address=10.10.0.147 service=pppoe
add comment="Martha Casta\C3\B1eda" local-address=10.10.10.1 name=10148 \
    remote-address=10.10.0.148 service=pppoe
add comment="Luis Javier Cachiguango Flores" local-address=10.10.0.1 name=\
    10149 remote-address=10.10.0.149 service=pppoe
add comment="Rosa Elena Camuendo Cachiguango" local-address=10.10.10.1 name=\
    10150 remote-address=10.10.0.150 service=pppoe
add comment="Alex David Remache Ascanta" local-address=10.10.10.1 name=10151 \
    remote-address=10.10.0.151 service=pppoe
add comment="Luz Clara Matango Simba 2" local-address=10.10.10.1 name=10152 \
    remote-address=10.10.0.152 service=pppoe
add comment="Luis Alberto Remache Camuendo" local-address=10.10.10.1 name=\
    10153 remote-address=10.10.0.153 service=pppoe
add comment="Juan De Dios Cabascango Cabascango" local-address=10.10.10.1 \
    name=10154 remote-address=10.10.0.154 service=pppoe
add comment="Marco Xavier Andrango Carvajal 2" local-address=10.10.10.1 name=\
    10155 remote-address=10.10.0.155 service=pppoe
add comment="Alberto Morales Cabascango" local-address=10.10.10.1 name=10156 \
    remote-address=10.10.0.156 service=pppoe
add comment="Jasson Raul Anrango Males" local-address=10.10.0.1 name=10158 \
    remote-address=10.10.0.158 service=pppoe
add comment="Luis Alberto Males Aguilar" local-address=10.10.10.1 name=10159 \
    remote-address=10.10.0.159 service=pppoe
add comment="Inti Emanuel Santillan Cando" local-address=10.10.10.1 name=\
    10160 remote-address=10.10.0.160 service=pppoe
add comment="Alejandro Cabascango Padilla" local-address=10.10.10.1 name=\
    10161 remote-address=10.10.0.161 service=pppoe
add comment="Fernando Casta\C3\B1eda Arias" local-address=10.10.10.1 name=\
    10162 remote-address=10.10.0.162 service=pppoe
add comment="Jaqueline Marisol Sinchico Casta\C3\B1eda" local-address=\
    10.10.10.1 name=10163 remote-address=10.10.0.163 service=pppoe
add comment="Mar\C3\ADa Mercedes Ascanta Casta\C3\B1eda Capulis" \
    local-address=10.10.10.1 name=10164 remote-address=10.10.0.164 service=\
    pppoe
add comment="Rosa Maria Males potosi" local-address=10.10.10.1 name=10165 \
    remote-address=10.10.0.165 service=pppoe
add comment="Anahi Elizabeth Sinchico Casta\C3\B1eda" local-address=\
    10.10.10.1 name=10166 remote-address=10.10.0.166 service=pppoe
add comment="John Alex Ajala Bautista" local-address=10.10.10.167 name=10167 \
    remote-address=10.10.0.167 service=pppoe
add comment="Wilmer Roberto Morales Males" local-address=10.10.10.1 name=\
    10168 remote-address=10.10.0.168 service=pppoe
add comment="Antonio Cordova" local-address=10.10.10.1 name=10169 \
    remote-address=10.10.0.169 service=pppoe
add comment="Franci Moises Cushcagua Males" local-address=10.10.10.1 name=\
    10171 remote-address=10.10.0.171 service=pppoe
add comment="Fundaci\C3\B3n Carita de Esperanza" local-address=10.10.10.1 \
    name=10170 remote-address=10.10.0.170 service=pppoe
add comment="Liseth Melisa Maldonado Camuendo" local-address=10.10.10.1 name=\
    10172 remote-address=10.10.0.172 service=pppoe
add local-address=10.10.10.1 name=pruebahw remote-address=10.55.55.5 service=\
    pppoe
add comment="Elsa Marina Cando Males" local-address=10.10.10.1 name=10173 \
    remote-address=10.10.0.173 service=pppoe
add comment="Ushi\C3\B1a Uhi\C3\B1a" local-address=10.10.10.1 name=10174 \
    remote-address=10.10.0.174 service=pppoe
add comment="Mario Remache Males" local-address=10.10.10.1 name=10175 \
    remote-address=10.10.0.175 service=pppoe
add local-address=10.10.10.1 name=prueba2 remote-address=10.55.55.2 service=\
    pppoe
add local-address=10.10.10.1 name=prueba3 remote-address=10.55.55.3 service=\
    pppoe
add local-address=10.10.10.1 name=prueba4 remote-address=10.55.55.8 service=\
    pppoe
/routing bfd configuration
add disabled=no
/routing ospf interface-template
add area=backbone-v2 disabled=no interfaces=vlan110 networks=10.0.0.24/30 \
    priority=1
add area=backbone-v2 cost=10 disabled=no interfaces=vlan100 passive priority=\
    1
add area=backbone-v2 cost=20 disabled=no interfaces=vlan105 networks=\
    172.20.0.0/24 passive priority=1
add area=backbone-v2 cost=20 disabled=no interfaces=vlan106 networks=\
    172.20.1.0/24 passive priority=1
/routing rule
add action=lookup-only-in-table disabled=no dst-address=10.134.0.0/16 \
    src-address=172.26.224.0/19 table=wisphub
add action=lookup-only-in-table dst-address=10.134.0.0/16 src-address=\
    172.26.160.0/19 table=wisphub
add action=lookup-only-in-table dst-address=172.31.228.0/24 src-address=\
    172.20.32.0/19 table=adminolt
/system clock
set time-zone-name=America/Guayaquil
/system identity
set name="ROUTER DE BORDE"
/system note
set show-at-login=no
/system scheduler
add comment="Reiniciar Conexion WispHub" interval=1d name=\
    "Reiniciar Conexion WispHub" on-event="/interface set WisphubVPN disabled=\
    yes\r \
    \n/interface ethernet set WisphubVPN disabled=yes\r\
    \n:log info message=\"Se Deshabilita WisphubVPN\";\r\
    \n:delay 4s\r\
    \n/interface set WisphubVPN disabled=no\r\
    \n:log info message=\"Se Habilita WisphubVPN\";" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=\
    1970-11-21 start-time=05:11:00
add interval=1d name=Scheduler_deshabilitar_webproxy_wisphub on-event=\
    Script_deshabilitar_webproxy_wisphub policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2022-06-20 start-time=02:00:00
add disabled=yes interval=1d name="Reinicio 5 AM" on-event="/system reboot" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive \
    start-date=1970-10-11 start-time=05:00:00
add comment="Reiniciar Conexion AdminOLT" interval=8h name=\
    Reiniciar_Conexion_AdminOLT on-event="/interface set AdminOLTVPN disabled=\
    yes\r \
    \n/interface ethernet set AdminOLTVPN disabled=yes\r\
    \n:log info message=\"Se Deshabilita AdminOLTVPN\";\r\
    \n:delay 4s\r\
    \n/interface set AdminOLTVPN disabled=no\r\
    \n:log info message=\"Se Habilita AdminOLTVPN\";" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive start-date=\
    1970-11-21 start-time=06:00:00
/system script
add dont-require-permissions=no name=Script_deshabilitar_webproxy_wisphub \
    owner=wisphubccayho2i72flet0 policy=read,write source="{\
    \n\t#Deshabilitar_webproxy_wisphub\
    \n\t#  WispHub - Sistema de Administracion Wisp/ISP en la nube. #\
    \n\t#Contacto: wisphub@gmail.com\
    \n\t#Script que apagua el webproxy si no existen las reglas de wisphub o e\
    stan apagadas, esto para evitar ataques externos hacia su router.\
    \n\t#Si las reglas de wisphub existen en el router entoces tu webproxy est\
    a protegido de ataques externos.\
    \n\t#corre todos los dias a las 2 am\
    \n\t#Si usted usa el webproxy con otro sistema, puede eliminar este script\
    ,en /system scheduler y /system script.\
    \n\t#Si usted no usa el webproxy con sistema de corte le pedimos mantener \
    apagado el webproxy para futuros ataques.\
    \n\
    \n\t:local bloquearPuertoProxy \"WispHub - Bloquear puerto WebProxy desde \
    WANs\"\
    \n\t:local reglaBloquearPuertoProxy\
    \n\
    \n\t:local permitirWebMorosos \"WispHub - Permitir pagina web morosos\"\
    \n\t:local reglaPermitirWebMorosos\
    \n\
    \n\t:do { :set reglaBloquearPuertoProxy [/ip firewall filter get \$bloquea\
    rPuertoProxy comment ]; } on-error={ :set reglaBloquearPuertoProxy \"\"; }\
    \n\t:do { :set reglaPermitirWebMorosos [/ip firewall nat get \$permitirWeb\
    Morosos comment ]; } on-error={ :set reglaPermitirWebMorosos \"\"; }\
    \n\t:put \$reglaBloquearPuertoProxy\
    \n\t:put [:len \$reglaBloquearPuertoProxy]\
    \n\t:put \$reglaPermitirWebMorosos\
    \n\t:put [:len \$reglaPermitirWebMorosos]\
    \n\t\
    \n\t:if ( [:len \$reglaBloquearPuertoProxy] > 0 || [:len \$reglaPermitirWe\
    bMorosos] > 0 ) do={ # Si existen todas las reglas o al menos una, para de\
    spues validar si estan deshabilitadas\
    \n\
    \n\t\t:local bloquearPuertoProxyDisabled\
    \n\t\t:local permitirWebMorososDisabled\
    \n\t\t:do { :set bloquearPuertoProxyDisabled [/ip firewall filter get \$bl\
    oquearPuertoProxy disabled ]; } on-error={:set bloquearPuertoProxyDisabled\
    \_true }\
    \n\t\t:do { :set permitirWebMorososDisabled [/ip firewall nat get \$permit\
    irWebMorosos disabled ]; } on-error={:set permitirWebMorososDisabled true \
    }\
    \n\
    \n\t\t:put (\"Filter Rules: \", \$bloquearPuertoProxyDisabled)\
    \n\t\t:put (\"NAT: \", \$permitirWebMorososDisabled)\
    \n\
    \n\t\t:if ( \$bloquearPuertoProxyDisabled = true || \$permitirWebMorososDi\
    sabled = true ) do={ # Si todas las reglas estan deshabilitadas o al menos\
    \_una\
    \n\t\t\t\
    \n\t\t\t[ /ip proxy set enabled=no ]\
    \n\t\t\t:put \"Existen las reglas de WispHub. Pero estan deshabilitadas, p\
    or seguridad apagamos el webproxy.\"\
    \n\t\t\t:log info \"Existen las reglas de WispHub. Pero estan deshabilitad\
    as, por seguridad apagamos el webproxy.\"\
    \n\t\t\
    \n\t\t} else={ # Si existen todas las reglas y estan activas\
    \n\t\t\t:put \"Todas las reglas de seguridad WebProxy de WispHub funcionan\
    do :)\"\
    \n\t\t\t:log info \"Todas las reglas de seguridad WebProxy de WispHub func\
    ionando :)\"\
    \n\t\t}\
    \n\
    \n\t} else={ # Si no existe ninguna regla.\
    \n\t\t[ /ip proxy set enabled=no ]\
    \n\t\t:put \"No existen las reglas de WispHub, por seguridad apagamos el w\
    ebproxy.\"\
    \n\t\t:log info \"No existen las reglas de WispHub, por seguridad apagamos\
    \_el webproxy.\"\
    \n\t}\
    \n}"
/system watchdog
set watchdog-timer=no
/tool bandwidth-server
set authenticate=no
/tool graphing interface
add interface=ether1
add interface=ether3
add interface=combo1
