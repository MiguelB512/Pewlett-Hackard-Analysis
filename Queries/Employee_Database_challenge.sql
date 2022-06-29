-- Create new table that lists employees retiring by title
SELECT  em.emp_no,
		em.first_name,
		em.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_by_title
FROM employees as em
JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO non_dup_retirement_by_title
FROM retirement_by_title AS ret
WHERE (ret.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * 
FROM non_dup_retirement_by_title;

-- Get count of employees retiring by title
SELECT COUNT(title) AS "Count", title
INTO retiring_titles
FROM non_dup_retirement_by_title
GROUP BY title
ORDER BY "Count" DESC;


-- Creating to membership eligibility table
SELECT DISTINCT ON (em.emp_no) em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
dep.from_date,
dep.to_date,
ti.title
INTO membersip_eligibility
FROM employees as em
JOIN dept_emp as dep
ON (em.emp_no = dep.emp_no) 
JOIN titles as ti
ON (em.emp_no = ti.emp_no) 
WHERE (dep.to_date = '9999-01-01') AND 
(em.birth_date BETWEEN '1965-01-01' AND '1965-12-31'  )
ORDER BY em.emp_no





