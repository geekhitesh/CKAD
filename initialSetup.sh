alias k=kubectl
alias ns='kubectl config set-context $(kubectl config current-context) --namespace '


mkdir -p /opt/course/1/ ; mkdir -p  /opt/course/2/ ; mkdir -p /opt/course/3/ ; mkdir -p /opt/course/4 ; mkdir -p /opt/course/5 ;mkdir -p /opt/course/6
mkdir -p /opt/course/7 ;mkdir -p /opt/course/8 ; mkdir -p /opt/course/9 ; mkdir -p /opt/course/10 ; mkdir -p /opt/course/11; mkdir -p /opt/course/12
mkdir -p /opt/course/13 ; mkdir -p /opt/course/14 ; mkdir -p /opt/course/15 ; mkdir -p /opt/course/16 ;mkdir -p /opt/course/17 ; mkdir -p /opt/course/18
mkdir -p /opt/course/19


k create ns  mercury ; k create ns  venus ; k create ns  earth ; k create ns  mars ; k create ns  jupiter ; k create ns  saturn
k create ns  neptune; k create ns  pluto ; k create ns sun ; k create ns moon

ns mercury
k run nginx1 --image=nginx --restart=Never -l app=v1
k run nginx2 --image=nginx --restart=Never -l app=v2

ns neptune
k create sa neptune-sa-v2
k run nginx4 --image=nginx --restart=Never -l app=v2
k run api-new-c32 --image=ngix --replicas=3
k set image deploy api-new-c32 *=ngnix:1.16.3

ns pluto
k run nginx8 --image=nginx --restart=Never -l app=v1
k run nginx9 --image=nginx --restart=Never -l app=v3
k run nginx10 --image=nginx --restart=Never -l app=v1
k run holy-api --image=nginx --restart=Never

ns saturn
k run nginx11 --image=nginx --restart=Never -l app=v1
k run nginx12 --image=nginx --restart=Never -l app=v2
k run nginx13 --image=nginx --restart=Never -l app=v2

ns sun
k run nginx1 --image=nginx --restart=Never -l type=worker
k run nginx2 --image=nginx --restart=Never -l app=v2
k run nginx3 --image=nginx --restart=Never -l type=worker
k run nginx4 --image=nginx --restart=Never -l app=v1
k run nginx5 --image=nginx --restart=Never -l type=worker
k run nginx6 --image=nginx --restart=Never -l type=messenger
k run nginx7 --image=nginx --restart=Never -l app=v1
k run nginx8 --image=nginx --restart=Never -l type=worker
k run nginx9 --image=nginx --restart=Never -l type=messenger

ns moon
k run nginx8 --image=nginx --restart=Never -l type=worker
k create secret generic Secret2 --from-literal=db=mysql --dry-run -o yaml > /opt/course/14/secret2.yaml

ns mars
k apply -f  https://raw.githubusercontent.com/geekhitesh/CKAD/master/question_17.yaml
k apply -f https://raw.githubusercontent.com/geekhitesh/CKAD/master/question_18_deployment.yaml
k apply -f https://raw.githubusercontent.com/geekhitesh/CKAD/master/question_18_service.yaml

ns venus
k run frontend --image=nginx --replicas=1 --port=80 --expose
k run api --image=nginx --replicas=1 --port=80 --expose
