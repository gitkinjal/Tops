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
manager name and the employee last name should have second letter 'a!'
Select concat(First_Name, ' ', Last_Name) as 'Employee Name', Department_ID, Salary
From emp
Group By Manager_ID
And Last_Name Like '%a!';*/

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


