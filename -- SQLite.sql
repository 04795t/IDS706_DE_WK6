-- Simple Queries
-- Count total universities in the database
SELECT COUNT(*) FROM university_rankings;

-- List distinct years in the database
SELECT DISTINCT year FROM university_rankings;

-- Count distinct countries in the database
SELECT COUNT(DISTINCT country) FROM university_rankings;

-- Count universities per year
SELECT year, COUNT(*) 
FROM university_rankings 
GROUP BY year;

-- Find highest, lowest, and average scores
SELECT MAX(score) FROM university_rankings;

SELECT MIN(score) FROM university_rankings;

SELECT AVG(score) FROM university_rankings;

-- Top 5 universities in 2015
SELECT institution, country, score
FROM university_rankings
WHERE year = 2015
ORDER BY score DESC
LIMIT 5;

-- Top 5 countries by number of universities
SELECT country, COUNT(*) 
FROM university_rankings
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Average score of universities in the USA
SELECT COUNT(*) 
FROM university_rankings
WHERE country = 'USA';

-- Average score of universities per year
SELECT year, AVG(score)
FROM university_rankings
GROUP BY year;

-- CRUD Operations
-- Insert Duke Tech into the database.
INSERT INTO university_rankings (year, institution, country, world_rank, score)
VALUES (2014, 'Duke Tech', 'USA', 350, 60.5);

-- Check if Duke Tech was added
SELECT * FROM university_rankings 
WHERE institution = 'Duke Tech';
   
-- Count Japanese universities
-- List Japanese universities in 2013 with world rank <= 200
SELECT * FROM university_rankings
WHERE country = 'Japan'
AND year = 2013
AND world_rank <= 200;

-- Count of Japanese universities in 2013 with world rank <= 200
SELECT COUNT(*) FROM university_rankings
WHERE country = 'Japan'
AND year = 2013
AND world_rank <= 200;
   
-- Increase Oxford's Score
-- Check Oxford's score in 2014
SELECT institution, year, score
FROM university_rankings
WHERE institution LIKE '%Oxford%'
AND year = 2014;

-- Increase Oxford's score by 1.2
UPDATE university_rankings
SET score = score + 1.2
WHERE institution LIKE '%Oxford%'
AND year = 2014;

-- Verify the update
SELECT institution, year, score
FROM university_rankings
WHERE institution LIKE '%Oxford%'
AND year = 2014;
   
-- Clean Up Records
-- List universities in 2015 with score < 45
SELECT institution, country, score
FROM university_rankings
WHERE year = 2015
AND score < 45;

-- Count and delete universities in 2015 with score < 45
SELECT COUNT(*)
FROM university_rankings
WHERE year = 2015
AND score < 45;

-- Delete universities in 2015 with score < 45
DELETE FROM university_rankings
WHERE year = 2015
AND score < 45;

-- Verify deletion by counting remaining universities in 2015
SELECT COUNT(*)
FROM university_rankings
WHERE year = 2015;

-- Verify deletion by checking minimum score in 2015
SELECT MIN(score)
FROM university_rankings
WHERE year = 2015;