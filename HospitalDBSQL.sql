CREATE DATABASE Hospital 




CREATE TABLE Employee
( 
ESSN int not null PRIMARY KEY ,
EFName nvarchar(30) not null , 
ELName nvarchar(30) not null ,
EAge int not null , 
ESex nvarchar(10) not null , 
EEmail nvarchar(30) not null ,
Phone nvarchar(13) not null , 
Dept int not null , 
Hired date not null ,
Salary int not null ,
WorkHours int not null
)


CREATE TABLE Doctor
(
ESSN int not Null PRIMARY KEY,
ELName nvarchar(30) not Null ,
HireDate date not NULL ,
YearsOfExp int not null ,
Field nvarchar(30) not null ,
SciDegree nvarchar(30) not null , 
Op int null 
)


CREATE TABLE Patient
(
PSSN int not null PRIMARY KEY ,
PFName nvarchar(30) not null , 
PLName nvarchar(30) not null ,
PPAge int not null , 
PSex nvarchar(10) not null , 
PEmail nvarchar(30) not null ,
PPhone nvarchar(13) not null , 
Dignoses nvarchar(100) not null ,
RoomNum int not null ,
EnDate date not null , 
ExpLeave date not null , 
Doctor int not null , 
ExmTime time not null ,
ExmDate date not null , 
ExmPeriod int not null , 
Nurse int not null 
)


CREATE TABLE Client
(
CSSN int not null PRIMARY KEY ,
CFName nvarchar(30) not null , 
CLName nvarchar(30) not null ,
CAge int not null , 
Purpose nvarchar(30) not null , 
CEmail nvarchar(30) not null ,
CPhone nvarchar(13) not null
)


CREATE TABLE Nurse 
( 
ESSN int not null PRIMARY KEY ,
ELName nvarchar(30) not null , 
NShift nvarchar(30) not null ,
Marriage BIT null ,
Supervisor int not null
)


CREATE TABLE HouseKeeper 
( 
ESSN int not null PRIMARY KEY ,
ELName nvarchar(30) not null , 
WkShift nvarchar(30) not null ,
)


CREATE TABLE Department 
( 
Dnum int not null PRIMARY KEY ,
DName nvarchar(30) not null , 
Capacity int not null ,
QuOfEmps int null ,
Manager int not null
)


CREATE TABLE Room 
( 
RoomNo int not null PRIMARY KEY ,
RFloor int not null , 
Capacity int not null ,
RLandLine int null ,
RNurse int not null ,
RHK int not null
)


CREATE TABLE Opration 
(
OpID int not Null PRIMARY KEY,
OpName nvarchar(15) not Null ,
ETA int not NULL , 
OpPeriod int not null
)


CREATE TABLE OperationTheater 
(
THNum int not Null PRIMARY KEY,
THFloor int not Null , 
Operation int not null
)


CREATE TABLE Clinic 
(
CID int not Null PRIMARY KEY,
CName nvarchar(30) not Null ,
CFloor int NULL, 
CLandLine int not Null ,
CShift nvarchar(10) not null ,
Specialization int not null , 
Doct int not null
)


CREATE TABLE ICU
(
UnitNum int not Null PRIMARY KEY,
ICUFloor int not Null ,
IcuLandLine int not NULL ,
INurse int not null ,
IHK int not null
)


CREATE TABLE Specialization
(
SpId int not Null PRIMARY KEY,
SpName nvarchar(30) not Null ,
SpAge int NULL ,
SpMAnager int not null
)
















Alter table Doctor
add foreign key (Op)
references Opration(OpID)


Alter table Nurse
add foreign key (Supervisor)
references Doctor(ESSN)


Alter table Room
add foreign key (RNurse)
references Nurse(ESSN)
Alter table Room
add foreign key (RHK )
references HouseKeeper (ESSN)



Alter table ICU
add foreign key (INurse)
references Nurse(ESSN)
Alter table ICU
add foreign key (IHK )
references HouseKeeper (ESSN)



Alter table OperationTheater
add foreign key (Operation )
references Opration(OpID)


Alter table Specialization
add foreign key (SpMAnager )
references Doctor(ESSN)


Alter table Patient
add foreign key (RoomNum)
references Room(RoomNo) 
Alter table Patient
add foreign key (Nurse)
references Nurse(ESSN)
Alter table Patient
add foreign key (Doctor )
references Doctor(ESSN)


Alter table Clinic
add foreign key (Doct)
references Doctor(ESSN)
Alter table Clinic
add foreign key (Specialization)
references Specialization(SpID)


Alter table Employee
add foreign key (Dept)
references Department(Dnum)


Alter table Department 
add foreign key (MAnager )
references Employee(ESSN)


CREATE TABLE Reserve
(
Clinic int not null,
Client int not NULL , 
RsvDate Date not null, 
RsvTime Time not null
)

Alter table Reserve
add foreign key (Clinic)
references Clinic(CID)
Alter table Reserve
add foreign key (Client )
references Client (CSSN)


CREATE TABLE Visit
(
Room int not null,
Client int not NULL , 
VstDate Date not null, 
VstTime Time not null
)

Alter table Visit
add foreign key (Room)
references Room(RoomNo)
Alter table Visit
add foreign key (Client )
references Client (CSSN)





























