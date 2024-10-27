CREATE TABLE Survey (
    survey_id INTEGER PRIMARY KEY,
    last_sync DATETIME,
    symptom TEXT,
    immuno_compromised BOOLEAN,
    patient_id INTEGER,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE DiseasesHistory (
    survey_id INTEGER PRIMARY KEY,
    diseases_name TEXT,
    FOREIGN KEY (survey_id) REFERENCES Survey(survey_id)
);

CREATE TABLE Patient (
    patient_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    phone INTEGER,
    DOB DATE,
    address TEXT,
    gender TEXT CHECK(gender IN ('male', 'female', 'other'))
);

CREATE TABLE Test (
    test_id INTEGER PRIMARY KEY,
    test_type TEXT CHECK(test_type IN ('CBC', 'Antibody', 'CRP')),
    test_date DATETIME,
    patient_id INTEGER,
    lab_id INTEGER,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (lab_id) REFERENCES Lab(lab_id)
);

CREATE TABLE Lab (
    lab_id INTEGER PRIMARY KEY,
    lab_name TEXT,
    zipcode TEXT
);

CREATE TABLE Appointment (
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    PRIMARY KEY (patient_id, doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE LabReport (
    report_id INTEGER PRIMARY KEY,
    illness_name TEXT,
    memo TEXT,
    lab_id INTEGER,
    FOREIGN KEY (lab_id) REFERENCES Lab(lab_id)
);

CREATE TABLE Doctor (
    doctor_id INTEGER PRIMARY KEY,
    doctor_name TEXT,
    license_number INTEGER,
    phone INTEGER
);

CREATE TABLE Prescription (
    prescription_id INTEGER PRIMARY KEY,
    date_issued DATETIME,
    dosage_instructions TEXT,
    doctor_id INTEGER,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Medicine (
    medicine_id INTEGER PRIMARY KEY,
    medicine_name TEXT,
    dosage_frequency TEXT,
    patient_id INTEGER,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE MedicineRecord (
    record_id INTEGER PRIMARY KEY,
    medication_issuance_frequency INTEGER,
    medication_issuance_time DATETIME,
    medicine_id INTEGER,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);
