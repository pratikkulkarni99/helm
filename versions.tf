terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.1"
    }
    google = {
      source  = "hashicorp/google"
    }
  }
  required_version = "~> 1.2.0"
}
