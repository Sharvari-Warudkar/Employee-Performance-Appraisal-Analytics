/* 1. Employees with rating less than 2 */

SELECT *
FROM emp_record_table
WHERE emp_rating < 2;


/* 2. Employees with rating greater than 4 */

SELECT *
FROM emp_record_table
WHERE emp_rating > 4;


/* 3. Employees with rating between 2 and 4 */

SELECT *
FROM emp_record_table
WHERE emp_rating BETWEEN 2 AND 4;


/* 4. Employee full names */

SELECT
    emp_id,
    CONCAT(first_name,' ',last_name) AS employee_name
FROM emp_record_table;


/* 5. Employees from Finance department */

SELECT
    emp_id,
    CONCAT(first_name,' ',last_name) AS employee_name
FROM emp_record_table
WHERE dept='FINANCE';


/* 6. Employee and manager details */

SELECT
       E.emp_id,
       CONCAT(E.first_name,' ',E.last_name) AS employee_name,
       CONCAT(M.first_name,' ',M.last_name) AS manager_name
FROM emp_record_table E
LEFT JOIN emp_record_table M
ON E.manager_id=M.emp_id;


/* 7. Employees from Healthcare and Finance */

SELECT *
FROM emp_record_table
WHERE dept IN ('HEALTHCARE','FINANCE');


/* 8. Maximum rating within each department */

SELECT
       emp_id,
       first_name,
       dept,
       emp_rating,
       MAX(emp_rating) OVER(PARTITION BY dept) AS max_department_rating
FROM emp_record_table;


/* 9. Minimum and maximum salary by role */

SELECT
       role,
       MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary
FROM emp_record_table
GROUP BY role;


/* 10. Employee ranking based on experience */

SELECT
       emp_id,
       first_name,
       last_name,
       exp,
       RANK() OVER(ORDER BY exp DESC) AS experience_rank
FROM emp_record_table;


/* 11. Employees having salary greater than 6000 */

SELECT *
FROM emp_record_table
WHERE salary > 6000;


/* 12. Employees with experience greater than 10 years */

SELECT *
FROM emp_record_table
WHERE exp > 10;


/* 13. Bonus calculation */

SELECT
       emp_id,
       first_name,
       salary,
       emp_rating,
       salary * 0.05 * emp_rating AS bonus
FROM emp_record_table;


/* 14. Average salary by country */

SELECT
       country,
       AVG(salary) AS avg_salary
FROM emp_record_table
GROUP BY country;


/* 15. Average salary by continent */

SELECT
       continent,
       AVG(salary) AS avg_salary
FROM emp_record_table
GROUP BY continent;


/* 16. Highest salary employee */

SELECT *
FROM emp_record_table
WHERE salary = (
      SELECT MAX(salary)
      FROM emp_record_table
);


/* 17. Employee project details */

SELECT
       E.emp_id,
       CONCAT(E.first_name,' ',E.last_name) AS employee_name,
       P.proj_name,
       P.domain,
       P.status
FROM emp_record_table E
INNER JOIN proj_table P
ON E.proj_id=P.project_id;


/* 18. Department-wise employee count */

SELECT
       dept,
       COUNT(*) AS total_employees
FROM emp_record_table
GROUP BY dept;


/* 19. Role-wise employee count */

SELECT
       role,
       COUNT(*) AS total_employees
FROM emp_record_table
GROUP BY role;


/* 20. Validate job profile based on experience */

SELECT
       emp_id,
       first_name,
       role,
       exp,
       CASE
           WHEN exp <=2 THEN 'JUNIOR DATA SCIENTIST'
           WHEN exp BETWEEN 3 AND 5 THEN 'ASSOCIATE DATA SCIENTIST'
           WHEN exp BETWEEN 6 AND 10 THEN 'SENIOR DATA SCIENTIST'
           WHEN exp BETWEEN 11 AND 12 THEN 'LEAD DATA SCIENTIST'
           ELSE 'MANAGER'
       END AS expected_role
FROM emp_record_table;
SELECT
    emp_id,
    first_name,
    last_name,
    salary
FROM emp_record_table
ORDER BY salary DESC
LIMIT 3;
SELECT
    dept,
    AVG(salary) AS avg_salary
FROM emp_record_table
GROUP BY dept
ORDER BY avg_salary DESC;
SELECT
    status,
    COUNT(*) AS total_projects
FROM proj_table
GROUP BY status;
