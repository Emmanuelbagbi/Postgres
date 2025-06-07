CREATE TABLE students(
	id SERIAL NOT NULL PRIMARY KEY,
	firstName VARCHAR(55),
	lastName VARCHAR(55),
	createdAt DATE DEFAULT NOW(),
	enrollment VARCHAR(25) DEFAULT 'pending'
)

select * from students


INSERT INTO students(firstName,lastName) VALUES('Bonny','Jackson'),('Michael','PrinceWill'),('Emmyboi','Emmaski');

update students set firstName = 'Richardson', lastName = 'Adebanson' Where id=7;


-- CREATE TABLE employee(
-- 	id SERIAL PRIMARY KEY,
-- 	first_name VARCHAR(50),
-- 	last_name VARCHAR(50),
-- 	age INT,
-- 	department VARCHAR(100),
-- 	hire_date DATE,
-- 	salary NUMERIC(10,2)
-- )

-- INSERT INTO employee (first_name, last_name, age, department, hire_date, salary)
-- VALUES
-- ('John', 'Doe', 30, 'Engineering', '2020-03-15', 60000.00),
-- ('Jane', 'Smith', 27, 'HR', '2021-06-01', 50000.00),
-- ('Michael', 'Johnson', 45, 'Sales', '2019-08-22', 75000.00),
-- ('Emily', 'Davis', 34, 'Marketing', '2020-01-12', 68000.00),
-- ('Chris', 'Lee', 28, 'IT', '2021-11-03', 54000.00),
-- ('Olivia', 'Brown', 41, 'Finance', '2018-09-09', 82000.00),
-- ('Daniel', 'Garcia', 32, 'Engineering', '2020-04-18', 62000.00),
-- ('Sophia', 'Martinez', 29, 'HR', '2021-05-05', 51000.00),
-- ('David', 'Wilson', 37, 'Sales', '2019-10-10', 71000.00),
-- ('Emma', 'Anderson', 26, 'Marketing', '2021-07-25', 49000.00),
-- ('James', 'Taylor', 39, 'Engineering', '2017-12-30', 80000.00),
-- ('Liam', 'Evans', 33, 'HR', '2020-02-20', 56000.00),
-- ('Ethan', 'White', 50, 'Finance', '2016-04-10', 90000.00),
-- ('Ava', 'Hall', 31, 'IT', '2020-07-14', 58000.00),
-- ('Sophia', 'Lopez', 40, 'Sales', '2019-11-21', 73000.00),
-- ('Lucas', 'Green', 38, 'Marketing', '2018-05-06', 67000.00),
-- ('Mason', 'King', 42, 'Engineering', '2017-03-27', 85000.00),
-- ('Ella', 'Scott', 30, 'Finance', '2019-12-11', 78000.00),
-- ('Oliver', 'Baker', 35, 'IT', '2016-06-09', 69000.00),
-- ('Isabella', 'Wright', 29, 'HR', '2020-09-13', 54000.00);

select * from employee

select first_name , hire_date from employee;
select MIN(salary) as least_paid_employee from employee;
select Max(salary) as highest_paid from employee;

select count(*) from employee;
select avg(salary) as avg_salary from employee
select sum(salary) as total_sala from employee

select * from employee
where salary between 30000 and 56000

select first_name, last_name,salary
from employee
where salary > (SELECT AVG(salary) from employee);

-- FIND THE EMPLOYEE IN THE HR DEPARTMENT WHOSE SALARY IS HIGHER THAN THE AVERAGE SALARY IN THE DEPARTMENT
select * from employee
where department = 'HR'
AND salary > (SELECT AVG(salary) from employee)


-- LIST EMPLOYEES WHO ARE OLDER THAN THE OLDEST EMPLOYEE IN THE MARKETING DEPARTMENT
SELECT * from employee where age >
(select MAX(age) from employee 
where department = 'Marketing')

-- FIND THE EMPLOYEE WHO ARE HIRED AFTER THE EARLIEST HIGER DATE IN THE ENGINEERING DEPARTMENT
Select * from employee where hire_date >
(select MIN(hire_date) from employee
where department = 'Engineering')

-- LIST EMPLOYEES IN DEPARTMENT WHERE THE AVERAGE SALARY IS ABOVE 60,000 DOLLAR
SELECT * from employee
where department IN (SELECT department from employee
group by department	
having AVG(salary) > 60000.00)

-- Select * from employee 
-- where department IN('HR','Sales','IT','Engineering','Finance','Marketing')
-- and salary > 60000.00

select first_name, last_name, department from employee
group by first_name, last_name, department

-- LIST EMPLOYEE WHO WERE HIRED BEFORE SOPHIA MARTINEZ

-- FIND THE NUMBER OF EMPLOYEE OLDER THAN YOUNGEST EMPLOYEE IN 'IT'
SELECT count(*) from employee
where age > (select MIN(age) from employee where department = 'IT')

-- FIND THE SECOND HIGHEST PAID EMPLOYEE

SELECT * from employee where salary < (select max(salary)
from employee) order by salary desc limit 1


-- RETURN THE HIGHEST PAID EMPLOYEE FROM EACH DEPARTMENT

-- FIND THE THIRD HIGHEST PAID EMPLOYEE

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Position VARCHAR(50),
    ManagerID INT,  -- References the EmployeeID of another employee (the manager)
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, EmployeeName, Position, ManagerID, Salary) VALUES
(1, 'Alice', 'CEO', NULL, 200000),
(2, 'Bob', 'CTO', 1, 150000),
(3, 'Charlie', 'CFO', 1, 150000),
(4, 'David', 'Senior Developer', 2, 120000),
(5, 'Eve', 'Junior Developer', 4, 80000),
(6, 'Frank', 'Product Manager', 2, 130000),
(7, 'Grace', 'HR Manager', 1, 110000),
(8, 'Hank', 'HR Specialist', 7, 70000),
(9, 'Ivy', 'Sales Manager', 1, 120000),
(10, 'Jake', 'Sales Executive', 9, 90000),
(11, 'Laura', 'Sales Executive', 9, 90000),
(12, 'Mona', 'Finance Analyst', 3, 85000),
(13, 'Nate', 'Finance Associate', 3, 75000),
(14, 'Oscar', 'DevOps Engineer', 2, 95000),
(15, 'Pat', 'Office Assistant', 7, 50000);

SELECT * FROM Employees