# Terraform - K8s - GKE
## Demo - Building a 3 Node K8s cluster in GKE and deploying a container with LoadBalancer

## Before you begin

#### Install theses tools

### [gcloud](https://cloud.google.com/sdk/docs/quickstart-macos)


> **app-engine-python**  ```gcloud components install app-engine-python```
>
> **kubectl** ```gcloud components install kubectl```
>

### Install Terraform
> ```curl -O https://releases.hashicorp.com/terraform/0.11.2/terraform_0.11.2_darwin_amd64.zip\?_ga\=2.187257576.1199271896.1516169701-677746182.1510952834```
>

### Authentication JSON File
>
> Authenticating with Google Cloud services requires a JSON file which we call the account file.
>
> This file is downloaded directly from the Google developers Console. To make the process more straightforwarded, it is documented here:
>
1. Log into the Google developer's Console and select a project.
>
1. The API Manager view should be selected, click on "Credentials" on the left, then "Create credentials", and finally "Service account key".
>
1.  Select "Compute Engine default service account" in the "Service account" dropdown, and select "JSON" as the key type.
>
1. Clicking "Create" will download your credentials.

### Commands used

### Terraform init

```
# terraform init

Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
- Downloading plugin for provider "google" (1.4.0)...
....... truncated
 do so if necessary.

```
### terraform plan -out demo-k8s-gke.state
```
terraform plan -out demo-k8s-gke.state
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  + google_container_cluster.gcp_kubernetes
      id:                                    <computed>
      additional_zones.#:                    "2"
      additional_zones.1111111111:           "australia-southeast1-b"
      additional_zones.2222222222:        ....... truncated


Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: demo-k8s-gke.state

To perform exactly these actions, run the following command to apply:
    terraform apply "demo-k8s-gke.state"


```

### terraform apply "demo-k8s-gke.state"

```
terraform apply
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

gcp_cluster_endpoint = xx.yyy.zzz.aa
gcp_cluster_name = hugocn

gcp_ssh_command = ssh xxx@xx.yyy.zzz.aa

```

```
google_container_cluster.gcp_kubernetes: Creating...
  additional_zones.#:                    "" => "2"
  additional_zones.1111111111:           "" => "australia-southeast1-b"
  additional_zones.2222222222:           ....... truncated
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

gcp_cluster_endpoint = xx.yyy.zzz.aa
gcp_cluster_name = hugocn
gcp_ssh_command = ssh xxx@xx.yyy.zzz.aa

```
### terraform -version

```
➜ # terraform -version
Terraform v0.11.2
+ provider.google v1.4.0
```
### terraform destroy

```
# terraform destroy
google_container_cluster.gcp_kubernetes: Refreshing state... (ID: hugocn)

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  - google_container_cluster.gcp_kubernetes


Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

google_container_cluster.gcp_kubernetes: Destroying... (ID: hugocn)
....... truncated
 Destruction complete after 1m14s

Destroy complete! Resources: 1 destroyed.

```
