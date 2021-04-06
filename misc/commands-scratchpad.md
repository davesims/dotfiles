### A place to stash commands that I'd like to remember later

#### general network stuff

nmap -Pn 1.1.1.1
lsof -i :3000
ifconfig eth0
ifup eth0
ifdown eth0
ifconfig eth0 - promisc
traceroute 4.2.2.2

(-a is all ports, 't' and 'u' are tcp & udp)
netstat -a | more
netstat -at 
netstat -au

(-l is for all listening)
netstat -l
netstat -lt
netstat -lu

netstat -s (stats by protocol)
netstat -r (routing info)
netstat -i (interface transactions)
netstat -ie (like ifconfig)
NOTE: `ss` is better on linux: https://www.tecmint.com/ss-command-examples-in-linux/

arp -e

#### dns stuff:

dig cnn.com +short
dig cnn.com MX
dig -x 72.30.38.140 +short (reverse lookup)
host ec2-54-221-40-11.compute-1.amazonaws.com
host -t CNAME www.redhat.com (look up CNAME alias)

#### tcpdump

tcpdump -nnSX port 8983
tcpdump -nnSXv port 2181
tcpdump -nnSXv port 2181 or port 8983
tcpdump -i any -A -vvv port 2181
tcpdump -i any -A -vvv | grep 10.136.169.11
tcpdump -i [interface, en0 is ethernet, en1 is wireless]
tcpdump -i en0

#### General bash stuff
head 
wc -l
uniq

chmod: 
 - 777 — anyone can read, write and execute 
 - 755 — for files that should be readable and executable by others, but only changeable by the issuing user
 - 700 — only the user can do anything to the file

#### General docker

docker system df
docker system prune
docker run -p 8983:8983
docker-compose --force-rm   up
docker-compose up --force-rm
docker-compose build --parallel --force-rm --pull
docker-compose up --build --remove-orphans --abort-on-container-exit


