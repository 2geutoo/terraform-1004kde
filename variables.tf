#variable "vm_ip" {
#  description = "관리할 서버의 IP 주소"
#  type        = string
#  default     = "192.168.1.20" 
#}




# [variables.tf]
#variable "web_servers" {
#  type = map(object({
#    name = string
#    ip   = string
#  }))
#  default = {
#    "dev-01"  = { name = "dev-web-01", ip = "10.0.1.11" }
#    "dev-02"  = { name = "dev-web-02", ip = "10.0.1.12" }
#    "prod-01" = { name = "prod-web-01", ip = "10.0.2.10" }
#  }
#}



variable "web_servers" {
  default = {
    "dev-web-01"  = { env = "dev" }
    "dev-web-02"  = { env = "dev" }
    "prod-web-01"  = { env = "prod" }
  }
}

