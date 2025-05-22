# terraform-aws-route53

[![Lint Status](https://github.com/tothenew/terraform-aws-route53/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-route53/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-route53)](https://github.com/tothenew/terraform-aws-route53/blob/master/LICENSE)



The following content needed to be created and managed:
 - Introduction
     - Explaination of module
     This Terraform module provides a reusable and customizable solution to create and manage AWS Route53 hosted zones and DNS records. It supports both public and private zones, allows dynamic creation of multiple zones, management of DNS records (A, CNAME, TXT, MX, etc.), and supports advanced features such as VPC association and timeout configuration.

 
 - Resource created and managed by this module
    - AWS Route53 Hosted Zones (public or private) with flexible zone parameters.

    - Route53 DNS Records inside the specified zones, supporting multiple record types and configurations.


 - Example Usages

 ``` hcl
 module "zone" {
  source = "./modules/zone"

  create = true

  zones = {
    "example-public" = {
      domain_name = "example.com"
      comment     = "Public hosted zone for example.com"
      tags = {
        Environment = "prod"
        Team        = "network"
      }
    },
    "example-private" = {
      domain_name       = "internal.example.com"
      private_zone      = true
      vpc = {
        vpc_id     = "vpc-12345678"
        vpc_region = "us-east-1"
      }
      tags = {
        Environment = "dev"
      }
    }
  }

  tags = {
    Project = "route53-management"
  }
}

module "records" {
  source = "./modules/records"

  create    = true
  zone_id   = module.zone.route53_zone_ids["example-public"]
  zone_name = "example.com"
  private_zone = false
  records = [
    {
      name    = "www"
      type    = "A"
      ttl     = 300
      records = ["1.2.3.4"]
    },
    {
      name    = "mail"
      type    = "MX"
      ttl     = 3600
      records = ["10 mail.example.com"]
    }
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-lambda/blob/main/LICENSE) for full details.
