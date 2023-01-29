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
