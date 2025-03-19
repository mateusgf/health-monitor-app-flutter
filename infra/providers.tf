terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = ">=4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.21.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.3"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "google" {
  credentials = file(var.firebase_credentials_path)
  project     = var.google_project_id
}

provider "random" {}

provider "kubernetes" {
  host                   = module.aks.aks_kube_config.host
  client_certificate     = base64decode(module.aks.aks_kube_config.client_certificate)
  client_key             = base64decode(module.aks.aks_kube_config.client_key)
  cluster_ca_certificate = base64decode(module.aks.aks_kube_config.cluster_ca_certificate)
}

provider "kubectl" {
  host                   = module.aks.aks_kube_config.host
  client_certificate     = base64decode(module.aks.aks_kube_config.client_certificate)
  client_key             = base64decode(module.aks.aks_kube_config.client_key)
  cluster_ca_certificate = base64decode(module.aks.aks_kube_config.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.aks.aks_kube_config.host
    client_certificate     = base64decode(module.aks.aks_kube_config.client_certificate)
    client_key             = base64decode(module.aks.aks_kube_config.client_key)
    cluster_ca_certificate = base64decode(module.aks.aks_kube_config.cluster_ca_certificate)
  }
}
