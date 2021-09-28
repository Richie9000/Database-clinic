
/* CREATE PATIENTS TABLE */
CREATE TABLE patients (
id int NOT NULL GENERATED ALWAYS AS IDENTITY,
name varchar(100) NULL,
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
type varchar(100) NULL,
name varchar(100) NULL,
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

CREATE TABLE public.invoices (
id int NOT NULL GENERATED ALWAYS AS IDENTITY,
total_amount decimal NULL,
generated_at timestamp NULL,
payed_at timestamp NULL,
medical_history_id int NULL,
CONSTRAINT invoices_pk PRIMARY KEY (id),
CONSTRAINT invoices_fk FOREIGN KEY (medical_history_id) REFERENCES public.medical_histories(id) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE public.invoice_items ADD CONSTRAINT invoice_items_fk_1 FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE public.medical_histories_treatments (
treatment_id int NULL,
medical_history_id int NULL,
CONSTRAINT medical_histories_treatments_pk PRIMARY KEY (treatment_id,medical_history_id),
CONSTRAINT medical_histories_treatments_fk_1 FOREIGN KEY (treatment_id) REFERENCES public.treatments(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT medical_histories_treatments_fk FOREIGN KEY (medical_history_id) REFERENCES public.medical_histories(id) ON DELETE CASCADE ON UPDATE CASCADE
);
