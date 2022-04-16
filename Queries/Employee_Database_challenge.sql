---------------------------------------------
-- Beginning of Challenge work
---------------------------------------------
-- Checking csv tables before starting
SELECT * FROM employees; -- Returns 300024 rows affected
SELECT * FROM titles; -- Returns 443308 rows affected

---------------------------------------------
-- Deliverable 1: Retirement titles, remove duplicates
---------------------------------------------

-- drop table retirement_titles;

-- Create a table of retirement titles with defined birthdates '1952-01-01' AND '1955-12-31'
select e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date 
	into retirement_titles
	from employees as e
	inner join titles as t
	on(e.emp_no = t.emp_no)
	WHERE (e.birth_date between '1952-01-01' AND '1955-12-31')
	order by e.emp_no ASC;
 

--- Check the generated retirement_titles tables
select * from retirement_titles;

--- export the retirement_titles data to a csv file

-- Use Dictinct with Orderby to remove duplicate 
--- drop table unique_titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
	into unique_titles
	from retirement_titles rt
	WHERE rt.to_date = ('9999-01-01')
	ORDER BY rt.emp_no, 
	rt.to_date DESC;
---SELECT 72458
---Query returned successfully in 547 msec.

select count(u.title),u.title
into retiring_titles
from unique_titles as u
group by u.title
ORDER by count desc;
--- SELECT 7
--- Query returned successfully in 286 msec.


---Deliverable 2: The Employees Eligible for the Mentorship Program
------------------------------------------------------------------------------------------------------------
--- create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program

select DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name ,
	e.birth_date,
	de.from_date,
	de.to_date, 
	t.title 
	into mentorship_eligibility
	from employees e
	inner join dept_emp de
	on (e.emp_no = de.emp_no)
	inner join titles t
	on (e.emp_no = t.emp_no)
	where (t.to_date = '9999-01-01') and 
		 (de.to_date = '9999-01-01') and 
		 e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
		 order by e.emp_no,
		 t.to_date desc;



--- SELECT 1549
--- Query returned successfully in 503 msec.
	
	select * from mentorship_eligibility;

--- Count the total retiring employess for part3, Summary,part2
select sum(count) from retiring_titles;

-- Create mentee counts per titles, is there a good match up of mentors and mentees? 
SELECT COUNT(me.title), me.title
INTO mentee_counts
FROM mentorship_eligibility AS me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;

-- Viewing the mentee counts
SELECT * FROM mentee_counts; -- returns 6 rows, one less than the retiring list (7 rows)
