alias k=kubectl
alias ns='kubectl config set-context $(kubectl config current-context) --namespace '
k create ns  mercury
k create ns  venus
k create ns  earth
k create ns  mars
k create ns  jupiter
k create ns  saturn
k create ns  neptune
k create ns  pluto

ns mercury
k run nginx1 --image=nginx --restart=Never -l app=v1
k run nginx2 --image=nginx --restart=Never -l app=v2
k run nginx3 --image=nginx --restart=Never -l app=v2
ns neptune
k run nginx4 --image=nginx --restart=Never -l app=v2
k run nginx5 --image=nginx --restart=Never -l app=v3
k run nginx6 --image=nginx --restart=Never -l app=v2
k run nginx7 --image=nginx --restart=Never -l app=v3
ns pluto
k run nginx8 --image=nginx --restart=Never -l app=v1
k run nginx9 --image=nginx --restart=Never -l app=v3
k run nginx10 --image=nginx --restart=Never -l app=v1



mkdir -p /opt/course/1/
mkdir -p  /opt/course/2/
mkdir -p /opt/course/3/
mkdir -p /opt/course/4
mkdir -p /opt/course/5
mkdir -p /opt/course/6
mkdir -p /opt/course/7
mkdir -p /opt/course/8
mkdir -p /opt/course/9
mkdir -p /opt/course/10
mkdir -p /opt/course/11
mkdir -p /opt/course/12
mkdir -p /opt/course/13
mkdir -p /opt/course/14
mkdir -p /opt/course/15
mkdir -p /opt/course/16
mkdir -p /opt/course/17
mkdir -p /opt/course/18
mkdir -p /opt/course/19

