env            = "testing"
region         = "ap-south-1"
vpc_cidr_block = "10.0.0.0/16"

public_subnet  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]



# EKS
is_eks_cluster_enabled  = true
cluster_version         = "1.34"
cluster_name            = "my-cluster"
endpoint_private_access = true
endpoint_public_access  = true
authentication_mode     = "API_AND_CONFIG_MAP"

ondemand_instance_types = ["m7i-flex.large"]
spot_instance_types     = ["m7i-flex.large"]
desired_capacity_on_demand = "1"
min_capacity_on_demand     = "1"
max_capacity_on_demand     = "2"

desired_capacity_spot = "2"
min_capacity_spot     = "2"
max_capacity_spot     = "10"

addons = [
  {
    name    = "vpc-cni",
    version = "v1.21.1-eksbuild.1"
  },
  {
    name    = "coredns"
    version = "v1.12.4-eksbuild.1"
  },
  {
    name    = "kube-proxy"
    version = "v1.34.1-eksbuild.2"
  },
  {
    name    = "aws-efs-csi-driver"
    version = "v2.2.0-eksbuild.1"
  },
  {
    name    = "aws-ebs-csi-driver"
    version = "v1.46.0-eksbuild.1"
  }

]



#BASTION
bastion_image_id      = "ami-02b8269d5e85954ef" # change this to your own ami id ubuntu machine
bastion_instance_type = "m7i-flex.large"
bastion_tags          = { Name = "bastion-dev" }
bastion_key_name      = "linux-key" # create your own key pair

tags = {
  Project     = "vpc-alb"
  Environment = "testing"
}
