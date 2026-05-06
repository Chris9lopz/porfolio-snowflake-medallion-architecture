-- ==== NORMALIZACIÓN DE CIUDADES ====

CREATE OR REPLACE TABLE DMS_ASSESSMENT.SILVER.MAPEO_CIUDADES (
    VARIACION VARCHAR,
    ESTANDAR VARCHAR
);

INSERT INTO SILVER.MAPEO_CIUDADES (VARIACION, ESTANDAR) VALUES
    ('Bogtá', 'BOGOTA'), ('BOGOTA D.C.', 'BOGOTA'), ('bogota D.C.', 'BOGOTA'),
    ('Cúcuta', 'CUCUTA'),
    ('Ibagué', 'IBAGUE'),
    ('Cartagena de Indias', 'CARTAGENA'), ('Cartajena', 'CARTAGENA'),
    ('Santiago de Cali', 'CALI'),
    ('Barranquila', 'BARRANQUILLA'),
    ('Manisales', 'MANIZALES'),
    ('medellín', 'MEDELLIN');
    