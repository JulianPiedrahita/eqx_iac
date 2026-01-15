# Infraestructura Terraform - eqx_iac

## Estructura recomendada

- `modules/` - Módulos reutilizables (ej: cloud_run)
- `envs/dev` - Ambiente de desarrollo
- `envs/prod` - Ambiente de producción
- `global/` - Configuración y documentación global

## Uso

1. Configura el bucket de estado remoto en `backend.tf` de cada ambiente.
2. Completa los valores en `terraform.tfvars`.
3. Ejecuta en la carpeta del ambiente:
   ```sh
   terraform init
   terraform apply
   ```

## Notas
- El estado se almacena en GCS para evitar drift.
- Los módulos permiten reutilización y control de cambios.
- Puedes agregar más módulos según crezcan los recursos.
