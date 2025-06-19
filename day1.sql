-- Day 1: Basic SQL Queries

-- Q-1: Query all columns for all American cities in the CITY table with populations larger than 100000.
-- The CountryCode for America is USA.
SELECT * FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;

-- Q-2: Query the NAME field for all American cities in the CITY table with populations larger than 120000.
-- The CountryCode for America is USA.
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;

-- Q-3: Query all columns (attributes) for every row in the CITY table.
SELECT * FROM CITY;

-- Q-4: Query all columns for a city in CITY with the ID 1661.
SELECT * FROM CITY
WHERE ID = 1661;

-- Q-5: Query all attributes of every Japanese city in the CITY table.
-- The COUNTRYCODE for Japan is JPN.
SELECT * FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- Q-6: Query the names of all the Japanese cities in the CITY table.
-- The COUNTRYCODE for Japan is JPN.
SELECT NAME FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- Q-7: Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE FROM STATION;

-- Q-8: Query a list of CITY names from STATION for cities that have an even ID number.
-- Exclude duplicates from the answer.
SELECT DISTINCT CITY FROM STATION
WHERE ID % 2 = 0;

-- Q-9: Find the difference between total number of CITY entries and distinct CITY entries.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

-- Q-10: Query the two cities in STATION with the shortest and longest CITY names,
-- as well as their respective lengths.
-- If there is a tie, choose alphabetically first.

SELECT CITY, LENGTH(CITY) AS LEN
FROM STATION
ORDER BY LEN, CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS LEN
FROM STATION
ORDER BY LEN DESC, CITY
LIMIT 1;

-- Q-11: Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE FROM STATION;

-- Q-12: Query a list of CITY names from STATION for cities that have an even ID number.
-- Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT CITY FROM STATION WHERE ID % 2 = 0;

-- Q-13: Find the difference between the total number of CITY entries in the table 
-- and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

-- Q-14: Query the two cities in STATION with the shortest and longest CITY names, 
-- as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
(SELECT CITY, LENGTH(CITY) AS LEN FROM STATION ORDER BY LEN ASC, CITY ASC LIMIT 1)
UNION
(SELECT CITY, LENGTH(CITY) AS LEN FROM STATION ORDER BY LEN DESC, CITY ASC LIMIT 1);

-- Q-15: Same as Q-14

-- Q-16: Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
-- Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';

-- Q-17: Query the list of CITY names from STATION which have vowels (a, e, i, o, u) 
-- as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE 
    (CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%')
AND 
    (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');

-- Q-18: Query the list of CITY names from STATION that do not start with vowels.
-- Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE 
    CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%';

-- Q-19: Query the list of CITY names from STATION that do not end with vowels.
-- Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE 
    CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u';

-- Q-20: Query the list of CITY names from STATION that either do not start with vowels 
-- or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE 
    CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%'
    OR
    CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u';

-- Q-21: Query the list of CITY names from STATION that do not start with vowels 
-- and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE 
    CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%'
AND
    CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u';

-- Q-22: Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
-- Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters, secondary sort them by ascending ID.
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID;

-- Q-23: Write a query that prints a list of employee names (i.e.: the name attribute) 
-- from the Employee table in alphabetical order.
SELECT NAME
FROM EMPLOYEE
ORDER BY NAME;

-- Q-24: Write a query that prints a list of employee names for employees in Employee 
-- having a salary greater than $2000 per month who have been employees for less than 10 months. 
-- Sort your result by ascending employee_id.
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID;
