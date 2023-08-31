Select EFName AS EMPLOYEE _NAME from Employee;


Select upper (ELName) from Employee;


Select distinct Dignoses from Patient;


Select substring(PEmail,1,3) from Patient;


Select CONCAT(Field, ' ', SciDegree) AS ' CAREER_INFO ' from Doctor;


Select * from Patient order by PFName asc, PPAge desc;


Select * from Patient where PFName in (' Ibrahim ','Shebl');


Select * from Employee where EFName not in ('Ali','Salah');


Select * from Department where DName like 'Admin%';


Select * from Patient where PFName like '%a%';


Select * from Employee where EFName like '____h';


Select * from Employee where Salary between 4000 and 20000;


Select * from Employee where year(Hired) = 2019 and month(Hired) = 2;


SELECT COUNT(RoomNO) FROM Room WHERE RFloor = 6 ;


SELECT count(CID) FROM Clinic WHERE CAST( CLandLine as nvarchar(50) ) LIKE '2%';


SELECT ELName, Field
FROM Doctor, Specialization
Where ESSN = SpMAnager AND YearsOfExp > 5 ;


SELECT ELName , Salary FROM Employee
WHERE Salary in (SELECT max(Salary) from Employee
					 where Salary not in (SELECT max(Salary) from Employee) );


SELECT DName As 'Name' , QuOfEmps as 'Number of Workers' 
FROM Department ORDER BY QuOfEmps desc



SELECT DName As 'Name' , QuOfEmps as 'Number of Workers' FROM Department 
WHERE QuOfEmps < 20 
ORDER BY QuOfEmps decs;



Select top 1 * from Patient order by PPAge desc; 


SELECT EFName, ELName, Salary from Employee WHERE Salary =(SELECT max(Salary) from Employee);


SELECT Room.RoomNo AS 'Room Number' , 
ICU.UnitNum AS 'ICU Number' ,
Nurse.ELName AS 'Nurse Name' 
FROM ICU , Room , Nurse 
WHERE Room.RNurse = ICU.INurse AND Nurse.ESSN = ICU.INurse ;



SELECT Patient.PLName , Doctor.ELName 
FROM Patient , Doctor 
WHERE Patient.Doctor = Doctor.ESSN ; 



SELECT Client.CLName , Patient.PLName , Visit.Room 
FROM Client , Patient , Visit 
WHERE Visit.Room = Patient.RoomNum AND Visit.Client = Client.CSSN ;



SELECT Clinic.CName , Client.CLName 
FROM Clinic , Reserve , Client
WHERE Reserve.Client = Client.CSSN AND Reserve.Clinic = Clinic.CID ; 



SELECT Nurse.ELName , Doctor.ELName  FROM Nurse , Doctor
WHERE Nurse.Supervisor = Doctor.ESSN ;



SELECT Doctor.ELName , Opration.OpName FROM Doctor , Opration
WHERE Doctor.Op = Opration.OpID AND Doctor.YearsOfExp < 5 ;



SELECT CName FROM Clinic
WHERE Clinic.Specialization = ( SELECT SpID FROM Specialization WHERE SpName = 'Heart') ; 



SELECT * FROM Room WHERE Capacity > 1 ; 


SELECT DName FROM Department
WHERE Manager in ( SELECT ESSN FROM Employee WHERE EAge > 40 OR Salary > 4000 ) ;

