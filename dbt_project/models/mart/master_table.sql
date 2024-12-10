SELECT patient.*, patient_gender.* EXCLUDE (patient_id), encounter.* EXCLUDE (patient_id), observation.* EXCLUDE (patient_id), medication.* EXCLUDE (patient_id, encounter_id), condition.* EXCLUDE (patient_id, encounter_id)
FROM {{ ref('patient') }} as patient
LEFT JOIN {{ ref('patient_gender') }} as patient_gender
    ON patient.patient_id=patient_gender.patient_id
LEFT JOIN {{ ref('encounter') }} as encounter
    ON patient.patient_id=encounter.patient_id
LEFT JOIN {{ ref('observation') }} as observation
    ON patient.patient_id=observation.patient_id
LEFT JOIN {{ ref('medication') }} as medication
    ON encounter.encounter_id=medication.encounter_id
LEFT JOIN {{ ref('condition') }} as condition
    ON encounter.encounter_id=condition.encounter_id