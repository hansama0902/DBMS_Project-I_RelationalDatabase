SELECT
    Doctor.doctor_name,
    COUNT(Prescription.prescription_id) AS prescription_count
FROM
    Doctor
LEFT JOIN
    Prescription ON Prescription.doctor_id = Doctor.doctor_id
GROUP BY
    Doctor.doctor_id;
-- The SQL statement retrieves the name of each doctor along with the count of prescriptions they have issued.
-- It uses a LEFT JOIN to ensure that all doctors are included, even if they have not issued any prescriptions.
