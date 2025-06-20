-- Day 2 SQL Questions with Answers

-- Q-1: Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
-- Output one of the following statements for each record in the table: 
-- Equilateral: It's a triangle with 3 sides of equal length. 
-- Isosceles: It's a triangle with 2 sides of equal length. 
-- Scalene: It's a triangle with 3 sides of differing lengths. 
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT
  CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    ELSE 'Scalene'
  END AS triangle_type
FROM TRIANGLES;

-- Q-2: Generate the following two result sets:

-- Part 1:
-- Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
-- For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

SELECT
  CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS name_with_occupation
FROM OCCUPATIONS
ORDER BY name_with_occupation;

-- Part 2:
-- Query the number of occurrences of each occupation in OCCUPATIONS. 
-- Sort the occurrences in ascending order, and output them in the following format:
-- There are a total of [occupation_count] [occupation]s.
-- where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. 
-- If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

SELECT
  CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.') AS count_message
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*) ASC, Occupation ASC;

-- Q-3: Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
-- The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.

SELECT
  MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
  MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
  MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
  MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
  SELECT Name, Occupation,
         ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
  FROM OCCUPATIONS
) AS ordered
GROUP BY rn
ORDER BY rn;

-- Q-4: You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
-- Write a query to find the node type of Binary Tree ordered by the value of the node. 
-- Output one of the following for each node:
-- Root: If node is root node.
-- Leaf: If node is leaf node.
-- Inner: If node is neither root nor leaf node.

SELECT
  N,
  CASE
    WHEN P IS NULL THEN 'Root'
    WHEN NOT EXISTS (SELECT 1 FROM BST AS child WHERE child.P = BST.N) THEN 'Leaf'
    ELSE 'Inner'
  END AS node_type
FROM BST
ORDER BY N;

-- Q-5: Amber's conglomerate corporation just acquired some new companies. 
-- Each of the companies follows this hierarchy: 
-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. 
-- Order your output by ascending company_code.
-- Note:
-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric. 
-- For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

SELECT
  C.company_code,
  C.founder_name,
  COUNT(DISTINCT LM.employee_id) AS total_lead_managers,
  COUNT(DISTINCT SM.employee_id) AS total_senior_managers,
  COUNT(DISTINCT M.employee_id) AS total_managers,
  COUNT(DISTINCT E.employee_id) AS total_employees
FROM COMPANY C
LEFT JOIN LEAD_MANAGER LM ON C.company_code = LM.company_code
LEFT JOIN SENIOR_MANAGER SM ON C.company_code = SM.company_code
LEFT JOIN MANAGER M ON C.company_code = M.company_code
LEFT JOIN EMPLOYEE E ON C.company_code = E.company_code
GROUP BY C.company_code, C.founder_name
ORDER BY C.company_code;
