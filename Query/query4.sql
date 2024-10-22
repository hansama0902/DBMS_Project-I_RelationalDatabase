SELECT
    Patient.first_name,
    Patient.last_name,
    Survey.symptom,
    Test.test_type
FROM
    Patient
JOIN Survey ON Patient.patient_id = Survey.patient_id
JOIN Test ON patient.patient_id = Test.patient_id
WHERE
    (Patient.gender = 'male' AND Test.test_type = 'CRP')
    OR (Patient.gender = 'female' AND Survey.symptom = 'Cough');
-- Filter patients based on gender and either symptoms or test type. Male patients must have taken a CRP test, and female patients must have a symptom of 'Cough'.
