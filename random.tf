resource "random_id" "sa_hex" {
  byte_length = 4
}

resource "random_id" "web_hex" {
  byte_length = 2
}

resource "random_password" "vm_pwd" {
  length           = 16
  special          = false
  override_special = "escobar"
}
