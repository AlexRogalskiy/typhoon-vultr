# Self-hosted Kubernetes assets (kubeconfig, manifests)
module "bootkube" {
  source = "git::https://github.com/poseidon/terraform-render-bootkube.git?ref=39f9afb3360ec642e5b98457c8bd07eda35b6c96"

  cluster_name          = "${var.cluster_name}"
  api_servers           = ["${format("%s-api.%s", var.cluster_name, var.dns_zone)}"]
  etcd_servers          = ["${formatlist("%s.%s", vultr_dns_record.etcds.*.name, var.dns_zone)}"]
  asset_dir             = "${var.asset_dir}"
  networking            = "${var.networking}"
  network_mtu           = 1430
  pod_cidr              = "${var.pod_cidr}"
  service_cidr          = "${var.service_cidr}"
  cluster_domain_suffix = "${var.cluster_domain_suffix}"
}
