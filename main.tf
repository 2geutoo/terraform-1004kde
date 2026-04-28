# main.tf (아주 간단한 시작)
# 첫날은 로컬 명령어를 실행하는 것으로 감을 잡습니다.

resource "null_resource" "hello_world" {
  provisioner "local-exec" {
    command = "echo '테라폼 실습 시작! 반갑습니다.'"
  }
}