CREATE  DATABASE  디지털병간호시스템;
USE 디지털병간호시스템;

CREATE TABLE 현재환자 (
PatientID INT NOT NULL,
PatientName VARCHAR(45) NOT NULL,
Disease VARCHAR(45) NOT NULL,
Sex INT NOT NULL,
Age INT NOT NULL,
PRIMARY KEY (PatientID),
constraint ageconst check (Age >0)
);

CREATE TABLE 현재환자측정데이터 (
PatientID INT NOT NULL,
Waist INT ,
Ache INT,
Sleep INT,
BMI DECIMAL(10,1),
Pressure INT,
HT DECIMAL(10,1),
Hemoglobin DECIMAL(10,1),
Relaxation INT,
Anxiety INT,
Activity INT,
Date_ VARCHAR(45) NOT NULL,

PRIMARY KEY (PatientID,Date_),
FOREIGN KEY(PatientID) REFERENCES 현재환자(PatientID)
);

CREATE TABLE 과거환자(
ID INT NOT NULL,
Sex INT NOT NULL,
Age INT NOT NULL,
Hypertension INT,
Stoke INT,
Myocardial INT,
Angina INT,
Arthritis INT,
Osteoartiritis INT,
Rheumatoid INT,
Tuberculosis int,
Asthma INT,
Diabetes INT,
Hypothyrodism INT,
Stomach INT,
Liver INT,
Cervical INT,
Lung INT,
Thyroid INT,
Depression INT,
Astopy INT,
Rhinitis INT,
Cataract INT,
Glaucoma INT,
HepatitisB INT,
HepatitisC INT,
Waist INT ,
Ache INT,
Sleep INT,
BMI DECIMAL(10,1),
Pressure INT,
HT DECIMAL(10,1),
Hemoglobin DECIMAL(10,1),
Relaxation INT,
Anxiety INT,
Activity INT,
Osteoporosis INT,
Breast INT,

PRIMARY KEY (ID)

);

CREATE TABLE 식단영양소 (
Food CHAR(20) NOT NULL,
Single_serving_calorie DECIMAL(6,1),
Carbonydrate DECIMAL(6,1) ,
Protein DECIMAL(6,1),
Fat DECIMAL(6,1),
Cholesterol DECIMAL(6,1),
Dietary_fiber DECIMAL(6,1),
Sidium DECIMAL(6,1),
Classification VARCHAR(45) NOT NULL,

PRIMARY KEY (Food)
);

CREATE TABLE 약이름 (
Disease  VARCHAR(45) NOT NULL,
Medicine VARCHAR(10) NOT NULL,

PRIMARY KEY (Disease),
FOREIGN KEY(Medicine) REFERENCES 약성분(Medicine),
FOREIGN KEY(Disease) REFERENCES 현재환자(Disease)
);

CREATE TABLE 약성분 (
Medicine VARCHAR(10) NOT NULL,
Ingredient1 VARCHAR(10) ,
Ingredient2 VARCHAR(10) ,

PRIMARY KEY (Medicine)

);

CREATE TABLE 식사 (
PatientID INT NOT NULL,
Date_ VARCHAR(45) NOT NULL,
Diet_ID INT NOT NULL,
Time_  VARCHAR(45) NOT NULL,

PRIMARY KEY (PatientID, Diet_ID ,Time_ ),
FOREIGN KEY(Diet_ID) REFERENCES 식단표(Diet_ID),
FOREIGN KEY(PatientID) REFERENCES 현재환자(PatientID)
);

CREATE TABLE 식단표 (
Diet_ID INT NOT NULL,
Type_  VARCHAR(45), 
Food CHAR(20) NOT NULL,

PRIMARY KEY (Diet_ID,Food ),
FOREIGN KEY(Food) REFERENCES 식단영양소(Food)
);
