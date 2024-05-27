resource "civo_firewall" "firewall" {
  name                 = "${var.cluster_name}-firewall"
  create_default_rules = false

  ingress_rule {
    protocol   = "tcp"
    port_range = "6443"
    cidr       = var.kubernetes_api_access
    label      = "kubernetes-api-server"
    action     = "allow"
  }
}
