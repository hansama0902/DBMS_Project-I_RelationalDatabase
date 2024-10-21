CREATE TABLE PatientManagementAPP (
    patient_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    phone INTEGER,
    DOB DATE,
    address TEXT,
    gender TEXT CHECK(gender IN ('male', 'female', 'other'))
);
CREATE TABLE HealthSurveillance (
    survey_id INTEGER PRIMARY KEY,
    last_sync DATETIME,
    symptom TEXT,
    FOREIGN KEY (survey_id) REFERENCES PatientManagementAPP(patient_id)
);
CREATE TABLE DiseasesHistory (
    survey_id INTEGER,
    diseases_name TEXT,
    PRIMARY KEY (survey_id),
    FOREIGN KEY (survey_id) REFERENCES HealthSurveillance(survey_id)
);
CREATE TABLE Test (
    test_id INTEGER PRIMARY KEY,
    test_type TEXT CHECK(test_type IN ('CBC', 'Antibody', 'CRP')),
    test_date DATETIME,
    survey_id INTEGER,
    lab_id INTEGER,
    FOREIGN KEY (survey_id) REFERENCES HealthSurveillance(survey_id),
    FOREIGN KEY (lab_id) REFERENCES Lab(lab_id)
);
CREATE TABLE Lab (
    lab_id INTEGER PRIMARY KEY,
    lab_name TEXT,
    zipcode TEXT
);
CREATE TABLE LabReport (
    report_id INTEGER PRIMARY KEY,
    illness_name TEXT,
    memo TEXT,
    lab_id INTEGER,
    doctor_id INTEGER,
    FOREIGN KEY (lab_id) REFERENCES Lab(lab_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);
CREATE TABLE Doctor (
    doctor_id INTEGER PRIMARY KEY,
    doctor_name TEXT,
    license_number INTEGER,
    phone INTEGER
);
CREATE TABLE Prescription (
    prescription_id INTEGER PRIMARY KEY,
    date_issued TEXT,
    dosage_instructions TEXT,
    doctor_id INTEGER,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);
CREATE TABLE Medicine (
    medicine_id INTEGER PRIMARY KEY,
    medicine_name TEXT,
    dosage_frequency TEXT,
    prescription_id INTEGER,
    monitor_id INTEGER,
    FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id),
    FOREIGN KEY (monitor_id) REFERENCES MedicineMonitor(monitor_id)
);
CREATE TABLE MedicineMonitor (
    monitor_id INTEGER PRIMARY KEY,
    monitoring_date DATE,
    monitoring_status TEXT,
    FOREIGN KEY (monitor_id) REFERENCES PatientManagementAPP(patient_id)
);
CREATE TABLE Delivery (
    delivery_id INTEGER PRIMARY KEY,
    delivery_date TEXT,
    address INTEGER,
    phone INTEGER
);
CREATE TABLE DeliveryTracer (
    delivery_id INTEGER,
    medicine_id INTEGER,
    PRIMARY KEY (delivery_id, medicine_id),
    FOREIGN KEY (delivery_id) REFERENCES Delivery(delivery_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

