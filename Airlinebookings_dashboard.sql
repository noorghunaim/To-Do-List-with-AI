-- to open the DB:
.open airline_bookings.db

-- Code to create the table airline_revenue:
CREATE TABLE airline_bookings (booking_id INTEGER PRIMARY KEY, booking_date TEXT, flight_date TEXT, origin TEXT, destination TEXT, route TEXT, aurcraft_type EXT, aircraft_capacity INTEGER, ticketed_sold INTEGER, ticket_price REAL, revenue REAL, load_factor REAL);

-- Import the csv file into SQLite:
.mode csv
.import airline_bookings_dxb_sample.csv airline_bookings

-- Check if the csv file was imported properly with the below code:
 SELECT COUNT(*) FROM airline_bookings; -- this code should give you 1500 rows

-- To cross check if the schema is as per the table we created after import:
 PRAGMA table_info(airline_bookings);

-- 1. Basic Queries:
-- Query 1. Total Revenue:
SELECT SUM(revenue) AS total_revenue FROM airline_bookings;

-- Query 2. Total Passengers:
SELECT SUM(tickets_sold) AS total_passengers FROM airline_bookings;

-- Query 3. Total Revenue by Route:
SELECT route, SUM(revenue) AS total_revenue FROM airline_bookings GROUP BY route ORDER BY total_revenue DESC;

