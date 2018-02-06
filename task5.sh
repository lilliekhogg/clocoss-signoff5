#!/bin/bash

N=$1;
echo "The number of vms created will be $N";

secretKey=`openssl rand -base64 32`;
echo "vms created = $N";

#establish server metadata
serverIP=`curl -s -H "Metadata-Flavor: Google" \
                                               "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip"` \

#installing dependencies
echo "Now installing dependencies";
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash;
sudo apt-get -qq install nodejs;
sudo apt-get -qq install git;

#clone master-worker github
echo "Cloning clocoss-master-worker";
git clone https://github.com/portsoc/clocoss-master-worker;
cd clocoss-master-worker;
npm install;

#set the computezone for Vm instances
gcloud config set compute/zone europe-west1-b;



#create the instances

for i in `seq 1 $N`;
do
        gcloud compute instances create \
        --machine-type n1-standard-1 \
        --tags http-server,https-server \
        --metadata secret=$secretKey,ip=$serverIP,vms=$i \
        --metadata-from-file \
        startup-script=../startup-script.sh \
        lillie-worker-$i \
        --preemptible &
done;

#running server
npm run server $secretKey;

#remove workers
cd ..;
sudo rm clocoss-master-worker -r;

for i in `seq 1 $N`;
do
        gcloud -q compute instances delete `seq -f 'lillie-worker-%g' 1 $vms` &
done;
echo "servers successfully deleted";
