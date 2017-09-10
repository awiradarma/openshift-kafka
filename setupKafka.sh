oc login -u system:admin

# Create namespace
oc new-project kafka

# Unfortunately we need root priv for the containers that are used in this example
oc adm policy add-scc-to-user anyuid -z default

# Create Persistant Volumes  No londer need these
#./zookeeper/bootstrap/pv.sh
#./bootstrap/pv.sh

# Create  Persistant volumes claims
oc create -f ./bootstrap/pvc.yml
oc create -f ./zookeeper/bootstrap/pvc.yml

# Create Zookeeper & Kakfa
oc create -f ./zookeeper/service.yml
oc create -f ./zookeeper/zookeeper.yaml 

# wait a bit for zookeeper to start, otherwise kafka would not start
sleep 30
oc create -f ./

