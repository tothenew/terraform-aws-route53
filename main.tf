module "zone" {
  source = "./modules/zone"

  create = var.zone_create
  zones  = var.zones
  tags   = var.zone_tags
}

module "records" {
  source = "./modules/records"

  create              = var.record_create
  zone_id             = var.zone_id != null ? var.zone_id : (length(module.zone.route53_zone_zone_id) > 0 ? values(module.zone.route53_zone_zone_id)[0] : null)
  zone_name           = var.zone_name != null ? var.zone_name : (length(module.zone.route53_zone_name) > 0 ? values(module.zone.route53_zone_name)[0] : null)
  private_zone        = var.private_zone
  records             = var.records
  records_jsonencoded = var.records_jsonencoded
}
