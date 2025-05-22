variable "create_zone" {
  description = "Whether to create Route53 zones"
  type        = bool
  default     = true
}

variable "zones" {
  description = "Map of Route53 zones to create"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to all Route53 zones"
  type        = map(any)
  default     = {}
}

variable "create_records" {
  description = "Whether to create Route53 DNS records"
  type        = bool
  default     = true
}

variable "zone_id_override" {
  description = "Override zone_id for records module if zones module is not used"
  type        = string
  default     = null
}

variable "zone_name_override" {
  description = "Override zone_name for records module if zones module is not used"
  type        = string
  default     = null
}

variable "private_zone" {
  description = "Whether the zone is private (for records module)"
  type        = bool
  default     = false
}

variable "records" {
  description = "List of DNS records to create"
  type        = list(any)
  default     = []
}

variable "records_jsonencoded" {
  description = "JSON encoded list of DNS records (for Terragrunt compatibility)"
  type        = string
  default     = null
}
