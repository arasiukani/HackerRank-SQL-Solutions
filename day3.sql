 Q-1
Query a count of the number of cities in CITY having a Population larger than 100000.
Answer:
SELECT COUNT(*) FROM CITY WHERE Population > 100000;

 Q-2
Query the total population of all cities in CITY where District is California.
Answer:
SELECT SUM(Population) FROM CITY WHERE District = 'California';

 Q-3
Query the average population of all cities in CITY where District is California.
Answer:
SELECT AVG(Population) FROM CITY WHERE District = 'California';

 Q-4
Query the average population for all cities in CITY, rounded down to the nearest integer.
Answer:
SELECT FLOOR(AVG(Population)) FROM CITY;

Q-5
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
Answer:
SELECT SUM(Population) FROM CITY WHERE CountryCode = 'JPN';

Q-6
Query the difference between the maximum and minimum populations in CITY.
Answer:
SELECT MAX(Population) - MIN(Population) FROM CITY;

 Q-7
We define an employee's total earnings to be their monthly salary * months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
Answer:
SELECT MAX(Months * Salary), COUNT(*)
FROM Employee
WHERE (Months * Salary) = (
    SELECT MAX(Months * Salary) FROM Employee
);

Q-8
Query the following two values from the STATION table: The sum of all values in LAT_N and LONG_W rounded to 2 decimal places.
Answer:
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;

 Q-9
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.
Answer:
SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

Q-10
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.
Answer:
SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

Q-11
Answer:
SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

Q-12
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.
Answer:
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345
);

Q-13
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
Answer:
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;

Q-14
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;

Q-15
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.
Answer:
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780
);

Q-16
Consider p1(a,b) and p2(c,d) to be two points on a 2D plane. a = min LAT_N, b = min LONG_W, c = max LAT_N, d = max LONG_W. Query the Manhattan Distance between p1 and p2 and round it to a scale of 4 decimal places.
Answer:
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4)
FROM STATION;

Q-17
Consider p1(a,c) and p2(b,d) where (a,b) are min/max LAT_N and (c,d) are min/max LONG_W. Query the Euclidean Distance between points p1 and p2 and format your answer to 4 decimal digits.
Answer:
SELECT ROUND(SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW(MAX(LONG_W) - MIN(LONG_W), 2)), 4)
FROM STATION;

Q-18
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
Answer :
SELECT ROUND(LAT_N, 4)
FROM (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
           COUNT(*) OVER () AS total
    FROM STATION
) AS temp
WHERE rn IN ((total + 1) / 2, (total + 2) / 2);