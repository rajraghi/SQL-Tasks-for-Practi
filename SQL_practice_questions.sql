create database employee_project;
use employee_project;

-- Create a table Employee

CREATE TABLE Employee (
    Empid INT PRIMARY KEY,
    Empname VARCHAR(20),
    DepartmentId VARCHAR(5),
    Contactno BIGINT,
    Emailid VARCHAR(100),
    Empheadid INT
);


INSERT INTO Employee (Empid, Empname, DepartmentId, Contactno, Emailid, Empheadid)
VALUES
    (1, 'Aarav Kumar', '104', 9876543212, 'aarav.kumar@example.com', 9),
    (2, 'Ananya Sharma', '105', 8765432102, 'ananya.sharma@example.com', 10),
    (3, 'Advait Patel', '106', 7654321092, 'advait.patel@example.com', 11),
    (4, 'Aanya Joshi', '102', 6543210982, 'aanya.joshi@example.com', 7),
    (5, 'Arjun Verma', '103', 5432109872, 'arjun.verma@example.com', 6),
    (6, 'Avni Desai', '101', 4321098762, 'avni.desai@example.com', 12),
    (7, 'Aryan Singh', '102', 3210987652, 'aryan.singh@example.com', 5),
    (8, 'Anika Reddy', '103', 2109876542, 'anika.reddy@example.com', 7),
    (9, 'Aditya Bhat', '104', 1098765433, 'aditya.bhat@example.com', 9),
    (10, 'Aisha Choudhary', '105', 1098765438, 'aisha.choudhary@example.com', 10);

select * from employee;

-- Create a table EmpDept

CREATE TABLE EmpDept (
    DeptId INT PRIMARY KEY,
    DeptName VARCHAR(100),
    Dept_off VARCHAR(100),
    DeptHead INT
);

INSERT INTO EmpDept (DeptId, DeptName, Dept_off, DeptHead)
VALUES
    (101, 'HR', 'Sunday', 1),
    (102, 'Development', 'Saturday', 5),
    (103, 'Sales', 'Friday', 2),
    (104, 'Marketing', 'Monday', 3),
    (105, 'Finance', 'Wednesday', 4),
    (106, 'Operations', 'Tuesday', 6);
    
-- Create a table EmpSalary

CREATE TABLE EmpSalary (
    EmpId INT PRIMARY KEY,
    Salary VARCHAR(100),
    IsPermanent VARCHAR(100)
);

INSERT INTO EmpSalary (EmpId, Salary, IsPermanent)
VALUES
    (1, '50000', 'yes'),
    (2, '60000', 'yes'),
    (3, '45000', 'no'),
    (4, '55000', 'yes'),
    (5, '70000', 'yes'),
    (6, '52000', 'no'),
    (7, '48000', 'yes'),
    (8, '62000', 'yes'),
    (9, '48000', 'no'),
    (10, '60000', 'yes');

-- Create a table Project

CREATE TABLE Project (
    ProjectId INT PRIMARY KEY,
    Duration INT
);

INSERT INTO Project (ProjectId, Duration)
VALUES
    (101, 6),
    (102, 8),
    (103, 4),
    (104, 10),
    (105, 12),
    (106, 5),
    (107, 9),
    (108, 7),
    (109, 11),
    (110, 3);

-- Create a table Country

CREATE TABLE Country (
    cid INT PRIMARY KEY,
    cname VARCHAR(40)
);

INSERT INTO Country (cid, cname)
VALUES
    (1, 'India'),
    (2, 'United States'),
    (3, 'United Kingdom'),
    (4, 'Canada'),
    (5, 'Australia'),
    (6, 'Germany'),
    (7, 'France'),
    (8, 'Japan'),
    (9, 'Brazil'),
    (10, 'Italy');
    
-- Create a table Client

CREATE TABLE Client (
    ClientId INT PRIMARY KEY,
    Clientname VARCHAR(100),
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country (cid)
);

INSERT INTO Client (ClientId, Clientname, Cid)
VALUES
    (201, 'ABC Corp', 1),   
    (202, 'XYZ Inc', 2),    
    (203, 'MNO Ltd', 3),    
    (204, 'PQR Industries', 4), 
    (205, 'LMN Solutions', 5);  

-- Create a table EmpProject

CREATE TABLE EmpProject (
    EmpId INT,
    ProjectId INT,
    ClientID INT,
    StartYear INT,
    EndYear INT,
    FOREIGN KEY (EmpId) REFERENCES Employee (Empid),
    FOREIGN KEY (ProjectId) REFERENCES Project (ProjectId),
    FOREIGN KEY (ClientID) REFERENCES Client (ClientId)
);

INSERT INTO EmpProject (EmpId, ProjectId, ClientID, StartYear, EndYear)
VALUES
    (101, 201, 201, 2020, 2021), 
    (102, 202, 202, 2021, 2023),  
    (103, 201, 201, 2020, 2021),  
    (104, 204, 203, 2022, 2023),  
    (105, 203, 203, 2021, 2022),  
    (106, 202, 202, 2021, 2022),
    (107, 204, 203, 2022, 2023),  
    (108, 201, 201, 2020, 2021),
    (109, 202, 202, 2021, 2023), 
    (110, 203, 203, 2021, 2022);


/* Select the detail of the employee whose name starts with P */

SELECT * FROM Employee WHERE Empname LIKE 'P%';

/* How many permanent employees take a salary more than 5000 */

SELECT COUNT(*) FROM EmpSalary WHERE IsPermanent = 'yes' AND Salary > '5000';

/* Select the detail of employees whose emailId is in Gmail */

SELECT * FROM Employee WHERE Emailid LIKE '%@gmail.com';

/* Select the details of the employees who work either for department 104 or 102 */

SELECT * FROM Employee WHERE DepartmentId IN ('104', '102');

/* What is the department name for DeptID 102 */

SELECT DeptName FROM EmpDept WHERE DeptId = 102;

/* What is the total salary that is paid to permanent employees */

SELECT SUM(Salary) FROM EmpSalary WHERE IsPermanent = 'yes';

/* List the name of all employees whose name ends with 'a' */

SELECT Empname FROM Employee WHERE Empname LIKE '%a';

/* List the number of departments of employees in each project */

SELECT ProjectId, COUNT(DISTINCT DepartmentId) AS NumberOfDepartments
FROM Employee
GROUP BY ProjectId;

/* How many projects started in the year 2010 */

select count(*)
from EmpProject 
where startyear = 2010; 

/* Select the name of the employee whose name's 3rd character is 'h' */

SELECT Empname FROM Employee WHERE SUBSTRING(Empname, 3, 1) = 'h';

/* Select the department name of the company which is assigned to the employee whose employee id is greater than 103 */

SELECT DeptName FROM EmpDept WHERE DeptId IN (SELECT DepartmentId FROM Employee WHERE Empid > 3);

/* Select the name of the employee who is working under Abhishek */

SELECT Empname FROM Employee WHERE Empheadid IN (SELECT Empid FROM Employee WHERE Empname = 'Abhishek');

/* Select the name of the employee who is the department head of HR */

SELECT E.Empname
FROM Employee E
INNER JOIN EmpDept D ON E.Empid = D.DeptHead
WHERE D.DeptName = 'HR';

/* Select the name and email of the Dept Head who is not Permanent */

select Employee.Empname, Employee.Emailid
from Employee
join EmpDept on Employee.Empid = EmpDept.DeptHead
join Empsalary on Employee.Empid = EmpSalary.EmpId
where EmpSalary.IsPermanent = 'no';

/* Select the employee whose department off is Monday */

select Employee.*
from Employee
join EmpDept on Employee.DepartmentId = EmpDept.DeptId
where EmpDept.Dept_off = 'Monday'; 

/* Select the Indian clients' details */

select Client.* from Client
join Country on Client.Cid = Country.cid
where Country.cname = 'India'; 

/* Select the details of all employees working in the Development department */

select Employee.* from Employee
join EmpDept on Employee.DepartmentId = EmpDept.DeptId
where EmpDept.DeptName = 'Development';













