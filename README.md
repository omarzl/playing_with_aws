# Playing with AWS

This repository contains different playgrounds I use with AWS.

## AWS Auto Scaling Infra with Jenkins

I am an iOS developer so my main focus is related to macOS Infra.
AWS Computing Cloud named EC2 offers different instance options. Mac instances aren't eligible for the free tier and they need to be rented for at least 24 hours. The [cheapest](https://aws.amazon.com/ec2/dedicated-hosts/pricing) instance is the `mac2`, it will cost at least $15.60 ($0.65 x 24 hrs) to start playing with those.
So before using Mac instances I opted to set up a Linux Infra which is cheaper before moving to Mac ones.

Therefore this repository offers 3 Auto Scaling Infra set ups:
- Virtual Linux Infra
- Dedicated Linux Infra
- Dedicated Mac Infra

### Packer



### Virtual Linux infra

> Free tier eligible

AWS offers `t2.micro` instances in their free tier. So I used these instances as a starting point to set up everything.
