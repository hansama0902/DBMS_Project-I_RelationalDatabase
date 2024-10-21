SELECT
    PatientManagementAPP.first_name,
    PatientManagementAPP.last_name,
    HealthSurveillance.symptom,
    Test.test_type
FROM
    PatientManagementAPP
JOIN HealthSurveillance ON PatientManagementAPP.patient_id = HealthSurveillance.survey_id
JOIN Test ON HealthSurveillance.survey_id = Test.survey_id
WHERE
    (PatientManagementAPP.gender = 'male' AND Test.test_type = 'CRP')
    OR (PatientManagementAPP.gender = 'female' AND HealthSurveillance.symptom = 'Cough');
-- The SQL statement retrieves information about patients,
--      including their first and last names, symptoms, and test types.
--      The query filters results based on specific conditions: it selects male patients who have undergone a CRP test
--      or female patients who have reported "Cough" as a symptom. The output provides patient details and relevant health
--      information based on these criteria.