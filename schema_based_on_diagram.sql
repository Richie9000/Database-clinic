
/* CREATE PATIENTS TABLE */
CREATE TABLE patients (
id int NOT NULL GENERATED ALWAYS AS IDENTITY,
"name" varchar(100) NULL,
date_of_birth date NULL,
CONSTRAINT patients_pk PRIMARY KEY (id)
); 

/* CREATE TABLE MEDICAL HISTORIES */
CREATE TABLE medical_histories (
id int NOT NULL GENERATED ALWAYS AS IDENTITY,
admitted_at timestamp NULL,
patient_id int NULL,
status varchar(100) NULL,
CONSTRAINT medical_histories_pk PRIMARY KEY (id),
CONSTRAINT medical_histories_fk FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE ON UPDATE CASCADE
); 
