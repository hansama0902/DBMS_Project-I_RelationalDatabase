SELECT
    Patient.first_name,
    Patient.last_name,
    Test.test_type,
    Lab.lab_name
FROM
    Patient
JOIN Survey ON Patient.patient_id = Survey.patient_id
JOIN Test ON Patient.patient_id = Test.patient_id
JOIN Lab ON Test.lab_id = Lab.lab_id;
-- The SQL statement retrieves information about patients, including their first name, last name, the type of test they underwent,
-- and the name of the laboratory that conducted the test.
