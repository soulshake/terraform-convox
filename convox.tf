provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_cloudformation_stack" "rack" {
  name = "rack-stack"

  parameters {
    Password           = "hownowbrowncow"
    CustomTopicRuntime = "nodejs4.3"
    Private            = "Yes"
  }

  template_url     = "https://convox.s3.amazonaws.com/release/20170301205054/formation.json"
  disable_rollback = true
  capabilities     = ["CAPABILITY_IAM"]

  tags {
    Name = "tfadventures"
  }
}

/* Outputs */

output "AvailabilityZones" {
  value = "${aws_cloudformation_stack.rack.outputs.AvailabilityZones}"
}

output "AwsRegion" {
  value = "${aws_cloudformation_stack.rack.outputs.AwsRegion}"
}

output "Internal" {
  value = "${aws_cloudformation_stack.rack.outputs.Internal}"
}

output "Name" {
  value = "${aws_cloudformation_stack.rack.name}"
}

output "Private" {
  value = "${aws_cloudformation_stack.rack.outputs.Private}"
}

output "Release" {
  value = "${aws_cloudformation_stack.rack.outputs.Release}"
}

output "StackId" {
  value = "${aws_cloudformation_stack.rack.outputs.StackId}"
}

output "tags" {
  value = "${aws_cloudformation_stack.rack.tags}"
}

// Autoscale = 1  AutoscalingGroup = rack-stack-Instances-AT6V7OK87HNP  AvailabilityZones = us-east-1b,us-east-1a,us-east-1c,us-east-1d,us-east-1e  AwsRegion = us-east-1  BalancerSecurityGroup = sg-aa688ad5  BuildCluster = rack-stack-Cluster-1VM2A4GEIWZM3  Cluster = rack-stack-Cluster-1VM2A4GEIWZM3  CustomTopic = arn:aws:lambda:us-east-1:332653055745:function:rack-stack-CustomTopic-V1PW2C2VHTEM  Dashboard = rack-stack-1959005174.us-east-1.elb.amazonaws.com  DockerImageApi = convox/api:20170301205054  DynamoBuilds = rack-stack-builds  DynamoReleases = rack-stack-releases  EncryptionKey = arn:aws:kms:us-east-1:332653055745:key/3a95d88d-8e5a-4907-8ab0-20dc145cd257  Gateway = igw-98b18bff  GatewayAttachment = rack-Gatew-1T4FZTYEOJ9KU  IamRole = rack-stack-IamRole-IF7FTV8LLYMU  InstanceProfile = rack-stack-InstanceProfile-CDOQK4C3I7IW  Internal = No  LogGroup = rack-stack-LogGroup-CDROM2JHEFKA  NatGateways = nat-06f543b2377fe3b3b,nat-0fd7d673e72334336,nat-0fec0f292e0404494  NatIPs = 34.198.165.171,34.206.146.192,34.206.145.43  NotificationHost = rack-stack-1959005174.us-east-1.elb.amazonaws.com  NotificationTopic = arn:aws:sns:us-east-1:332653055745:rack-stack-notifications  Private = Yes  Rack = rack-stack  Release = 20170301205054  RouteTablePublic = rtb-f66fe48f  RouteTablesPrivate = rtb-9b67ece2,rtb-b567eccc,rtb-b267eccb  SecurityGroup = sg-a9688ad6  SettingsBucket = rack-stack-settings-1un4c42sx3w7v  StackId = arn:aws:cloudformation:us-east-1:332653055745:stack/rack-stack/6eb6bed0-0085-11e7-a1c8-50d5ca63268e  Subnets = subnet-d19ebf8a,subnet-ef819ba6,subnet-59c6583c  SubnetsPrivate = subnet-d664448d,subnet-f4baa0bd,subnet-abc55bce  Vpc = vpc-98b8fefe}

provider "convox" {
  host     = "foo.bar.com"
  password = "xxx"
}

/*
resource "convox_app" "test-app" {
  name = "test-app"
  rack = "foo"


  params {
    Internal = false
  }

  environment {
    Foo    = "bar"
    FooBar = 10
  }
}
  */

