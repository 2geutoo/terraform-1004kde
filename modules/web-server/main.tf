# [modules/my-web-server/main.tf]
#variable "server_name" {}
#variable "server_ip" {}
#
#resource "null_resource" "web" {
#    provisioner "local-exec" {
#        command = "echo '모듈에서 생성:${var.server_name} (IP: ${var.server_ip})'"
#    }
#}





# [modules/web-server/main.tf]
#resource "null_resource" "web_instance" {
#  provisioner "local-exec" {
#    command = "echo '[Deploy] Server Name: ${var.server_name}, IP: ${var.server_ip}'"
#  }
#}

# 모듈이 값을 받기 위한 변수 창구 (필수)
#variable "server_name" {}
#variable "server_ip" {}


variable "server_name" {} # 외부에서 이름을 받아옴

resource "local_file" "web_server_info" {
  filename = "${path.module}/../../${var.server_name}.txt" # 파일 형태로 서버 생성 시뮬레이션
  content  = "Welcome to ${var.server_name}!"
}