SELECT 
    PATIENT AS 'patient_id', 
    PATHOLOGY AS 'pathology', 
    NUM_SYMPTOMS AS 'num_sypmtoms', 
    SYMPTOMS AS 'symptoms_raw',
    cast(regexp_extract(regexp_extract(SYMPTOMS, 'Rash:[0-9]+'), '[0-9]+') as int) as 'rash',
    cast(regexp_extract(regexp_extract(SYMPTOMS, 'Joint Pain:[0-9]+'), '[0-9]+') as int) as 'joint_pain',
    cast(regexp_extract(regexp_extract(SYMPTOMS, 'Fatigue:[0-9]+'), '[0-9]+') as int) as 'fatigue',
    cast(regexp_extract(regexp_extract(SYMPTOMS, 'Fever:[0-9]+'), '[0-9]+') as int) as 'fever'
FROM {{ source('raw_data', 'symptoms') }}