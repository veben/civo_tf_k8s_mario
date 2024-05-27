terraform {
  required_providers {
    civo = {
      source  = "civo/civo"
      version = "1.0.41"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2"
    }
  }
}

provider "civo" {
  token  = var.api_key
  region = var.region
}

provider "helm" {
  kubernetes {
    config_path = var.kube_config_path
  }
}
