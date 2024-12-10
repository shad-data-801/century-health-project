SELECT 
    Id AS 'encounter_id',
    lower(PATIENT) AS 'patient_id',
    ENCOUNTERCLASS AS 'encounter_type',
    START AS 'encounter_start_date',
    STOP AS 'encounter_end_date',
    PROVIDER AS 'attnging_provider_id',
    ORGANIZATION AS 'facility_id',
    CODE AS 'primary_diagnosis_code',
    DESCRIPTION AS 'primary_diagnosis_description',
    PAYER AS 'payer',
    BASE_ENCOUNTER_COST AS 'base_encounter_cost',
    TOTAL_CLAIM_COST AS 'charge_amount',
    PAYER_COVERAGE AS 'payer_coverage',
    REASONCODE AS 'admit_source_code',
    REASONDESCRIPTION AS 'admit_source_description'
FROM {{ source('raw_data', 'encounters') }}