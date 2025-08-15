--SFTP
INSERT INTO `dev_config_zone.process_params` (
    process_name,
    process_fn_name,
    params,
    arquetype_name,
    active
) VALUES (
    'process-{{nombre_proceso}}',
    'fn-request-to-sftp',
    JSON '''
    [
        {"hostname": "{{hostname}}","port": 22,"username": "{{sftp-username}}", "private_key_secret": "{{sftp-secret-key}}", "bucket_name": "dev-deinsoluciones-ingestas", "destination_blob_name": "origin-files"}
    ]
    ''',
    'workflow-arquetipo-request-to-sftp',
    TRUE
);

----
SELECT
    process_name,
    process_fn_name, 
    params, 
    arquetype_name,
    active
FROM dev_config_zone.process_params
WHERE process_name = 'process-{{nombre_proceso}}'
AND process_fn_name = 'fn-request-to-sftp'
AND arquetype_name = 'workflow-arquetipo-request-to-sftp';