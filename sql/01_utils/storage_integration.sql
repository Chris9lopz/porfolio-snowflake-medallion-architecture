-- ==== CREAR LA INTEGRACIÓN CON AWS S3 ====
CREATE STORAGE INTEGRATION snowflake_s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<ACCOUNT_ID>:role/SnowflakeS3AccessRole'
  STORAGE_ALLOWED_LOCATIONS = ('s3://dsm-assessment-s3/raw/');

-- ==== GENERAR LA INFORMACIÓN DEL ROL A AWS ====
DESC INTEGRATION snowflake_s3_integration;