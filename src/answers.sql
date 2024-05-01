-- Your answers here:
-- 1
SELECT c.name, COUNT(s.name) 
FROM countries AS c 
INNER JOIN states AS s 
ON c.id = s.country_id
GROUP BY c.name;
-- 2
SELECT COUNT(id) AS employees_without_id 
FROM employees 
WHERE supervisor_id IS NULL;
-- 3
SELECT c.name, o.address, COUNT(e.id) AS employee_count
FROM offices AS o 
JOIN employees AS e ON o.id = e.office_id
JOIN countries AS c ON o.country_id = c.id
GROUP BY c.name, o.address
ORDER BY employee_count DESC, c.name ASC
LIMIT 5;
-- 4
SELECT supervisor_id, COUNT(supervisor_id) AS count FROM employees
GROUP BY supervisor_id
ORDER BY count DESC
LIMIT 3;
-- 5
SELECT COUNT(o.id) AS count FROM offices AS o
JOIN states AS s ON o.state_id = s.id
JOIN countries as c ON o.country_id = c.id
WHERE s.name = 'Colorado' AND c.name = 'United States';
-- 6
SELECT o.name, COUNT(e.id) AS count FROM offices AS o
JOIN employees AS e ON e.office_id = o.id
GROUP BY o.name
ORDER BY count DESC;
-- 7
(SELECT o.name, COUNT(e.id) AS count FROM offices AS o
LEFT JOIN employees AS e ON e.office_id = o.id
GROUP BY o.name
ORDER BY count DESC
LIMIT 1)
UNION
(SELECT o.name, COUNT(e.id) AS count FROM offices AS o
LEFT JOIN employees AS e ON e.office_id = o.id
GROUP BY o.name
ORDER BY count ASC
LIMIT 1)
ORDER BY count DESC;
-- 8
SELECT e.uuid, 
	CONCAT(e.first_name, ' ', e.last_name) AS full_name, 
	e.email, 
	e.job_title, 
	o.name AS company, 
	c.name AS country, 
	s.name AS state, 
	boss.first_name AS boss_name 
FROM employees AS e
JOIN offices AS o ON e.office_id = o.id
JOIN countries AS c ON o.country_id = c.id
JOIN states AS s ON o.state_id = s.id
JOIN employees AS boss ON e.supervisor_id = boss.id;
