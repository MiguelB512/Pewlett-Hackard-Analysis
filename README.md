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


## Summary 
