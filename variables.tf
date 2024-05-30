variable "api_key" {
  description = "API key for authentication."
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.api_key) > 0
    error_message = "The API key cannot be empty."
  }
}
variable "region" {
  description = "The region to provision the cluster in (e.g., FRA1 for Frankfurt)."
  type        = string
  default     = "FRA1"
  validation {
    condition     = contains(["FRA1", "NYC1", "LON1", "SFO1"], var.region)
    error_message = "The specified region is not supported. Please choose from 'FRA1', 'NYC1', 'LON1', 'SFO1'."
  }
}
variable "cluster_name" {
  description = "The name of the Kubernetes cluster to be created."
  type        = string
  default     = "my-mario-civo-cluster"
  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster name cannot be empty."
  }
}

variable "cluster_node_size" {
  description = "The size of the nodes to provision. Run `civo size list` for all options."
  type        = string
  default     = "g4s.kube.xsmall"
  validation {
    condition     = contains(["g4s.kube.xsmall", "g4s.kube.small", "g4s.kube.medium"], var.cluster_node_size)
    error_message = "The specified node size is not supported. Please choose from 'g4s.kube.xsmall', 'g4s.kube.small', 'g4s.kube.medium'."
  }
}

variable "cluster_node_count" {
  description = "The number of nodes in the default pool."
  type        = number
  default     = 1
  validation {
    condition     = var.cluster_node_count > 0
    error_message = "The number of nodes must be greater than zero."
  }
}

variable "kubernetes_api_access" {
  description = "List of subnets allowed to access the Kubernetes API."
  type        = list(string)
  default     = ["0.0.0.0/0"]
  validation {
    condition     = alltrue([for subnet in var.kubernetes_api_access : can(regex("^(\\d{1,3}\\.){3}\\d{1,3}/\\d{1,2}$", subnet))])
    error_message = "Each entry in kubernetes_api_access must be a valid subnet in CIDR notation."
  }
}
variable "kube_config_path" {
  description = "The path to save the Kubernetes configuration file."
  type        = string
  default     = "~/.kube/civo_tf_k8s_mario_config.yaml"
}

variable "chart_name" {
  description = "The name of the Helm chart to be deployed."
  type        = string
  default     = "mario-bros"
}

variable "chart_version" {
  description = "The version of the Helm chart to be deployed."
  type        = string
  default     = "0.4.0"
}
variable "chart_repository" {
  description = "The repository URL of the Helm chart."
  type        = string
  default     = "https://veben.github.io/helm_charts/"
}
