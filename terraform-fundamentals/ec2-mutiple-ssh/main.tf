resource "aws_instance" "dev-box" {
    ami = var.aws_ami
    instance = var.instance_type
    key_name    = var.ssh_key

tags = {
    Name = var.server_name
 }
}



resource "aws_key_pair" "ssh_users" {
  count      = length(local.ssh_users)
  key_name   = local.ssh_users[count.index]
  public_key = local.ssh_keys[count.index]
}



variable "server_names" {
    type = list(strings)
    default = ["wb-apla", "wb-beta", "web-jahid", "web-ultimate"]
}


locals {
  # list of users allowed to SSH in the EKS worker nodes
  ssh_users           = [for user in var.users : user.name if user.pubkey_file != ""]
  ssh_keys            = [for key in var.users : file(key.pubkey_file) if key.pubkey_file != ""]
  ssh_key_inject      = [for key in var.users: format("echo \"%s\" >> ~/.ssh/authorized_keys", file(key.pubkey_file)) if key.pubkey_file != ""]
  additional_userdata = join("\n", local.ssh_key_inject)
  office_cidr_list    = var.office_cidr_access.rathbone_office
  wfh_cidr_list       = flatten([for user in var.users: user.access_ips if user.access_ips != []])
}


variable "users" {
  description = "data structure to handle all user connection information"
  type = list(object({
    name = string
    pubkey_file = string
    access_ips = list(string)
  }))
}