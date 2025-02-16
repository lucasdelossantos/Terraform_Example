resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = "${path.module}/generate_ssh_key.sh ${var.key_name} ${var.key_path} ${var.email} "
  }
}

data "local_file" "public_key" {
  depends_on = [null_resource.generate_ssh_key]
  filename   = "${path.module}/${var.public_key_path}"
}

resource "aws_key_pair" "tf_key" {
  depends_on = [null_resource.generate_ssh_key]
  key_name   = var.key_name
  public_key = data.local_file.public_key.content
}

resource "null_resource" "destroy_ssh_key" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "${path.module}/destroy_ssh_key.sh"
  }
}
