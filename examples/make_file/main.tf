######################## Module ######################

module "zone" {
  source        = "./terraform-aws-route53/modules/zone"
  createZone    = local.workspace.zone.createZone
  zones = {
    "private-zone" = {
      domain_name = local.workspace.zone.domain_name
      vpc = [
        {
          vpc_id = local.workspace.zone.vpc_id
        }
      ]
      tags = {
        Name = "private-zone"
      }
    }
  }
  tags = {
    ManagedBy = "terraform"
  }
}

module "records" {
  for_each = local.workspace.records
  source                  = "./terraform-aws-route53/modules/records"
  createRecord            = true
  zone_id                 = var.zone_id != null ? var.zone_id : module.zone.route53_zone_id.private-zone
  zone_name               = var.zone_id != null ? var.zone_name : module.zone.route53_zone_name.private-zone
  recordName = [
    {
      name = each.key
      type = each.value.type
      ttl  = each.value.ttl
      records = each.value.records
    }
  ]
}
