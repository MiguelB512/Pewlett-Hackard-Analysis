# Pewlett-Hackard-Analysis

## Overview 

Pewlett-Hawkard is an international comapany that employs tens of thousands of workers, and just like any other company they have natural turnover with new people coming in and Senior Employees exiting the company. In this analysis we will look at the number of employees reitiring by title, as well as employees who qualify to participate in a mentorship program. This will help future-proof the company and prepare them for changes down the line. 


## Results

### Employees Retiring by Titles

The first step of this analysis was to get the employees retiring by title into a new table, and then get the count totals of each title to have an overview of how many employees would be leaving per title. To do this, the following line of code was used: 

```
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

```
This gave us the information we needed, however it was showing some duplicates due to certain employees having multiple positions throughout their time at the company. With some editing, and a new query, we got the final result that the company was looking for. Below is a sample of the code used to produce the count list and a screenshot of the CSV once it was exported. 

```
-- Get count of employees retiring by title
SELECT COUNT(title) AS "Count", title
INTO retiring_titles
FROM non_dup_retirement_by_title
GROUP BY title
ORDER BY "Count" DESC;
```

![retiring_titles](https://user-images.githubusercontent.com/60283799/176554889-f7d9c11b-d44d-419e-b4ce-9ce8c81dad88.PNG)

This table shows us a few notable things:
- Out of the 72,458 total employees eligible for retirement, over half of them (50,842) are senior positions. This is something that Pewlett-Hawkard would like to address as to not have a high number of vacant senior spots in their workforce.
- The Manager position seems to be in good shape in terms of needing replacements, this could be due to a younger average age for managers or simply a lower number of total managers at the company. 
- This is a very large amount of employees, and Pewlett-Hawkard must start preparing now so that their workflow isn't greatly affected by the departures. 

### Employee Mentorship Program 

The second objective of this analysis was to get a list of employees who qualified for the Employee Mentorship program. The criteria for this program was all current employees who were born in the year 1965. The query for this table was as follows: 
```
-- Creating to membership eligibility table
SELECT DISTINCT ON (em.emp_no) em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
dep.from_date,
dep.to_date,
ti.title
INTO membership_eligibility
FROM employees as em
JOIN dept_emp as dep
ON (em.emp_no = dep.emp_no) 
JOIN titles as ti
ON (em.emp_no = ti.emp_no) 
WHERE (dep.to_date = '9999-01-01') AND 
(em.birth_date BETWEEN '1965-01-01' AND '1965-12-31'  )
ORDER BY em.emp_no
```
This gave us a list of all the employees we needed, with the CSV output looking like this: 

![mentorship_eligibility](https://user-images.githubusercontent.com/60283799/176558319-6167404d-9b26-4149-a7ee-b99a9e45482f.PNG)

With this info, Pewlett-Hawkard can move forward and make decisions on who will fill the departing roles as employees retire. 

We can see that:
- Pewlett-Hawkard has a large workforce, and has a good amount of options to fill these positions. 
- Their success as a company is due to their employees being long-tenured and driving production forward. 


## Summary 

The total number of retiring employees can be found using the query shown below along with the output:
```
SELECT COUNT(emp_no) AS "Total Count of Retiring Employees"
FROM non_dup_retirement_by_title;
```
![Total Count](https://user-images.githubusercontent.com/60283799/176560118-04a2baf8-a7c0-47a3-b2ad-c62933c2ba48.PNG)


Currently at Pewlett-Hawkard, about 64% of the employees are getting ready to retire or entering the mentorship program. This means they will have to go through a rigorous hiring process in the coming years to keep their workforce strong and prepared. They must also account for time it takes to train these new employees and the employees moving up to senior positions in order to be fully prepared. 
