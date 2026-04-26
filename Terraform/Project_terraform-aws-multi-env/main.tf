locals {
  env = {
  dev = {
    instance_count = 2
    bucket_count = 1
    dynamoDB_count = 1
  }
  stg = {
    instance_count = 3
    bucket_count = 1
    dynamoDB_count = 1
  }
  prod = {
    instance_count = 4
    bucket_count = 2
    dynamoDB_count = 2
  }
  }
  current  = lookup(local.env, terraform.workspace, local.env["dev"])
}


module "ec2" {
  source = "./modules/ec2"
  env = terraform.workspace  #dev/stag this assigned during runtime.
  ec2_instance_count = local.current.instance_count
}

module "s3" {
  source = "./modules/s3"
  env = terraform.workspace  #dev/stag this assigned during runtime.
  s3_bucket_count = local.current.bucket_count
}

module "dynamoDB" {
  source = "./modules/dynamoDB"
  env = terraform.workspace  #dev/stag this assigned during runtime.
  dynamoDB_table_count = local.current.dynamoDB_count

}