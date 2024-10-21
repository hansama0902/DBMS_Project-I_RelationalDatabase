SELECT
    doctor_id,
    prescription_id,
    date_issued,
    COUNT(*) OVER (PARTITION BY doctor_id) AS total_prescriptions_per_doctor
FROM
    Prescription;
-- The SQL statement retrieves information about prescriptions, including the doctor_id, prescription_id,
-- and date_issued. It also calculates the total number of prescriptions issued by each doctor.