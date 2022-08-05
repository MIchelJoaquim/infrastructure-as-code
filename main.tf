terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~>2.0"

    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "k8s_iniciativa" {
  name = var.k8s_name
  region = "nyc1"
  version = "1.22.8-do.1"

  node_pool {
    name = "default"
    size = "s-2vcpu-2gb"
    node_count = 3
  }
}

variable "do_token" {}
variable "k8s_name" {}
variable "region" {}