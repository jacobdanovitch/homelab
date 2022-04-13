# Cloudflare Variables
variable "cloudflare_zone" {
  description = "The Cloudflare Zone to use."
  type        = string
}

variable "cloudflare_account_id" {
  description = "The Cloudflare UUID for the Account the Zone lives in."
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "The Cloudflare user."
  type        = string
  sensitive   = true
}

variable "cloudflare_token" {
  description = "The Cloudflare user's API token."
  type        = string
  sensitive   = true
}

variable "kubernetes_config_path" {
  description = "Path to kubeconfig."
  type        = string
  default     = "~/.kube/config"
}


variable "kubernetes_context" {
  description = "Context to select from kubeconfig."
  type        = string
  default     = null
}

variable "ingress_controller_endpoint" {
  description = "URL of ingress controller to point cloudflared tunnel toward."
  type        = string
  default     = "http://ingress-nginx-controller.ingress-nginx.svc.cluster.local.:80"
}
