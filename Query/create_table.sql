CREATE TABLE Patient (
    patient_id INTEGER,
    first_name TEXT,
    last_name TEXT,
    phone INTEGER,
    DOB DATE,
    address TEXT,
    gender TEXT CHECK(gender IN ('male', 'female', 'other')),
    PRIMARY KEY (patient_id)
);
CREATE TABLE Survey (
    survey_id INTEGER,
    last_sync DATETIME,
    symptom TEXT,
    immuno_compromised BOOLEAN,
    patient_id INTEGER,
    PRIMARY KEY (survey_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);
CREATE TABLE DiseasesHistory (
    survey_id INTEGER,
    diseases_name TEXT,
    PRIMARY KEY (survey_id),
    FOREIGN KEY (survey_id) REFERENCES Survey(survey_id)
);

CREATE TABLE Test (
    test_id INTEGER,
    test_type TEXT CHECK(test_type IN ('CBC', 'Antibody', 'CRP')),
    test_date DATETIME,
    patient_id INTEGER,
    lab_id INTEGER,
    PRIMARY KEY (test_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (lab_id) REFERENCES Lab(lab_id)
);

CREATE TABLE Lab (
    lab_id INTEGER,
    lab_name TEXT,
    zipcode TEXT,
    PRIMARY KEY(lab_id)
);

CREATE TABLE Appointment (
    appointment_id INTEGER,
    appointment_date DATETIME,
    patient_id INTEGER,
    doctor_id INTEGER,
    PRIMARY KEY(appointment_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE LabReport (
    report_id INTEGER,
    illness_name TEXT,
    memo TEXT,
    lab_id INTEGER,
    doctor_id INTEGER,
    PRIMARY KEY(report_id),
    FOREIGN KEY (lab_id) REFERENCES Lab(lab_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Doctor (
    doctor_id INTEGER,
    doctor_name TEXT,
    license_number INTEGER,
    phone INTEGER,
    PRIMARY KEY(doctor_id)
);

CREATE TABLE Prescription (
    prescription_id INTEGER,
    date_issued DATETIME,
    dosage_instructions TEXT,
    doctor_id INTEGER,
    PRIMARY KEY(prescription_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Medicine (
    medicine_id INTEGER,
    medicine_name TEXT,
    dosage_frequency TEXT,
    prescription_id INTEGER,
    PRIMARY KEY(medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id)
);

CREATE TABLE MedicineRecord (
    record_id INTEGER,
    medication_issuance_frequency INTEGER,
    medication_issuance_time DATETIME,
    patient_id INTEGER,
    medicine_id INTEGER,
    PRIMARY KEY(record_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

CREATE TABLE DeliveryTracer (
    patient_id INTEGER,
    medicine_id INTEGER,
    PRIMARY KEY (patient_id, medicine_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);
