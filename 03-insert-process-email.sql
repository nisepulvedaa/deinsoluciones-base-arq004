INSERT INTO `dev_config_zone.process_email` (
    process_name, 
    params, 
    zone_name,
    estatus
) VALUES (
    'process-{{nombre_proceso}}',
    JSON '''
    [
        {
        "email_to_0": "{{correos_destinatarios}}",
        "email_subj_err": "Resultado Ejecución Proceso: process-{{nombre_proceso}} [ERROR]", 
        "email_subj_ok": "Resultado Ejecución Proceso: process-{{nombre_proceso}} [OK]", 
        "email_body_err": "Proces : process-{{nombre_proceso}} de Arquetipo: workflow-arquetipo-request-to-sftp Ejecutado Con Errores!", 
        "email_body_ok": "Proces : process-{{nombre_proceso}} de Arquetipo: workflow-arquetipo-request-to-sftp Ejecutado Ok!"
        }
    ]
    ''',
    'ORIGIN',
    1
);


----
SELECT
    process_name,
    params,
    zone_name,
    estatus
FROM dev_config_zone.process_email
WHERE process_name = 'process-{{nombre_proceso}}'
AND zone_name = "ORIGIN";