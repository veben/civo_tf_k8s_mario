output "kubeconfig_path" {
  value = local_file.cluster-config.filename
}
