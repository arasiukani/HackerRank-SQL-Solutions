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
