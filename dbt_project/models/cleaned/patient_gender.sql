SELECT 
    Id AS 'patient_id',
    GENDER AS 'patient_gender'
FROM {{ source('raw_data', 'patient_gender') }}