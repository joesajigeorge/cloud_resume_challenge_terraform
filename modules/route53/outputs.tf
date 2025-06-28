output "hosted_zone_id" {
  value       = data.aws_route53_zone.primary.zone_id
  description = "Route53 hosted zone ID"
}

output "name_servers" {
  value       = data.aws_route53_zone.primary.name_servers
  description = "Route53 name servers for DNS configuration"
}
