--SFTP

INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name,
    params,
    arquetype_name,
    active
) VALUES (
    'process-download-sftp-sat-sbif-mes',
    'fn-request-to-sftp',
    JSON '''
    [
        {"hostname": "35.199.28.127","port": 22,"username": "arquetipo004", "private_key_secret": "sftp-key", "bucket_name": "dev-deinsoluciones-ingestas", "destination_blob_name": "origin-files"}
    ]
    ''',
    'workflow-arquetipo-request-to-sftp',
    TRUE
);



INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
) VALUES (
    'process-download-sftp-sat-sbif-mes',
    'fn-validacion-de-archivo-gcs',
    JSON '''
    [
        {"path_name": "origin-files/sbif-en-miles-mes.parquet", "periodicidad": "mensual"},
        {"path_name": "origin-files/sbif-en-miles-mes.parquet", "periodicidad": "mensual"}
    ]
    ''',
    'workflow-arquetipo-request-to-sftp',
    TRUE
);


SELECT
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
FROM dev_config_zone.process_params
WHERE process_name = 'process-download-sftp-sat-sbif-mes'
--AND process_fn_name = 'fn-request-to-sftp'
AND arquetype_name = 'workflow-arquetipo-request-to-sftp';

--delete from `dev_config_zone.process_email` where process_name = 'process-download-sftp-sat-sbif-mes'


INSERT INTO `dev_config_zone.process_email` (
    process_name, 
    params, 
    zone_name,
    estatus
) VALUES (
    'process-download-sftp-sat-sbif-mes',
    JSON '''
    [
        {
        "email_to_0": "ni.sepulvedaa@gmail.com",
        "email_subj_err": "Resultado Ejecución Proceso: process-download-sftp-sat-sbif-mes [ERROR]", 
        "email_subj_ok": "Resultado Ejecución Proceso: process-download-sftp-sat-sbif-mes [OK]", 
        "email_body_err": "Proces : process-download-sftp-sat-sbif-mes de Arquetipo: workflow-arquetipo-request-to-sftp Ejecutado Con Errores!", 
        "email_body_ok": "Proces : process-download-sftp-sat-sbif-mes de Arquetipo: workflow-arquetipo-request-to-sftp Ejecutado Ok!"
        }
    ]
    ''',
    'ORIGIN',
    1
);