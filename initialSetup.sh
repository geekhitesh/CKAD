alias k=kubectl
alias ns='kubectl config set-context $(kubectl config current-context) --namespace '

mkdir -p /opt/course/1/ ; mkdir -p  /opt/course/2/ ; mkdir -p /opt/course/3/ ; mkdir -p /opt/course/4 ; mkdir -p /opt/course/5 ;mkdir -p /opt/course/6
mkdir -p /opt/course/7 ;mkdir -p /opt/course/8 ; mkdir -p /opt/course/9 ; mkdir -p /opt/course/10 ; mkdir -p /opt/course/11; mkdir -p /opt/course/12
mkdir -p /opt/course/13 ; mkdir -p /opt/course/14 ; mkdir -p /opt/course/15 ; mkdir -p /opt/course/16 ;mkdir -p /opt/course/17 ; mkdir -p /opt/course/18
mkdir -p /opt/course/19


k create ns  mercury ; k create ns  venus ; k create ns  earth ; k create ns  mars ; k create ns  jupiter ; k create ns  saturn
k create ns  neptune; k create ns  pluto ; k create ns sun ; k create ns moon ; k create ns netcon

ns mercury
k run nginx1 --image=nginx --port=80 --restart=Never -l app=v1 --expose
k run nginx2 --image=nginx --restart=Never -l app=v2
k run busybox --image=busybox --dry-run -o yaml -- /bin/sh -c 'while true; do echo "hello" >> /opt/course/16/cleaner.log; sleep 2; done' > /opt/course/16/cleaner.yaml

ns venus
k run frontend --image=nginx --replicas=1 --port=80 --expose
k run api --image=nginx --replicas=1 --port=80 --expose

ns mars
curl https://raw.githubusercontent.com/geekhitesh/CKAD/master/question_17.yaml > /opt/course/17/test-init-container.yaml
k apply -f https://raw.githubusercontent.com/geekhitesh/CKAD/master/question_18_deployment.yaml
k apply -f https://raw.githubusercontent.com/geekhitesh/CKAD/master/question_18_service.yaml

ns saturn
k run nginx11 --image=nginx --restart=Never -l app=v1
k run nginx12 --image=nginx --restart=Never -l app=v2
k run nginx13 --image=nginx --restart=Never -l app=v2
k label ns saturn ns=saturn

ns neptune
k create sa neptune-sa-v2
k run nginx4 --image=nginx --restart=Never -l app=v2
k run api-new-c32 --image=ngix --replicas=3
k set image deploy api-new-c32 *=ngnix:1.16.3
k run my-happy-shop --image=nginx --restart=Never -l app=my-happy-shop

ns pluto
k run nginx8 --image=nginx --restart=Never -l app=v1
k run nginx9 --image=nginx --restart=Never -l app=v3
k run nginx10 --image=nginx --restart=Never -l app=v1
k run holy-api --image=nginx --restart=Never

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
k apply -f https://raw.githubusercontent.com/geekhitesh/CKAD/master/networking_04.yaml

ns moon
k run nginx8 --image=nginx --restart=Never -l type=worker
k create secret generic secret2 --from-literal=db=mysql --dry-run -o yaml > /opt/course/14/secret2.yaml
k run secret-handler --image=nginx --restart=Never --dry-run -o yaml > /opt/course/14/secret-handler.yaml


ns netcon
k run frontend --image=nginx --restart=Never -l app=frontend
k run backend --image=redis --restart=Never -l app=backend


## label nodes master and node01
k label node master node-name=master
k label node node01 node-name=node01