#variable "servers" {
#  type = map(string)
#  default ={
#    "web-server"  = "192.168.1.10"
#    "db-server"   = "192.168.1.20"
#    "auth-server" = "192.168.1.30"
#  }
#}
#
#resource "null_resource" "my_servers" {
#  # 서버 리스트를 하나씩 돌면서 처리합니다.
#  for_each = var.servers
#
#  provisioner "local-exec" {
#    # ecah.key는 이름 (web-server 등), each.value는 IP(192.168...)
#    command = "echo '배포 중: ${each.key} (IP: ${each.value})'"
#  }
#}

#module "web-server" {
#    source      =   "./modules/my-web-server"
#    server_name =   "web-production"
#    server_ip   =   "192.168.10.100"
#}

#module "db-server" {
#    source      =   "./modules/my-web-server"
#    server_name =   "db-production"
#    server_ip   =   "192.168.10.200"
#}

#variable "server_list" {
#  default = {
#    web = { name = "web-01", ip = "192.168.10.10"}
#    db  = { name = "db-01",  ip = "192.168.10.20"}
#  }
#}

#module "servers" {
#  source      =   "./modules/my-web-server"
#  for_each    =   var.server_list
#    
#  server_name =   each.value.name
#  server_ip   =   each.value.ip
#}




# [main.tf]
#module "web_cluster" {
#  source   = "./modules/web-server"
#  for_each = var.web_servers
#
#  # 각 반복마다 key(dev-01 등)와 value를 사용하여 모듈 변수에 할당
#  server_name = each.value.name
#  server_ip   = each.value.ip
#}


module "my_web_servers" {
  source  = "./modules/web-server"

  # 변수 파일의 web_servers 맵을 돌면서 하나씩 꺼내옴
  for_each = var.web_servers

  # 모듈 내부의 server_name 변수에 Map의 Key값(서버 이름)을 전달 
  server_name = each.key
}

