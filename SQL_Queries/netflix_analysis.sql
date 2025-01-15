-- Create the Database and Use it
CREATE DATABASE Netflix;
USE Netflix;

-- Create the Table for Netflix Data
CREATE TABLE mytable (
    show_id VARCHAR(1024),  
    type VARCHAR(1024),  
    title VARCHAR(1024),  
    director VARCHAR(1024),  
    country VARCHAR(1024),  
    release_year BIGINT,  
    rating VARCHAR(1024),  
    duration VARCHAR(1024), 
    listed_in VARCHAR(1024)
);

-- Import Data from CSV (Make sure the file path is correct and accessible by MySQL)
-- Use the absolute path for your CSV file

LOAD DATA INFILE '/path/to/your/file.csv'
INTO TABLE mytable
FIELDS TERMINATED BY ','  -- Assuming the CSV is comma-separated
ENCLOSED BY '"'           -- Enclosing values with double quotes
LINES TERMINATED BY '\n'  -- Line break after each record
IGNORE 1 LINES            -- Ignore the header row if your CSV has headers
(show_id, type, title, director, country, release_year, rating, duration, listed_in);

-- Query 1: Total Number of Content in Netflix Database
SELECT COUNT(type) AS total 
FROM mytable;

-- Query 2: Total Number of Movies on Netflix
SELECT COUNT(type) AS total 
FROM mytable 
WHERE type = "Movie";

-- Query 3: Total Number of TV Shows on Netflix
SELECT COUNT(type) AS total 
FROM mytable 
WHERE type = "TV Show";

-- Query 4: Count of Content Based on Rating
SELECT rating, COUNT(type) AS Total 
FROM mytable
GROUP BY rating 
ORDER BY COUNT(type) DESC;

-- Query 5: Top 10 Countries with the Most Content on Netflix
SELECT country, COUNT(type) AS Total 
FROM mytable
GROUP BY country 
ORDER BY COUNT(type) DESC
LIMIT 10;

-- Query 6: Yearly Releases of Movies and TV Shows on Netflix (from Year 2000 and onward)
SELECT release_year, type, COUNT(type) AS Total_no 
FROM mytable
WHERE release_year > 2000
GROUP BY type, release_year
ORDER BY release_year DESC;
