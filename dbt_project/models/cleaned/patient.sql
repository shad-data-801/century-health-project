SELECT
    PATIENT_ID AS 'patient_id',
    regexp_replace(FIRST, '[0-9]', '', 'g') as 'first_name',
    regexp_replace(LAST, '[0-9]', '', 'g') as 'last_name', 
    RACE as 'race',
    BIRTHDATE as 'birth_date',
    DEATHDATE as 'death_date',
    IF(DEATHDATE IS NULL, true, false) AS 'death_flag',
    SSN as 'social_security_number',
    ADDRESS AS 'address',
    CITY AS 'city',
    STATE AS 'state',
    ZIP AS 'zip_code',
    COUNTY AS 'county',
    LAT AS 'latitude',
    LON AS 'longitude',
    'Lupus Example' AS 'data_source',
    'patients.csv' AS 'file_name',
    current_date() AS 'ingest_datetime',
    DRIVERS AS 'drivers_license',
    PASSPORT AS 'passport_number',
    PREFIX AS 'prefix',
    SUFFIX AS 'suffix',
    regexp_replace(MAIDEN, '[0-9]', '', 'g') AS 'maiden_name',
    MARITAL AS 'marital_status',
    ETHNICITY AS 'ethnicity',
    BIRTHPLACE AS 'birthplace',
    FIPS::INT AS 'fips_code',
    HEALTHCARE_EXPENSES AS 'healthcare_expenses',
    HEALTHCARE_COVERAGE AS 'healthcare_coverage',
    abs(INCOME) AS 'income'
FROM {{ source('raw_data', 'patients') }}