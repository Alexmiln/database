USE `lw4`;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM employee;

INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (1, 'Brandon', 'Shaun', 'Walker', '1976-4-10', 3000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (2, 'Garven', 'Shaun', 'Dreis', '1994-10-02', 2500);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (3, 'Anakin', '', 'Skywalker', '1994-01-27', 2000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (4, 'Vober', 'Shaylon', 'Dand', '1995-06-20', 2700);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (5, 'Willard', 'Shaylon', 'Johns', '1984-11-09', 2900);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (6, 'Chadwick', 'Shaylon', 'Johns', '1987-04-18', 3500);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (7, 'Estella', 'Shan', 'Keys', '1964-03-10', 1);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (8, 'Ivonne', 'Shan', 'Keys', '1970-01-02', 1000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (9, 'Cecily', 'Shan', 'Bruce', '1996-09-17', 3000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (10, 'Holley', 'Sheridon', 'Mcwilliams', '1989-11-27', 4000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (11, 'Geoffrey', 'Sheridon', 'Mcwilliams', '1979-11-10', 1000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (12, 'Geoffrey', 'Sheridon', 'Dwyer', '1976-11-03', 1);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (13, 'Estella', 'Siobhan', 'Dwyer', '1982-11-01', 2500);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (14, 'Geoffrey', 'Siobhan', 'Huff', '2002-12-08', 2500);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (15, 'Geoffrey', 'Siobhan', 'Piper', '1990-06-15', 2700);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (16, 'Estella', 'Shevon', 'Huff', '1998-03-06', 3100);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (17, 'Deandrea', 'Shevon', 'Piper', '1965-10-03', 4000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (18, 'Aisha', 'Shevon', 'Piper', '1965-03-10', 2000);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (19, 'Aisha', 'Shain', 'Slaughter', '2000-07-08', 2500);
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `birth_date`, `salary`) VALUES (20, 'Aisha', 'Shain', 'Slaughter', '1998-11-29', 2300);

DELETE FROM client;

INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (1, 'tech', 'Russia', 'Lipetskaya oblast, Lipetsk, Kosmonavtov Ul., bld. 12/2, appt. 1', 'development');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (2, 'Mytech', 'Netherlands', 'Klein Oeverpad, Kamperveen, Kampen, Overijssel, 8278AT', 'UX-design');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (3, 'techOnline', 'China', 'Jiangsu, Suzhou - Taicangshi, Dong Ting Bei Lu 111hao', 'mechanical engineering');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (4, 'techBlog', 'China', 'Beijing, Haidian District, Zhong Guan Cun Da Jie 59hao', 'development');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (5, 'techWeb', 'Russia', 'Respublika Tatarstan, Naberezhnye Chelny, Pos. Zyab Ul. Tan, bld. 209/А, appt. 129', 'UX-design');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (6, 'techWorld', 'Japan', 'Tokyo, Itabashi-ku, 342-1123, Fujimicho', 'mechanical engineering');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (7, 'Gotech', 'Japan', 'Shizuoka, Fujieda-shi, 461-1052, Kori', 'development');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (8, 'techGroup', 'Japan', 'Hokkaido, Akkeshi-cho Akkeshi-gun, 498-1165, Wakatakecho', 'UX-design');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (9, 'techMedia', 'Russia', 'Samarskaya oblast, Samara,Novomolodezhnyy Per., bld. 1, appt. 94', 'mechanical engineering');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (10, 'Thetech', 'Japan', 'Tokyo, Minato-ku, 426-1108, Mita Sumitomofudosammitat', 'development');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (11, 'techDesign', 'Germany', 'Rheinland-Pfalz, Rheinbrohl, Wallstrasse 74', 'UX-design');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (12, 'Webtech', 'Germany', 'Brandenburg, Oranienburg, Landhausstraße 51', 'mechanical engineering');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (13, 'techShop', 'Russia', 'Volgogradskaya oblast, Volzhskiy,  Karbysheva Ul., bld. 131, appt. 88', 'development');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (14, 'techApp', 'Germany', 'Freistaat Thüringen, Heilbad Heiligenstadt, Heinrich Heine Platz 74', 'UX-design');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (15, 'Protech', 'France', 'Picardie, Abbeville, 40 rue Gontier-Patin', 'mechanical engineering');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (16, 'techBook', 'France', 'Pays de la Loire, Cholet, 90 rue Ernest Renan', 'development');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (17, 'techNetwork', 'Russia', 'Respublika CHuvashiya, Cheboksary, 139 Strelkovoy Divizii, bld. 16, appt. 196', 'UX-design');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (18, 'techInc', 'The Czech Republic', 'Jihomoravský kraj, Rousínov U Vyškova,  Partyzánská 1265', 'mechanical engineering');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (19, 'techNet', 'The Czech Republic', 'Ústecký kraj, Vrbicany, Pivovarská 1241', 'development');
INSERT INTO `client` (`client_id`, `name`, `country`, `address`, `specialization`) VALUES (20, 'techNews', 'China', 'Liaoning, Dalianshi, Zhong Nan Lu 205hao Tai Da Mei', 'UX-design');

DELETE FROM project;

INSERT INTO `project` (`project_id`, `name`, `description`, `deadline_date`, `client_id`) VALUES (1, 'Mysterious Trendy', 'The Project Name Generator makes creative and random project names for a broad range of business projects.', '2030-08-05 17:01:20', 1);
INSERT INTO `project` (`project_id`, `name`, `description`, `deadline_date`, `client_id`) VALUES (2, 'Harsh Risky Tiger', NULL, '2150-01-19 20:08:34', 3);
INSERT INTO `project` (`project_id`, `name`, `description`, `deadline_date`, `client_id`) VALUES (3, 'Liquid Scarlet Tungsten', 'A generator is a perfect tool to get creative suggestions and new ideas for project names', '2010-11-16 01:20:06', 2);
INSERT INTO `project` (`project_id`, `name`, `description`, `deadline_date`, `client_id`) VALUES (4, 'Appropriate Logbook', 'The Project Name Generator makes creative and random project names for a broad range of business projects.', '2022-08-17 11:13:05', 5);
INSERT INTO `project` (`project_id`, `name`, `description`, `deadline_date`, `client_id`) VALUES (5, 'Straw Toupee', 'All project names are randomly generated and the project name generator is capable of making more than 5 million unique and different names.', '2018-09-24 18:17:31', 20);

DELETE FROM completed_project;

INSERT INTO `completed_project` (`completed_project_id`, `cost`, `project_id`) VALUES (1, 200000, 3);
INSERT INTO `completed_project` (`completed_project_id`, `cost`, `project_id`) VALUES (2, 100000, 5);

DELETE FROM participation_in_project;

INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (1, 1, 2);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (2, 1, 1);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (3, 2, 2);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (4, 2, 3);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (5, 3, 5);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (6, 3, 2);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (7, 3, 3);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (8, 4, 3);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (9, 4, 1);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (10, 4, 2);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (11, 5, 3);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (12, 5, 4);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (13, 5, 5);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (14, 7, 1);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (15, 7, 2);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (16, 8, 3);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (17, 9, 3);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (18, 6, 4);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (19, 5, 5);
INSERT INTO `participation_in_project` (`participation_in_project_id`, `employee_id`, `project_id`) VALUES (20, 4, 3);

SET SQL_SAFE_UPDATES = 1;



