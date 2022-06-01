resource "local_file" "ansible_inventory" {
  content = templatefile("./ansible/inventory.tmpl", {
    ip          = aws_instance.appliance.public_ip,
    ssh_keyfile = "./${var.generated_key_name}.pem"
  })
  filename = format("%s/%s", abspath(path.root), "./ansible/inventory.yaml")
}
