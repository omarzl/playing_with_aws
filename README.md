# Playing with AWS

This repository contains various playgrounds I use with AWS.

## AWS Auto Scaling Infra with Jenkins

I am an iOS developer, so my main focus is on macOS infrastructure. However, before using Mac instances, I opted to set up two Linux infrastructures, which are cheaper, before moving to Mac.

This repository offers three Auto Scaling Infrastructure setups:

- Linux Virtual Instances Infra (free tier eligible)
- Linux Dedicated Hosts Infra
- Mac Dedicated Hosts Infra

You should first read this article that explains how to set everything up.
https://medium.com/@omarlagunas/ios-auto-scaling-infra-w-aws-jenkins-terraform-packer-and-bazel-4c189893b329

### Linux Virtual instances Infra

AWS offers `t2.micro` instances in their free tier.

##### Terraform

Run this command to set up the infrastructure:

```
terraform -chdir=linux-infra apply
```

##### Jenkins

The differences between the configuration of a macOS infra and this one are these parameters:

- Max Idle Minutes Before Scaledown: 5 (Because these instances are easy to terminate, they can scale down quickly)
- Maximum Init Connection Timeout in sec: 180 (I used the default value since they connect quickly)

The label should be `ec2-linux-fleet` so the Jenkinsfile located in `jenkins/linux/Jenkinsfile` works out of the box.

### Linux Dedicated Hosts Infra

I used `a1` host family and `a1.medium` instances.
Similar to macOS instances, it is required to request a limit increase for these dedicated hosts to use them.

##### Packer

Run this command to create the AMI with Packer:

```
packer build -var-file=config/linux.pkrvars.hcl .
```

##### Terraform

Run this command to set up the infrastructure:

```
terraform -chdir=linux-dh-infra apply
```

##### Jenkins

I used the same configuration as in `Linux Virtual instances Infra`

The label should be `ec2-dh-linux-fleet` so the Jenkinsfile located in `jenkins/dh-linux/Jenkinsfile` works out of the box.

### Mac Dedicated Hosts Infra

I used `mac2 ` host family and `mac2 .metal` instances.
It is required to request a limit increase for these dedicated hosts to use them.

##### Packer
Run this command to create the AMI with Packer:

```
packer build -var-file=config/macos.pkrvars.hcl .
```

##### Terraform

Run this command to set up the infrastructure:

```
terraform -chdir=macos-dh-infra apply
```

##### Jenkins

The configuration can be found in the article.

The label should be `ec2-dh-mac-fleet` so the Jenkinsfile located in `jenkins/mac/Jenkinsfile` works out of the box.
