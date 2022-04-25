USE `lw4`;
SET SQL_SAFE_UPDATES = 0;

-- INSERT
-- 3.1.a Без указания списка полей
INSERT INTO employee VALUES(default ,'Mihail', 'Petrovich', 'Zybenko', '1962-07-09', 30000000);

-- 3.1.b С указанием списка полей
INSERT INTO client (client_id, name, country, address, specialization) VALUES(default, 'PS', 'Russia', ' Irkutskaya oblast, Irkutsk, Pervomayskiy Mkrn, bld. 2, appt. 64', 'development');

-- 3.1.c С чтением из другой таблицы
DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate` LIKE `employee`;
INSERT INTO candidate (employee_id, first_name, middle_name, last_name, birth_date, salary) VALUES (default,'Mihail', 'Pavlovich', 'Terentev', '2007-01-01', 5);

INSERT INTO employee (employee_id, first_name, middle_name, last_name, birth_date, salary)
SELECT employee_id, first_name, middle_name, last_name, birth_date, salary FROM candidate
WHERE last_name = 'Zybenko';

DROP TABLE candidate;


-- DELETE
-- 3.2.a Всех записей
DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate` LIKE `employee`;
INSERT INTO candidate (employee_id, first_name, middle_name, last_name, birth_date, salary) VALUES (default,'Mihail', 'Pavlovich', 'Terentev', '2007-01-01', 5);

DELETE FROM candidate;

DROP TABLE candidate;

-- 3.2.b По условию
DELETE FROM employee WHERE employee_id > 20;


-- UPDATE
-- 3.3.a Всех записей
UPDATE project SET description = 'ooops';

-- 3.3.b По условию обновляя один атрибут
UPDATE project SET description = NULL
WHERE description = 'ooops';

-- 3.3.c По условию обновляя несколько атрибутов
UPDATE project SET description = 'empty', name = 'Unknown'
WHERE name = 'Straw Toupee';


-- SELECT
-- 3.4.a С набором извлекаемых атрибутов
SELECT first_name, last_name, middle_name FROM employee;

-- 3.4.b Со всеми атрибутами
SELECT * FROM employee;

-- 3.4.c С условием по атрибуту
SELECT * FROM employee WHERE salary = 2500;


-- SELECT ORDER BY + TOP (LIMIT)
-- 3.5.a С сортировкой по возрастанию ASC + ограничение вывода количества записей
SELECT employee_id, first_name, middle_name, last_name, salary FROM employee
ORDER BY salary ASC
LIMIT 10;

-- 3.5.b С сортировкой по убыванию DESC
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 5;

-- 3.5.c С сортировкой по двум атрибутам + ограничение вывода количества записей
SELECT * FROM employee
ORDER BY last_name, salary
LIMIT 5;

-- 3.5.d С сортировкой по первому атрибуту, из списка извлекаемых
SELECT * FROM employee
ORDER BY employee_id ASC;


-- 3.6 Работа с датами
-- a WHERE по дате
SELECT * FROM project
WHERE deadline_date > '2020-01-01 00:00:00';

-- b WHERE дата в диапазоне
SELECT * FROM project
WHERE deadline_date BETWEEN '2002-01-01 00:00:00' AND '2050-01-01 00:00:00';

-- c Извлечь из таблицы не всю дату, а только год
SELECT YEAR(deadline_date) FROM project
WHERE name = 'Appropriate Logbook';


-- 3.7 Функции агрегации
-- a. Посчитать количество записей в таблице
SELECT COUNT(*) FROM client;

-- b. Посчитать количество уникальных записей в таблице
SELECT DISTINCT COUNT(*) FROM client;

-- c. Вывести уникальные значения столбца
SELECT DISTINCT first_name FROM employee;

-- d. Найти максимальное значение столбца
SELECT MAX(salary) FROM employee;

-- e. Найти минимальное значение столбца
SELECT MIN(salary) FROM employee;

-- f. Написать запрос COUNT() + GROUP BY
SELECT last_name, COUNT(*) AS project_count FROM employee
GROUP BY last_name;


-- 3.8. SELECT GROUP BY + HAVING
-- a. Написать 3 разных запроса с использованием GROUP BY + HAVING
-- 1. Посчитать клиентов с профилем разработки UX-design в каждой стране
SELECT country, specialization, COUNT(*) AS count FROM client
GROUP BY country, specialization
HAVING specialization = 'UX-design';

-- 2. Посчитать среднюю зарплату (больше 750) для людей с одинаковыми фамилиями
SELECT last_name, AVG(salary) AS avg_salary FROM employee
GROUP BY last_name
HAVING AVG(salary) > 750;

-- 3. Найти последнего клиента из каждой страны, с специализацией 'development'
SELECT name, country, MAX(client_id) AS client_id FROM client
GROUP BY country, specialization
HAVING specialization = 'development';


-- 3.9 SELECT JOIN
-- a. LEFT JOIN двух таблиц и WHERE по одному из атрибутов
SELECT employee.employee_id, first_name, middle_name, last_name FROM employee
LEFT JOIN participation_in_project ON employee.employee_id = participation_in_project.employee_id
WHERE project_id = 2;

-- b. RIGHT JOIN. Получить такую же выборку, как и в 3.9.a
SELECT participation_in_project.employee_id, first_name, middle_name, last_name FROM participation_in_project
RIGHT JOIN employee e ON e.employee_id = participation_in_project.employee_id
WHERE project_id = 2;

-- c. LEFT JOIN трех таблиц + WHERE по атрибуту из каждой таблицы
SELECT DISTINCT employee.employee_id, first_name, middle_name, last_name FROM employee
LEFT JOIN participation_in_project pip ON employee.employee_id = pip.employee_id
LEFT JOIN completed_project cp ON pip.project_id = cp.project_id
WHERE cp.project_id = 3 AND pip.employee_id = 4 AND employee.first_name = 'Vober';

-- d. INNER JOIN двух таблиц
SELECT client.client_id AS client_id, client.name AS name, project_id, p.name AS project_name FROM client
INNER JOIN project p ON client.client_id = p.client_id;


-- 3.10 Подзапросы
-- a. Написать запрос с условием WHERE IN (подзапрос)
SELECT * FROM client
WHERE client_id IN (SELECT project.client_id FROM project);

-- b. Написать запрос SELECT atr1, atr2, (подзапрос) FROM ...
SELECT employee_id, salary, (
    SELECT AVG(salary) FROM employee) FROM employee;

-- c. Написать запрос вида SELECT * FROM (подзапрос)
SELECT *
FROM (
    SELECT name, country FROM client
    ORDER BY country) AS very_important_something;

-- d. Написать запрос вида SELECT * FROM table JOIN (подзапрос) ON ...
SELECT * FROM client
JOIN (SELECT client_id, name FROM project WHERE deadline_date = '2022-08-17 11:13:05') AS c_project
ON client.client_id = 5;

SET SQL_SAFE_UPDATES = 1;

