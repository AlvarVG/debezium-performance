resource "local_file" "inventory" {
  filename        = var.inventory
  file_permission = "644"
  content = yamlencode({
    all : {
      hosts : {
        for host_alias, host_addr in var.hosts :
        host_alias => merge(
          { "ansible_host" = host_addr },
          contains(keys(var.hosts_ssh_user), host_alias) ? { "ansible_ssh_user" = var.hosts_ssh_user[host_alias] } : {}
        )
      }
      vars : merge(var.vars, {
        ansible_ssh_user : var.ansible_ssh_user
        ansible_ssh_private_key_file : var.ansible_ssh_key
      })
    }
  })
}

resource "null_resource" "wait_for_connection" {
  depends_on = [local_file.inventory]
  triggers   = { always_run = timestamp() }

  provisioner "local-exec" {
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
    command = <<-EOF
        timeout ${var.connection_timeout} bash -c "until ansible all -i ${var.inventory} -m ping; do sleep 1; done"
    EOF
  }
}

resource "null_resource" "run_playbook" {
  depends_on = [null_resource.wait_for_connection]
  triggers   = { always_run = timestamp() }

  provisioner "local-exec" {
    environment = {
      ANSIBLE_HOST_KEY_CHECKING           = "False"
      OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES"
      ANSIBLE_PIPELINING                  = "True"
      ANSIBLE_STDOUT_CALLBACK             = "yaml"
      ANSIBLE_LOAD_CALLBACK_PLUGINS       = "True"
    }
    command = <<-EOF
        ansible-playbook -i ${var.inventory} ${var.playbook}
    EOF
  }
}
