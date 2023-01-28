SELECT COUNT(distinct(JOB_ID)) FROM employees;

SELECT COUNT(EMPLOYEE_ID) as _count, ROUND(SUM(SALARY)/COUNT(EMPLOYEE_ID)) as avarage
  FROM employees
  WHERE DEPARTMENT_ID = 90;

SELECT COUNT(*), JOB_ID as job 
  FROM employees 
  group by JOB_ID 
  order by JOB_ID ASC;

SELECT concat(t1.FIRST_NAME, ' ', t1.LAST_NAME) as name,
        t1.DEPARTMENT_ID,
        dep.DEPARTMENT_NAME, 
        group_concat(t2.FIRST_NAME separator ', ') as empls
  FROM employees as t1
    LEFT JOIN employees as t2
      ON t1.DEPARTMENT_ID = t2.DEPARTMENT_ID and t1.EMPLOYEE_ID <> t2.EMPLOYEE_ID
    LEFT JOIN departments as dep
      ON t1.DEPARTMENT_ID = dep.DEPARTMENT_ID
  group by concat(t1.FIRST_NAME, t1.LAST_NAME);

SELECT concat(t1.FIRST_NAME, ', ', t1.LAST_NAME) as name,
        jobs.JOB_TITLE, 
        t1.DEPARTMENT_ID,
        group_concat(t2.FIRST_NAME separator ', ') as employees
  FROM employees as t1
    LEFT JOIN employees as t2
      ON t1.DEPARTMENT_ID = t2.DEPARTMENT_ID and t1.EMPLOYEE_ID <> t2.EMPLOYEE_ID
    LEFT JOIN jobs
      ON t1.JOB_ID = jobs.JOB_ID
    LEFT JOIN departments as dep
      ON t1.DEPARTMENT_ID = dep.DEPARTMENT_ID
    LEFT JOIN locations as loc
      ON dep.LOCATION_ID = loc.LOCATION_ID
  WHERE loc.CITY = 'LONDON'
  group by concat(t1.FIRST_NAME, t1.LAST_NAME);

