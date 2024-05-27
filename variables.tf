variable "api_key" {
  type = string
}

variable "region" {
  description = "The region to provision the cluster against"
  type        = string
  default     = "FRA1"
}

variable "cluster_name" {
  description = "Name of the cluster being created"
  type        = string
  default     = "civo-easy-cluster-tf"
}

variable "cluster_node_size" {
  description = "The size of the nodes to provision. Run `civo size list` for all options"
  type        = string
  default     = "g4s.kube.xsmall"
}

variable "cluster_node_count" {
  description = "Number of nodes in the default pool"
  type        = number
  default     = 1
}

variable "kubernetes_api_access" {
  description = "List of Subnets allowed to access the Kube API"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "kube_config_path" {
  type    = string
  default = "config/config.yaml"
}
