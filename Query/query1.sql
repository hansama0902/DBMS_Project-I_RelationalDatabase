SELECT
    PatientManagementAPP.first_name,
    PatientManagementAPP.last_name,
    Test.test_type,
    Lab.lab_name
FROM
    PatientManagementAPP
JOIN HealthSurveillance ON PatientManagementAPP.patient_id = HealthSurveillance.survey_id
JOIN Test ON HealthSurveillance.survey_id = Test.survey_id
JOIN Lab ON Test.lab_id = Lab.lab_id;
-- The SQL statement retrieves information about patients, including their first name, last name, the type of test they underwent,
-- and the name of the laboratory that conducted the test.
