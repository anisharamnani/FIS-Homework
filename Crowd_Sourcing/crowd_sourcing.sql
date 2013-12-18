CREATE TABLE if not exists pledge ( 
id integer NOT NULL Primary Key AUTO_INCREMENT,
amount INTEGER, 
user_id INTEGER, 
project_id INTEGER 
)

CREATE TABLE if not exists user ( 
id integer NOT NULL Primary Key AUTO_INCREMENT,
name TEXT, 
age INTEGER
)

CREATE TABLE if not exists project ( 
id integer NOT NULL Primary Key AUTO_INCREMENT,
title TEXT,
category TEXT, 
funding_goal INTEGER, 
start_date TEXT, 
end_date TEXT 
)



1. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('anisha is broke', 'charity', 10000, 'Dec 10', 'Dec 15')

2. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('anisha reads harry potter', 'books', 10000, 'Dec 16', 'Dec 20')

3. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('anisha likes music', 'music', 800, 'Dec 25', 'Dec 30')

4. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('anisha likes music', 'music', 800, 'Dec 25', 'Dec 30')

5. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('The Magazine: The Book', 'books', 1000, 'Jan 17', 'Jan 30')

6. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('Wipebook', 'books', 10000, 'Dec 15', 'Dec 22')

7. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('Periscope Studio: Maiden Voyage', 'books', 1000, 'Dec 12', 'Dec 19')

8. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('Lawless Jerky', 'good', 10000, 'Dec 10', 'Dec 17')

9. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('Robots, Drawing, and Engineering', 'robots', 10000, 'Dec 14', 'Dec 21')

10. 
INSERT into project (title, category, funding_goal, start_date, end_date)
VALUES ('Collusion', 'games', 1000, 'Dec 17', 'Jan 17')

INSERT into user (name, age)
VALUES 
('Amine', 20), 
('Ariel', 21), 
('Anisha', 22), 
('Armando', 23), 
('David', 24), 
('Derek', 25), 
('Gustavo', 26), 
('Jahmil', 27), 
('Jeremy', 28),
('Kate', 29),
('Katie', 30), 
('Keith', 31),
('Keturah', 32), 
('Nikki', 33),
('Nisha', 34),
('Oliver', 35),
('Sara', 36),
('Sarah', 37),
('Sean', 38),
('Tessa', 39)


INSERT into pledge(amount, user_id, project_id)
VALUES 
(10000, 1, 1),
(10000, 9, 2),
(800, 4, 3),
(34, 4, 1),
(4, 5, 6),
(8, 6, 1),
(45, 7, 2),
(26, 8, 1),
(725, 9, 3),
(25, 10, 2),
(2745, 11, 2),
(425, 12, 10),
(724, 13, 3),
(1435, 14, 2),
(86, 15, 9),
(34, 16, 8),
(27, 17, 5),
(134, 18, 4),
(85, 19, 5),
(4, 20, 1),
(46, 1, 6),
(756, 2, 7),
(17, 3, 8),
(47, 4, 7),
(72, 5, 6),
(457, 6, 9),
(725, 7, 6),
(569, 8, 3),
(56, 9, 6),
(3, 10, 9);

# select the titles of all projects and their pledge amounts.


SELECT project.title as title, pledge.amount as pledge_amount
FROM project
JOIN pledge
ON project.id = pledge.project_id 
GROUP BY project.title;

# select the user name, age, and pledge amount for all pledges.

SELECT user.name as name, user.age as age, pledge.amount as pledge_amount
FROM user
JOIN pledge
ON user.id = pledge.user_id 
GROUP BY user.name

# select the titles of all projects that have met their funding goal.

SELECT project.title as title,  project.funding_goal as funding, SUM(pledge.amount) as sum_total
FROM project
JOIN pledge
ON project.id = pledge.project_id 
GROUP BY project.title 
HAVING SUM(pledge.amount) >= project.funding_goal;

# Select user names and amounts of all pledges. Order them by the amount.

SELECT user.name, pledge.amount
FROM user
JOIN pledge
ON user.id = pledge.user_id 
ORDER BY user.name

# Select the category names, and pledge amounts of all pledges in the music category.

SELECT project.title, project.category, pledge.amount 
FROM project 
JOIN pledge
ON project.id = pledge.project_id 
WHERE project.category = "music"
GROUP BY project.title

# Select the category names and the sum total of the 
# pledge amounts of all the pledges in the book category.

SELECT project.title, project.category, SUM(pledge.amount)
FROM project 
JOIN pledge
ON project.id = pledge.project_id 
WHERE project.category = 'books'
GROUP BY project.title 








