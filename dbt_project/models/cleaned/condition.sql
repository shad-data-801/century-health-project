SELECT 
    PATIENT AS 'patient_id',
    ENCOUNTER AS 'encounter_id',
    START AS 'onset_date',
    STOP AS 'resolved_date',
    CODE AS 'source_code',
    LOWER(DESCRIPTION) as 'source_description'
FROM {{ source('raw_data', 'conditions') }}