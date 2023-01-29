                                                GCP TASK
        By using Dockerfile, build python docker image
$ gcloud auth login 
$ docker build -t gcr.io/fatma120d/python-app-img .
$ gcloud docker -- push us.gcr.io/fatma120d/python-app-img

        Build redis image
