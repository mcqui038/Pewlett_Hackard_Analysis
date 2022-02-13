-- Challenge Deliverable 1
SELECT DISTINCT ON(e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
t.title
INTO unique_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no, e.emp_no DESC;

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title), COUNT(ut.title) DESC;

-- Challenge Deliverable 2
SELECT DISTINCT ON(e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO membership_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;