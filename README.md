# SQL-Tasks-for-Practice

# Employee Management Database

This is a simple SQL database designed to manage employee information, departments, salaries, projects, clients, and their associations. The database consists of the following tables:

1. Employee:
   - Empid (PRIMARY KEY INT): Unique identifier for each employee.
   - Empname (VARCHAR(20)): Name of the employee.
   - DepartmentId (VARCHAR(5)): Identifier for the department the employee belongs to.
   - Contactno (BIGINT): Contact number of the employee.
   - Emailid (VARCHAR(100)): Email address of the employee.
   - Empheadid (INT): ID of the employee's head or manager.

2. EmpDept:
   - DeptId (PRIMARY KEY INT): Unique identifier for each department.
   - DeptName (VARCHAR(100)): Name of the department.
   - Dept_off (VARCHAR(100)): The day on which employees in the department take an off.
   - DeptHead (INT): ID of the department head.

3. EmpSalary:
   - EmpId (PRIMARY KEY INT): Unique identifier for each employee.
   - Salary (VARCHAR(100)): Salary of the employee.
   - IsPermanent (VARCHAR(100)): Indicates whether the employee is permanent or not.

4. Project:
   - ProjectId (PRIMARY KEY INT): Unique identifier for each project.
   - Duration (INT): Duration of the project in months.

5. Country:
   - cid (PRIMARY KEY INT): Unique identifier for each country.
   - cname (VARCHAR(40)): Name of the country.

6. Client:
   - ClientId (PRIMARY KEY INT): Unique identifier for each client.
   - Clientname (VARCHAR(100)): Name of the client.
   - Cid (FOREIGN KEY INT): Foreign key linking to the country the client belongs to.

7. EmpProject:
   - EmpId (FOREIGN KEY INT): Foreign key linking to the employee working on the project.
   - ProjectId (FOREIGN KEY INT): Foreign key linking to the project the employee is assigned to.
   - ClientID (FOREIGN KEY INT): Foreign key linking to the client associated with the project.
   - StartYear (INT): Year in which the employee started working on the project.
   - EndYear (INT): Year in which the employee completed the project.

## Tasks and Sample Queries

The following tasks can be performed using SQL queries on the Employee Management Database:

1. Select the details of the employee whose name starts with P.
2. Find the number of permanent employees with a salary greater than 5000.
3. Retrieve the details of employees whose emailId is in Gmail.
4. List the employees who work either for department 104 or 102.
5. Get the department name for DeptID 102.
6. Calculate the total salary paid to permanent employees.
7. List the names of all employees whose name ends with 'a'.
8. Display the number of employees in each department.
9. Find the number of projects that started in the year 2010.
10. Count the projects that started and finished in the same year.
11. Retrieve the name of the employees whose name's 3rd character is 'h'.
12. Find the department name of the company assigned to the employee whose employee ID is greater than 103.
13. Get the name of the employee who is working under Abhishek.
14. Find the name of the employee who is the department head of HR.
15. Get the name and email of the Department Head who is not permanent.
16. List the employees whose department off is Monday.
17. Retrieve the Indian clients' details.
18. Display the details of all employees working in the Development department.

