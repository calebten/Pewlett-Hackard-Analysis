SELECT * from titles
 SELECT emp_no, first_name, last_name
 FROM employees
 SELECT title, from_date, to_date
 FROM titles
 --the following is for questions 3, 4 & 5
 SELECT e.emp_no,
 e.first_name,
 e.last_name,
 t.title,
 t.from_date,
 t.to_date
 INTO retirement_titles
 FROM employees e
 INNER JOIN titles t on e.emp_no=t.emp_no
 AND birth_date between '1952-01-01' and '1955-12-31'
 
 -- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no ,
first_name,
last_name,
title,
from_date,
to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
--This query is for step 15
SELECT DISTINCT ON (emp_no) emp_no ,
first_name,
last_name,
title,
from_date,
to_date
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
SELECT COUNT (*), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (*) DESC
--Deliverable 2	 
select
    emp_no
   ,first_name
   ,last_name
   ,birth_date
   ,from_date
   ,to_date
   ,title
into mentorship_eligibility
from 
  (Select 
      distinct on (d.from_date)  
    e.emp_no
     ,e.first_name
     ,e.last_name
     ,e.birth_date
     ,d.from_date
     ,d.to_date
   ,t.title
   From 
      employees  e
        join	
      dept_emp d
    on e.emp_no = d.emp_no
    join
      titles t
    on e.emp_no = t.emp_no
   Where
  e.birth_date >= date '1965-01-01'
    and
  e.birth_date <=  date '1965-12-31'  -- ISO 8601
	and
  d.to_date = date '9999-01-01'

   Order by 
      d.from_date 
   ) elig_emp
order by  
   emp_no	
   
