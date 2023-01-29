                                                GCP TASK
        By using Dockerfile, build python docker image
gcloud auth login 
docker build -t gcr.io/fatma120d/python-app-img .
docker push us.gcr.io/fatma120d/python-app-img



        Build redis image
pull redis
docker push us.gcr.io/fatma120d/redis-app-img


        Using terrafom
terraform init 
terraform plan
terraform apply
     
     
        Install kubectl
sudo apt install -y apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
sudo apt-get update && sudo apt-get install -y google-cloud-cli
sudo apt-get install kubectl
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

        Connect GKE cluster 
gcloud compute ssh --zone "us-central-1" "my-private-vm"  --tunnel-through-iap --project "fatma120d"
gcloud compute scp --recurse deployment/ my-private-vm:/home/fatmaelzahraa31 --zone us-central-1 --tunnel-through-iap
Kubectl create -f deployment
 
