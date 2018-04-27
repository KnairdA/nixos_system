# adapted from https://www.scc.kit.edu/scc/net/openvpn/os/debian/kit.ovpn

''
client
remote 141.52.8.20
port 1194
dev tun
proto udp
auth-user-pass
nobind
comp-lzo no
tls-version-min 1.2
ca ${./T-TeleSec_GlobalRoot_Class_2.pem}
verify-x509-name "C=DE, ST=Baden-Wuerttemberg, L=Karlsruhe, O=Karlsruhe Institute of Technology, OU=Steinbuch Centre for Computing, CN=ovpn.scc.kit.edu" subject
cipher AES-256-CBC
auth SHA384
verb 3
script-security 2
''
