OPTION2:
For this project creating ECS in AWS using Terraform to secure my credentials i used AWS-CLI 
the Terraform config file is defined as terraform-ecs.tf
For CI/CD tool i used Jenkins.Basically I first integrated jenkins with docker to create a docker image Jenkins will use the dockerfile in this project to build an image and the image need to be in ECR.For Jenkins to do this task i installed Git in Jenkins server Github plugins in Jenkins CLoudbees Docker build and publish plugins and also to integrate Jenkins with ECR we need to install ECR pluging in Jenkins.TO create this image I define the specific Github repo in Jenkins config and Jenkins will use the Dockerfile to create the image.
To Push this image in ECR we need an access controlled through IAM,then we created a private repo in ECR.ECR is fully integrated with ECS, backed by Amazon S3.About AWS ECR we need to use AWS-CLI to pull or push Image in ECR. We have a login Command $ AWS ecr get -login -password --region region|docker login --username AWS --password --aws.account_ID.dkr.ecr.region.amazonaws.com. From this command you will get your credentials from AWS-CLI to connect your docker with the private repo you created in ECR I'm not putting my credentials here LoL.When this is done you have a docker command $ docker push aws_account_ID.dkr.ecr.region.amazonaws.com .To pull the the image same command with docker pull.If cannot or pull the image check your IAM.To deploy this image in ECS Cluster I wrote the deployment file in Yaml and i added the servicefile in deploymentfile for access through the URL.
