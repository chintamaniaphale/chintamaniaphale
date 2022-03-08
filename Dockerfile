FROM hashicorp/terraform
RUN mkdir /terraformdeploy 
COPY * /terraformdeploy
WORKDIR /terraformdeploy
CMD ["terraform init; terraform plan"]
