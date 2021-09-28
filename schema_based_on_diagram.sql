
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

/* CREATE TABLE TREATMENTS */
CREATE TABLE treatments (
id int NOT NULL GENERATED ALWAYS AS IDENTITY,
"type" varchar(100) NULL,
"name" varchar(100) NULL,
CONSTRAINT treatments_pk PRIMARY KEY (id)
); 

/* CREATE TABLE INVOICE ITEMS */
CREATE TABLE invoice_items (
id int NOT NULL GENERATED ALWAYS AS IDENTITY,
unit_price decimal NULL,
quantity int NULL,
total_price decimal NULL,
invoice_id int NULL,
treatment_id int NULL,
CONSTRAINT invoice_items_pk PRIMARY KEY (id),
CONSTRAINT invoice_items_fk FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE ON UPDATE CASCADE
); 
