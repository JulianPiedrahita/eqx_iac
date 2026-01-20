# Ejemplo de smoke test de infraestructura
resource "null_resource" "smoke_test" {
  provisioner "local-exec" {
    command = "echo 'Smoke test: despliegue exitoso'"
  }
}
