create database employee;
CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, 
DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20 
09.00.00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 
09.00.00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 
09.00.00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 
09.00.00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 
09.00.00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 
09.00.00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 
09.00.00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 
09.00.00', 'Admin');
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
INSERT INTO Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');
CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
INSERT INTO Title 
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');
# question 1
select first_name as worker_name from worker;
# question2
select upper(first_name) from worker;
# question3
select distinct department from worker;
# question11
select * from worker order by first_name;
# question12
select * from worker order by first_name asc,department desc;
# question 13
select * from worker where first_name in ("Vipul","Satish");
# question 14
select * from worker where first_name not in ("Vipul","Satish");
# question 15
select * from worker where department = "Admin";
# question 16
select * from worker where first_name like '%a%';
# question 17
select * from worker where first_name like 'a%';
# question 19
select * from worker where salary between 100000 and 500000;
# question 21
select count(worker_id) from worker where department = 'Admin';
# question 22
select first_name from worker where salary >= 50000 and salary <= 100000;
# question 23
select count(worker_id),department from worker group by department order by department desc;
# question 24
select * from worker join title on worker_id = worker_ref_id where worker_title = 'Manager';
# question 41
select count(worker_id),department from worker group by department;
# question 43
select * from worker limit 1;
# question 44
select * from worker order by worker_id desc limit 5;
# question 50
select first_name from worker where salary = (select max(salary) from worker);
# question 32
select * from worker limit 10;
# question 28
create table work as select * from worker;
select * from work;