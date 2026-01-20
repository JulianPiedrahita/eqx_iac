# Instrucciones para crear el proyecto GCP

1. Ve a la consola de Google Cloud Platform.
2. Crea un nuevo proyecto manualmente o usa la CLI:
   ```sh
   gcloud projects create [PROJECT_ID] --name="[PROJECT_NAME]"
   ```
3. Habilita las APIs necesarias:
   ```sh
   gcloud services enable firebase.googleapis.com run.googleapis.com secretmanager.googleapis.com logging.googleapis.com monitoring.googleapis.com sqladmin.googleapis.com
   ```
4. Configura el billing y permisos según tu organización.

> Nota: La creación de proyectos GCP no se recomienda automatizar desde Terraform por temas de permisos y facturación.
