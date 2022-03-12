-- These codes are for MySQL.
-- The data that being used are from divvy-tripdata Q2,Q3,Q4 of 2019, and 2020 Q1.
-- The formats of start time, end time, and duration in second columns in the csv files are change to
-- datetime(yyyy-mm-dd hh:mm:ss and number) before upload to the tables. 
-- The gender and birthyear columns are also deleted before upload. It is fine to upload these data into the tables and
-- do not include them when joining the tables later.

-- Create a database
CREATE DATABASE IF NOT EXISTS divvy;

-- Check if the database is created or not
show databases;

-- Create tables
use divvy;
CREATE TABLE Divvy_2019_Q2 (
    Rental_ID int NOT NULL,
    Start_Time datetime NOT NULL,
    End_Time datetime NOT NULL,
    Rental_Details_Bike int NOT NULL,
    Rental_Details_Duration_in_Sec int NOT NULL,
    Rental_Start_Station int NOT NULL,
    Start_Station_Name varchar(255) NOT NULL,
    End_Station int NOT NULL,
    End_Station_Name varchar(255) NOT NULL,
    User_Type varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Divvy_2019_Q3 (
    Rental_ID int NOT NULL,
    Start_Time datetime NOT NULL,
    End_Time datetime NOT NULL,
    Rental_Details_Bike int NOT NULL,
    Rental_Details_Duration_in_Sec int NOT NULL,
    Rental_Start_Station int NOT NULL,
    Start_Station_Name varchar(255) NOT NULL,
    End_Station int NOT NULL,
    End_Station_Name varchar(255) NOT NULL,
    User_Type varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Divvy_2019_Q4 (
    Rental_ID int NOT NULL,
    Start_Time datetime NOT NULL,
    End_Time datetime NOT NULL,
    Rental_Details_Bike int NOT NULL,
    Rental_Details_Duration_in_Sec int NOT NULL,
    Rental_Start_Station int NOT NULL,
    Start_Station_Name varchar(255) NOT NULL,
    End_Station int NOT NULL,
    End_Station_Name varchar(255) NOT NULL,
    User_Type varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Divvy_2020_Q1 (
    Rental_ID varchar(255) NOT NULL,
    Bike_Type varchar(255) NOT NULL,
    Start_Time datetime NOT NULL,
    End_Time datetime NOT NULL,
	Start_Station_Name varchar(255),
    Rental_Start_Station varchar(255),
    End_Station_Name varchar(255),
    End_Station varchar(255),
    Start_Lat varchar(255),
    Start_Lng varchar(255),
    End_Lat varchar(255),
    End_Lng varchar(255),
    User_Type varchar(255) NOT NULL
);

-- Load csv files into tables
SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'D:/Career/Google Data Analytics Program/Case Study/Google Data Analytics Certification Capstone/Case-Study-1-Cyclistic-Bicycle/Divvy_Trips_2019_Q2/Divvy_Trips_2019_Q2_v2.csv' 
INTO TABLE Divvy_2019_Q2
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Career/Google Data Analytics Program/Case Study/Google Data Analytics Certification Capstone/Case-Study-1-Cyclistic-Bicycle/Divvy_Trips_2019_Q3/Divvy_Trips_2019_Q3_v2.csv' 
INTO TABLE Divvy_2019_Q3
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Career/Google Data Analytics Program/Case Study/Google Data Analytics Certification Capstone/Case-Study-1-Cyclistic-Bicycle/Divvy_Trips_2019_Q4/Divvy_Trips_2019_Q4_v2.csv' 
INTO TABLE Divvy_2019_Q4
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Career/Google Data Analytics Program/Case Study/Google Data Analytics Certification Capstone/Case-Study-1-Cyclistic-Bicycle/Divvy_Trips_2020_Q1/Divvy_Trips_2020_Q1_v2.csv' 
INTO TABLE Divvy_2020_Q1
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Check the tables info in divvy database
SELECT COLUMN_NAME, TABLE_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'divvy'
ORDER BY 2,1;

-- Check the variables in User_Type column of each table 
SELECT DISTINCT User_Type, COUNT(USER_Type)
FROM divvy.divvy_2019_q2
GROUP BY 1;
SELECT DISTINCT User_Type, COUNT(USER_Type)
FROM divvy.divvy_2019_q3
GROUP BY 1;
SELECT DISTINCT User_Type, COUNT(USER_Type)
FROM divvy.divvy_2019_q4
GROUP BY 1;
SELECT DISTINCT User_Type, COUNT(USER_Type)
FROM divvy.divvy_2020_q1
GROUP BY 1;

-- Columns that all four tables contain will be joined later
SELECT col_name, col_count
FROM(
SELECT COLUMN_NAME AS col_name, COUNT(COLUMN_NAME) AS col_count
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE table_schema = 'divvy'
  GROUP BY 1
  ORDER BY 1) table_1
  WHERE col_count >= 4;

-- Make temporary tables to join the necessary data for the analysis.
WITH Divvy_19_Q2 AS (
SELECT CAST(Rental_ID AS char(50)) AS ride_id,
CAST(Rental_Details_Bike AS char(50)) AS rideable_type,
Start_Time AS started_at,
 End_Time AS ended_at,
Start_Station_Name AS start_station_name,
CAST(Rental_Start_Station AS char(50)) AS start_station_id,
End_Station_Name AS end_station_name,
CAST(End_Station AS char(50)) AS end_station_id,
User_Type AS member_casual
FROM divvy.Divvy_2019_Q2
),
Divvy_19_Q3 AS (
SELECT CAST(Rental_ID AS char(50)) AS ride_id,
CAST(Rental_Details_Bike AS char(50)) AS rideable_type,
Start_Time AS started_at,
 End_Time AS ended_at,
Start_Station_Name AS start_station_name,
CAST(Rental_Start_Station AS char(50)) AS start_station_id,
End_Station_Name AS end_station_name,
CAST(End_Station AS char(50)) AS end_station_id,
User_Type AS member_casual
FROM divvy.Divvy_2019_Q3
),
Divvy_19_Q4 AS (
SELECT CAST(Rental_ID AS char(50)) AS ride_id,
CAST(Rental_Details_Bike AS char(50)) AS rideable_type,
Start_Time AS started_at,
 End_Time AS ended_at,
Start_Station_Name AS start_station_name,
CAST(Rental_Start_Station AS char(50)) AS start_station_id,
End_Station_Name AS end_station_name,
CAST(End_Station AS char(50)) AS end_station_id,
User_Type AS member_casual
FROM divvy.Divvy_2019_Q4
),
Divvy_20_Q1 AS (
SELECT CAST(Rental_ID AS char(50)) AS ride_id,
CAST(Bike_Type AS char(50)) AS rideable_type,
Start_Time AS started_at,
 End_Time AS ended_at,
Start_Station_Name AS start_station_name,
CAST(Rental_Start_Station AS char(50)) AS start_station_id,
End_Station_Name AS end_station_name,
CAST(End_Station AS char(50)) AS end_station_id,
User_Type AS member_casual
FROM divvy.Divvy_2020_Q1
),
all_trips AS(
SELECT * FROM Divvy_19_Q2
UNION ALL
SELECT * FROM Divvy_19_Q3
UNION ALL
SELECT * FROM Divvy_19_Q4
UNION ALL
SELECT * FROM Divvy_20_Q1
) 
-- Use case to organize the column values of member_casual to only two values,
-- then make a summary table show the number of ride and the mean of ride time in second based on type of users and day of week.
SELECT
CASE
WHEN all_trips.member_casual LIKE 'Sub%' OR  all_trips.member_casual LIKE 'mem%' THEN 'member_user'
WHEN all_trips.member_casual LIKE 'Cust%' OR all_trips.member_casual LIKE 'cas%' THEN 'casual_user'
ELSE
'ERROR'
END AS member_casual_field,
DATE_FORMAT(started_at, '%W') AS day_of_week,
AVG(TIMESTAMPDIFF(SECOND, started_at,ended_at)) AS ride_time_in_sec,
COUNT(ride_id) AS number_of_ride
FROM all_trips
WHERE start_station_name <> "HQ QR" 
GROUP BY 1,2 
HAVING AVG(TIMESTAMPDIFF(SECOND, started_at,ended_at)) >0;

-- DELETE Database
DROP database IF EXISTS divvy;
-- Check 
show databases;







