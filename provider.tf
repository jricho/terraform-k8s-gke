provider "google" {
  credentials = "${file("${var.credential_location}")}"
  project     = "demo-kube"
  region      = "australia-southeast1"
}
