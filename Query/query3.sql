SELECT
    doctor_name,
    COUNT(*) AS prescription_count
FROM
    Prescription
JOIN Doctor on Prescription.doctor_id = Doctor.doctor_id
GROUP BY
    Doctor.doctor_id
HAVING
    COUNT(*) >= 2;
-- The SQL statement retrieves the names of doctors who have issued two
-- or more prescriptions, along with the count of those prescriptions.
