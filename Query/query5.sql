SELECT
    Patient.patient_id,
    Patient.first_name,
    Patient.last_name,
    Test.test_type,
    Test.test_date,
    RANK() OVER (PARTITION BY Patient.patient_id ORDER BY Test.test_date DESC) AS test_rank
FROM
    Patient
JOIN Survey ON Patient.patient_id = Survey.patient_id
JOIN Test ON Patient.patient_id = Test.patient_id

-- Rank each patient's tests based on test date, with the most recent test ranked as 1.
