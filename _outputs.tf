output "zone_ids" {
  description = "Map of created Route53 zone IDs"
  value       = module.zone.route53_zone_zone_id
}

output "zone_names" {
  description = "Map of created Route53 zone names"
  value       = module.zone.route53_zone_name
}

output "record_names" {
  description = "Map of created Route53 record names"
  value       = module.records.route53_record_name
}

output "record_fqdns" {
  description = "Map of created Route53 record FQDNs"
  value       = module.records.route53_record_fqdn
}
