resource "local_file" "ansible_inventory" {
  content = templatefile("./ansible/inventory.tmpl", {
    ip          = aws_instance.appliance.public_ip,
    ssh_keyfile = "ansible/${var.generated_key_name}.pem"
  })
  filename = format("%s/%s", abspath(path.root), "./ansible/inventory.yaml")

  depends_on = [local_file.ansible_inventory]
  provisioner "local-exec" {
      command = "sleep 5; ansible-playbook -i ./ansible/inventory.yaml  ./ansible/playbook.yaml"
    }
}

