variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US 2"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "bhealth-app-monitor-common"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "firebase_credentials_path" {
  description = "Path to Firebase service account JSON file"
  type        = string
}

variable "google_project_id" {
  description = "Google Cloud project ID"
  type        = string
}
