

CREATE TABLE HOSPITAL (
Id int identity primary key,
Name nvarchar(150) NOT NULL,
Location nvarchar(150),
PhoneNumber nvarchar(150),
Email nvarchar(150),
PoctAdress nvarchar(150),
HospitalRoomId int references HospitalRoom(Id),
PatientId int references Patient(Id)
)

CREATE TABLE Patient(
Id int identity primary key,
Name nvarchar(150) NOT NULL,
Surname nvarchar(150),
Gender nvarchar(15),
Age int,
)

CREATE TABLE PatientInfo(
Id int identity primary key,
Dateofbirth datetime,
Phone_number nvarchar(150),
Adress nvarchar(150),
PatientId int references Patient(Id)
)

CREATE TABLE Doctor(
Id int identity primary key,
Name nvarchar(150) NOT NULL,
Surname nvarchar(150),
Gender nvarchar(15),

)

CREATE TABLE DoctorInfo(
Id int identity primary key,
Dateofbirth datetime,
Phone_number nvarchar(150),
Adress nvarchar(150),
DoctorId int references Doctor(Id)
)

CREATE TABLE HospitalRoom(
Id int identity primary key,
Name nvarchar(150) NOT NULL,
Roomtype nvarchar(150),
Romestatus nvarchar(150),
Roomnumber nvarchar(150),
)

CREATE TABLE PatientAttendonvisit(
Id int identity primary key,
Datetimeofvisit int,
Attendtype nvarchar(50),
Roomnumber int,
Patients_Id int references Patient(Id)
)

CREATE TABLE Doctorcheckuppaient(
Id int identity primary key,
symptoms nvarchar(150),
diagnosis nvarchar(150),
treatment nvarchar(150),
prescription nvarchar(150),
Patients_Id int references Patient(Id)
)

CREATE TABLE Department(
Id int identity primary key,
Name nvarchar(150) NOT NULL,
)
 
CREATE TABLE HOSPITAL_Department_Id(
Id int identity primary key,
DepartmentId int references Department(Id),
HOSPITALId int references HOSPITAL(Id)
)

CREATE TABLE HOSPITAL_Doctor(
Id int identity primary key,
DoctorId int references Doctor(Id),
HOSPITALId int references HOSPITAL(Id)
)


ALTER TABLE Students
ADD CityId int REFERENCES Cities(Id)

CREATE VIEW PatientReport
AS
SELECT st.Name,
	   Surname,
	   ct.Name 'Country',
	   c.Name 'City',
	   Email,
	   Gender,
	  Age,	  
FROM Patient pt
JOIN Cities c
ON
st.CityId=c.Id

LEFT JOIN Countries ct
ON
c.CountryId=ct.Id