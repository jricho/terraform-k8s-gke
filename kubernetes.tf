resource "google_container_cluster" "gcp_kubernetes" {
  name               = "${var.cluster_name}"
  zone               = "australia-southeast1-a"
  initial_node_count = "${var.gcp_cluster_count}"

  additional_zones = [
    "australia-southeast1-b",
    "australia-southeast1-c",
  ]

  master_auth {
    username = "${var.linux_admin_username}"
    password = "${var.linux_admin_password}}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      this-is-for = "demo-cluster"
    }

    tags = ["demo", "work"]
  }
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${google_container_cluster.gcp_kubernetes.zone}"
}
  provisioner "local-exec" {
    command = "kubectl apply -f pods/pod-cloudnative.yaml"
}
  provisioner "local-exec" {
    command = "kubectl apply -f pods/service-cloudnative.yaml"
}
}
