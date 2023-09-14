Create Database HR;
Use HR;

/* Part-1 */

/* Answer of Q.1) : Display all information in the tables EMP and DEPT.*/
select * from emp;
select * from dept;

/*  Answer of Q.2) : Display only the hire date and employee name for each employee. */
select First_Name, Last_Name, Hire_Date from emp;

/*  Answer of Q.3) : Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title. */
select concat(First_Name, ' , ', Job_ID) as 'Employee and Title' from emp;

/* Answer of Q.4) : Display the hire date, name and department number for all clerks.*/
select Hire_Date, concat(First_Name, ' ', Last_Name) as 'Name', DEPARTMENT_ID from emp
where Job_ID Like '%clerk';

/* Answer of Q.5) : Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT.*/
select *, ' , ' as "THE OUTPUT" from emp;

/* Answer of Q.6) : Display the names and salaries of all employees with a salary greater than 2000.*/
select concat(First_Name, ' ', Last_Name) as 'Employee Name', SALARY from emp
where salary > 2000;

/* Answer of Q.7) : Display the names and dates of employees with the column headers "Name" and "Start Date".*/
select concat(First_Name, ' ', Last_Name) as 'Name', Hire_Date as 'Start Date' from emp;

/* Answer of Q.8) : Display the names and hire dates of all employees in the order they were hired.*/
select concat(First_Name, ' ', Last_Name) as 'Name', Hire_Date from emp
order by Hire_Date;

/* Answer of Q.9) : Display the names and salaries of all employees in reverse salary order.*/
select concat(First_Name, ' ', Last_Name) as 'Name', Salary from emp
order by Salary DESC;

/* Answer of Q.10) : Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.*/
select concat(First_Name, ' ', Last_Name) as 'EName', DEPARTMENT_ID from emp
Where COMMISSION_PCT Is Not Null
order by Salary DESC;

/* Answer of Q.11) : Display the last name and job title of all employees who do not have a manager.*/
select LAST_NAME, JOB_ID as 'Job Title' from emp
where MANAGER_ID Is Null;

/* Answer of Q.12) : Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000.*/
select Last_Name, Job_ID, Salary from emp
where (Job_ID = 'SL_RP' OR Job_ID = 'ST_CLERK')
And (Salary NOT IN ('2500', '3500' OR '5000'));

/*Part-2*/

/* Answer Q.1) : Display the maximum, minimum and average salary and commission earned.*/
Select Max(Salary) as 'Maximum Salary',
Min(Salary) as 'Minimum Salary',
Avg(Salary) as 'Average Salary',
Max(COMMISSION_PCT) as 'Maximum Commission',
Min(COMMISSION_PCT) as 'Minimum Commission',
Avg(COMMISSION_PCT) as 'Average Commission'
from emp;

/* Answer Q.2) : Display the department number, total salary payout and total commission payout for each department.*/
Select Department_ID,
Sum(Salary) as 'Total Salary Payout',
Sum(COMMISSION_PCT) as 'Total Commission Payout'
from emp
Group By Department_ID;

/* Answer Q.3) : Display the department number and number of employees in each department.*/
Select Department_ID,
Count(EMPLOYEE_ID) as 'Number or Employees'
from emp
Group By Department_ID;

/* Answer Q.4) : Display the department number and total salary of employees in each department.*/
Select Department_ID,
Sum(Salary) as 'Total Salary'
from emp
Group By Department_ID;

/* Answer Q.5) : Display the employee's name who doesn't earn a commission. Order the result set without using the column name.*/
select concat(First_Name, ' ', Last_Name) as 'Employee Name'
from emp
Where COMMISSION_PCT Is Null
Order By 1;

/* Answer Q.6) : Display the employees name, department id and commission. If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately.*/
select concat(First_Name, ' ', Last_Name) as 'Employee Name',
Department_ID, COMMISSION_PCT,
Case
When COMMISSION_PCT Is Null Then 'No Commission'
Else 'Commission'
End As 'Appropriately'
from emp;

/* Answer Q.7) : Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns appropriately.*/
select concat(First_Name, ' ', Last_Name) as 'Employee Name', Salary,
Case
When COMMISSION_PCT Is Not Null Then COMMISSION_PCT * 2
Else 'No Commission'
End As 'Appropriately'
from emp;

/* Answer Q.8) : Display the employee's name, department id who have the first name same as another employee in the same department.
select concat(First_Name, ' ', Last_Name) as 'Employee Name', Department_ID
From emp
Where First_Name = First_Name
And Employee_ID != Employee_ID
Order By Department_ID, First_Name*/

/* Answer Q.9) : Display the sum of salaries of the employees working under each Manager.*/
Select 
Manager_ID , Sum(Salary) as 'Total Salary'
from emp
Group By Manager_ID;

/* Answer Q.10) : Select the Managers name, the count of employees working under and the department ID of the manager.
Select Manager_ID, Count(Employee_ID) as 'Count of Employees', Department_ID*/

/* Answer Q.11) : Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a'.
Select concat(First_Name, ' ', Last_Name) as 'Employee Name', Department_ID, Salary
From emp
Group By Manager_ID
And Where Last_Name Like '_a%';*/

/* Answer Q.12) : Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id.
Select Department_ID, Avg(Salary) as 'Average Salary'
from (
	Select Depertment_ID, Sum(Salary) as 'Total Salary'
    from emp
    Group By Deparment_ID
    )
    as 'Department Salaries'
    Group By Department_ID
    Order By Department_ID;*/
    
/* Answer Q.13) : Select the maximum salary of each department along with the department id.*/
Select Department_ID, Max(Salary) as 'Maximum Salary'
from emp
Group By Department_ID;  

/* Answer Q.14) : Display the commission, if not null display 10% of salary, if null display a default value 1.*/
Select Employee_ID,
Case
	When COMMISSION_PCT Is Not Null Then salary * 0.10
    Else 1
    End as 'Commission Result'
    From emp
    Order By Employee_ID;
    
/* Part-3 */
/* Answer Q.1) : Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other 
letters lowercase, Give each column an appropriate label.*/



/* Answer Q.2): Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; 
last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.  */
Select concat_ws("-", First_Name,Last_Name) as 'Employee-Name' ,
Month(Hire_Date) as 'Joined in Month'
from emp
Where First_Name Like '%a%'
and Last_Name Like '%a%';

/* Answer Q.3) : Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase 
the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.*/
Select Last_Name,
Case
	When Salary - 0.5 > 10000 Then Salary + 0.10
    Else Salary + 0.115 + 1500
    End As Increment
From emp;

/* Answer Q.4) : Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and 
the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! 
Select 
    CONCAT(
        SUBSTRING(EMPLOYEE_ID, 1, 2), 
        '00',                          
        SUBSTRING(EMPLOYEE_ID, 3),     
        'E'                           
    ) AS Altered Employee_ID,
    UPPER(DEPARTMENT_ID) AS Altered Department_ID,
    SALARY,
    REPLACE(UPPER(FIRST_NAME), 'Z', '$!') AS Altered Manager Name
FROM
    emp;*/

/* Answer Q.5) : Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, 
and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results 
by the employees' last names.*/
Select
	Concat(
		Upper(Left(Last_Name,-1)),
        Lower(Substring(Last_Name,2))
        ) AS 'Employee Name',
        Length(Last_Name) As 'Length of Name'
from emp
Where 
	Last_Name Like 'J%' OR
	Last_Name Like 'A%' OR
    Last_Name Like 'M%'
Order By Last_Name;

/* Answer Q.6) : Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. 
Label the column SALARY. */
Select Last_Name,
	   Lpad(Concat('$', Salary), 15, '$') As 'SALARY'
From emp;

/* Answer Q.7) : Display the employee's name if it is a palindrome.*/
Select First_Name
From emp
Where First_Name = Reverse(First_Name);

/* Answer Q.8) : Display First names of all employees with initcaps.
Select Concat(Upper(Substring(First_Name, 1, 1)),
			  Lower(Substring(First_Name, 2)) As 'Initcaps First Name';*/

/* Answer Q.9) : From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.*/



/* Answer Q.10) : Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end.
Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name.
Select Concat(Lower(Left(First_Name, 1)),
			  Lower(Last_Name),
              '@systechusa.com',
              ) As 'e-mail address',
              First_Name
From emp; */

/* Answer Q.11) : Display the names and job titles of all employees with the same job as Trenna. */
Select concat(First_Name, ' ', Last_Name) as 'Employee Name', Job_ID
From emp
Where Job_ID = (Select Job_ID from emp Where First_Name = "Trenna");

/* Answer Q.12) : Display the names and department name of all employees working in the same city as Trenna. */



/* Answer Q.13) : Display the name of the employee whose salary is the lowest.*/
Select concat(First_Name, ' ', Last_Name) as 'Employee Name', Salary
From emp
Order By Salary
Limit 1;

/* Answer Q.14) : Display the names of all employees except the lowest paid. */
Select concat(First_Name, ' ', Last_Name) as 'Employee Name', Salary
From Emp
Where Salary > (Select Min(Salary) From Emp);

/*Part-4*/

/* Answer Q.1) : Write a query to display the last name, department number, department name for all employees.*/
Select Last_Name, Department_ID, DEPARTMENT_NAME From Emp;

/* Answer Q.2) : Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
Select Distinct Job_ID
Where Department_ID = "4"
From Emp;*/

/* Answer Q.3) : Write a query to display the employee last name,department name,location id and city of all employees who earn commission.*/
Select Last_Name, Department_Name, Location
From Emp
Where Commission_Pct Is Not Null;

/* Answer Q.4) : Display the employee last name and department name of all employees who have an 'a' in their last name  .*/
Select Last_Name, Department_Name
From Emp
Where Last_Name Like 'a%';

/* Answer Q.5) : Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. */
Select Last_Name, Department_ID, Department_Name
From Emp
Where Location = 'ATLANTA';

/* Answer Q.6) : Display the employee last name and employee number along with their manager's last name and manager number.  */
Select Employee_ID, Last_Name, Manager_ID
From Emp
Where Employee_ID = Manager_ID
Order By Manager_ID;

/* Answer Q.7) : Display the employee last name and employee number along with their manager's last name and manager number 
(including the employees who have no manager).*/


/* Answer Q.8) : Create a query that displays employees last name,department number,and all the employees who work in the same 
department as a given employee.*/
Select Last_Name, Department_ID, Department_Name
From Emp
Order By Department_Name;

/* Answer Q.9) : Create a query that displays the name,job,department name,salary,grade for all employees.  Derive grade based on 
salary(>=50000=A, >=30000=B,<30000=C) .*/
Select concat(First_Name, ' ', Last_Name) as 'Employee Name', Job_ID, Department_Name, Salary,
Case
	When Salary >=50000 Then 'A'
    When Salary >=30000 Then 'B'
    Else 'C'
    End As Grade
From Emp;

/* Answer Q.10) : Display the names and hire date for all employees who were hired before their managers along with
 their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date.*/
 













