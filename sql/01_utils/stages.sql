-- ==== CREAR STAGING S3 ====
CREATE STAGE staging.s3_staging
  STORAGE_INTEGRATION = snowflake_s3_integration
  URL = 's3://dsm-assessment-s3/raw/';

-- ==== LISTAR ARCHIVOS S3 DE STAGING ====
LIST @staging.s3_staging;