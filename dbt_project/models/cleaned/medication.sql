SELECT 
    PATIENT AS 'patient_id',
    lower(ENCOUNTER) AS 'encounter_id',
    CODE AS 'source_code', 
    DESCRIPTION AS 'source_description',
    strptime(START, '%Y-%m-%dT%H:%M:%SZ') AS 'prescribing_date', 
    STOP AS 'stop_date', 
    PAYER AS 'payer', 
    BASE_COST AS 'base_cost', 
    PAYER_COVERAGE AS 'payer_coverage', 
    DISPENSES AS 'dispenses', 
    TOTALCOST AS 'total_cost', 
    REASONCODE AS 'reason_code',
    LOWER(REASONDESCRIPTION) as 'reason_description'
FROM {{ source('raw_data', 'medications') }}