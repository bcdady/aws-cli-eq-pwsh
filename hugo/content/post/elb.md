---
title: elb
date: 2019-03-10
---

## elb

### [Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/)

* [CLI Reference](https://docs.aws.amazon.com/cli/latest/reference/elb/index.html)

|AWS CLI|PowerShell Cmdlet|Prefix|
|----|----|:--:|
|[aws elb add-tags](https://docs.aws.amazon.com/cli/latest/reference/elb/add-tags.html)|[Add-ELBResourceTag](https://docs.aws.amazon.com/powershell/latest/reference/items/Add-ELBResourceTag.html)|ELB|
|[aws elb apply-security-groups-to-load-balancer](https://docs.aws.amazon.com/cli/latest/reference/elb/apply-security-groups-to-load-balancer.html)|[Join-ELBSecurityGroupToLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/Join-ELBSecurityGroupToLoadBalancer.html)|ELB|
|[aws elb attach-load-balancer-to-subnets](https://docs.aws.amazon.com/cli/latest/reference/elb/attach-load-balancer-to-subnets.html)|[Add-ELBLoadBalancerToSubnet](https://docs.aws.amazon.com/powershell/latest/reference/items/Add-ELBLoadBalancerToSubnet.html)|ELB|
|[aws elb configure-health-check](https://docs.aws.amazon.com/cli/latest/reference/elb/configure-health-check.html)|[Set-ELBHealthCheck](https://docs.aws.amazon.com/powershell/latest/reference/items/Set-ELBHealthCheck.html)|ELB|
|[aws elb create-app-cookie-stickiness-policy](https://docs.aws.amazon.com/cli/latest/reference/elb/create-app-cookie-stickiness-policy.html)|[New-ELBAppCookieStickinessPolicy](https://docs.aws.amazon.com/powershell/latest/reference/items/New-ELBAppCookieStickinessPolicy.html)|ELB|
|[aws elb create-lb-cookie-stickiness-policy](https://docs.aws.amazon.com/cli/latest/reference/elb/create-lb-cookie-stickiness-policy.html)|[New-ELBLBCookieStickinessPolicy](https://docs.aws.amazon.com/powershell/latest/reference/items/New-ELBLBCookieStickinessPolicy.html)|ELB|
|[aws elb create-load-balancer](https://docs.aws.amazon.com/cli/latest/reference/elb/create-load-balancer.html)|[New-ELBLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/New-ELBLoadBalancer.html)|ELB|
|[aws elb create-load-balancer-listeners](https://docs.aws.amazon.com/cli/latest/reference/elb/create-load-balancer-listeners.html)|[New-ELBLoadBalancerListener](https://docs.aws.amazon.com/powershell/latest/reference/items/New-ELBLoadBalancerListener.html)|ELB|
|[aws elb create-load-balancer-policy](https://docs.aws.amazon.com/cli/latest/reference/elb/create-load-balancer-policy.html)|[New-ELBLoadBalancerPolicy](https://docs.aws.amazon.com/powershell/latest/reference/items/New-ELBLoadBalancerPolicy.html)|ELB|
|[aws elb delete-load-balancer](https://docs.aws.amazon.com/cli/latest/reference/elb/delete-load-balancer.html)|[Remove-ELBLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/Remove-ELBLoadBalancer.html)|ELB|
|[aws elb delete-load-balancer-listeners](https://docs.aws.amazon.com/cli/latest/reference/elb/delete-load-balancer-listeners.html)|[Remove-ELBLoadBalancerListener](https://docs.aws.amazon.com/powershell/latest/reference/items/Remove-ELBLoadBalancerListener.html)|ELB|
|[aws elb delete-load-balancer-policy](https://docs.aws.amazon.com/cli/latest/reference/elb/delete-load-balancer-policy.html)|[Remove-ELBLoadBalancerPolicy](https://docs.aws.amazon.com/powershell/latest/reference/items/Remove-ELBLoadBalancerPolicy.html)|ELB|
|[aws elb deregister-instances-from-load-balancer](https://docs.aws.amazon.com/cli/latest/reference/elb/deregister-instances-from-load-balancer.html)|[Remove-ELBInstanceFromLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/Remove-ELBInstanceFromLoadBalancer.html)|ELB|
|[aws elb describe-account-limits](https://docs.aws.amazon.com/cli/latest/reference/elb/describe-account-limits.html)|[Get-ELBAccountLimit](https://docs.aws.amazon.com/powershell/latest/reference/items/Get-ELBAccountLimit.html)|ELB|
|[aws elb describe-instance-health](https://docs.aws.amazon.com/cli/latest/reference/elb/describe-instance-health.html)|[Get-ELBInstanceHealth](https://docs.aws.amazon.com/powershell/latest/reference/items/Get-ELBInstanceHealth.html)|ELB|
|[aws elb describe-load-balancer-attributes](https://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancer-attributes.html)|[Get-ELBLoadBalancerAttribute](https://docs.aws.amazon.com/powershell/latest/reference/items/Get-ELBLoadBalancerAttribute.html)|ELB|
|[aws elb describe-load-balancer-policies](https://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancer-policies.html)|[Get-ELBLoadBalancerPolicy](https://docs.aws.amazon.com/powershell/latest/reference/items/Get-ELBLoadBalancerPolicy.html)|ELB|
|[aws elb describe-load-balancer-policy-types](https://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancer-policy-types.html)|[Get-ELBLoadBalancerPolicyType](https://docs.aws.amazon.com/powershell/latest/reference/items/Get-ELBLoadBalancerPolicyType.html)|ELB|
|[aws elb describe-load-balancers](https://docs.aws.amazon.com/cli/latest/reference/elb/describe-load-balancers.html)|[Get-ELBLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/Get-ELBLoadBalancer.html)|ELB|
|[aws elb describe-tags](https://docs.aws.amazon.com/cli/latest/reference/elb/describe-tags.html)|[Get-ELBResourceTag](https://docs.aws.amazon.com/powershell/latest/reference/items/Get-ELBResourceTag.html)|ELB|
|[aws elb detach-load-balancer-from-subnets](https://docs.aws.amazon.com/cli/latest/reference/elb/detach-load-balancer-from-subnets.html)|[Dismount-ELBLoadBalancerFromSubnet](https://docs.aws.amazon.com/powershell/latest/reference/items/Dismount-ELBLoadBalancerFromSubnet.html)|ELB|
|[aws elb disable-availability-zones-for-load-balancer](https://docs.aws.amazon.com/cli/latest/reference/elb/disable-availability-zones-for-load-balancer.html)|[Disable-ELBAvailabilityZoneForLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/Disable-ELBAvailabilityZoneForLoadBalancer.html)|ELB|
|[aws elb enable-availability-zones-for-load-balancer](https://docs.aws.amazon.com/cli/latest/reference/elb/enable-availability-zones-for-load-balancer.html)|[Enable-ELBAvailabilityZoneForLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/Enable-ELBAvailabilityZoneForLoadBalancer.html)|ELB|
|[aws elb modify-load-balancer-attributes](https://docs.aws.amazon.com/cli/latest/reference/elb/modify-load-balancer-attributes.html)|[Edit-ELBLoadBalancerAttribute](https://docs.aws.amazon.com/powershell/latest/reference/items/Edit-ELBLoadBalancerAttribute.html)|ELB|
|[aws elb register-instances-with-load-balancer](https://docs.aws.amazon.com/cli/latest/reference/elb/register-instances-with-load-balancer.html)|[Register-ELBInstanceWithLoadBalancer](https://docs.aws.amazon.com/powershell/latest/reference/items/Register-ELBInstanceWithLoadBalancer.html)|ELB|
|[aws elb remove-tags](https://docs.aws.amazon.com/cli/latest/reference/elb/remove-tags.html)|[Remove-ELBResourceTag](https://docs.aws.amazon.com/powershell/latest/reference/items/Remove-ELBResourceTag.html)|ELB|
|[aws elb set-load-balancer-listener-ssl-certificate](https://docs.aws.amazon.com/cli/latest/reference/elb/set-load-balancer-listener-ssl-certificate.html)|[Set-ELBLoadBalancerListenerSSLCertificate](https://docs.aws.amazon.com/powershell/latest/reference/items/Set-ELBLoadBalancerListenerSSLCertificate.html)|ELB|
|[aws elb set-load-balancer-policies-for-backend-server](https://docs.aws.amazon.com/cli/latest/reference/elb/set-load-balancer-policies-for-backend-server.html)|[Set-ELBLoadBalancerPolicyForBackendServer](https://docs.aws.amazon.com/powershell/latest/reference/items/Set-ELBLoadBalancerPolicyForBackendServer.html)|ELB|
|[aws elb set-load-balancer-policies-of-listener](https://docs.aws.amazon.com/cli/latest/reference/elb/set-load-balancer-policies-of-listener.html)|[Set-ELBLoadBalancerPolicyOfListener](https://docs.aws.amazon.com/powershell/latest/reference/items/Set-ELBLoadBalancerPolicyOfListener.html)|ELB|
