-- ==== TRANSFORMACIÓN Y CARGA DE FORMATO XLSX (EXCEL) ====

CREATE OR REPLACE PROCEDURE DMS_ASSESSMENT.UTILS.SP_LOAD_EXCEL_TO_RAW_VARCHAR(file_path STRING, target_table STRING)
RETURNS STRING
LANGUAGE PYTHON
RUNTIME_VERSION = '3.9'
PACKAGES = ('snowflake-snowpark-python', 'pandas', 'openpyxl')
HANDLER = 'main'
EXECUTE AS CALLER
AS
$$
import pandas as pd
from snowflake.snowpark.files import SnowflakeFile

def main(session, file_path, target_table):
    
    # Abrir el archivo desde el Stage CM
    with SnowflakeFile.open(file_path, 'rb') as f:
        # Leer el Excel
        df = pd.read_excel(f)
        
        # Normalizar nombres de columnas
        df.columns = [c.upper().replace(' ', '_') for c in df.columns]
        
        # Conversión masiva e imputación de nulls
        df = df.astype(str).replace(['nan', 'None', 'NAT'], None)
    
    # Escribir en Snowflake
    session.write_pandas(
        df, 
        target_table, 
        auto_create_table=True, 
        overwrite=False, # Mantenemos histórico (Append)
        quote_identifiers=False # Evita problemas con mayúsculas/minúsculas
    )
    
    return f"Éxito: Archivo cargado en la tabla {target_table}"
$$;