# The random_id resource is used to generate a 35 character secret for the tunnel
resource "random_id" "tunnel_secret" {
  byte_length = 35
}

# A Named Tunnel resource called terraform-gcp-gke
resource "cloudflare_argo_tunnel" "k8s_tunnel" {
  account_id = var.cloudflare_account_id
  name       = "terraform-k8s"
  secret     = random_id.tunnel_secret.b64_std
}

# DNS settings to CNAME to tunnel target for k8s Ingresses
# Not proxied, not accessible. Just a record for auto-created CNAMEs by external-dns.
resource "cloudflare_record" "k8s_tunnel" {
  zone_id = local.cloudflare_zone_id
  name    = "k8s-tunnel-origin.${var.cloudflare_zone}"
  value   = "${cloudflare_argo_tunnel.k8s_tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}