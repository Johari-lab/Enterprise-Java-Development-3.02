-- LAB 3.02
-- 2.

CREATE SCHEMA airline;
USE airline;

CREATE TABLE aircraft(
	aircraft_id VARCHAR(255) NOT NULL,  
    total_aircraft_seats SMALLINT, 
    PRIMARY KEY(aircraft_id)
);

CREATE TABLE flight(
	flight_id VARCHAR(6) NOT NULL,  
    aircraft VARCHAR(255),
    flight_mileage SMALLINT,
    PRIMARY KEY(flight_id),
    FOREIGN KEY(aircraft) REFERENCES aircraft(aircraft_id)
);

CREATE TABLE customer(
	id INT NOT NULL AUTO_INCREMENT, 
    customer_name VARCHAR(255),
    customer_status VARCHAR(7),
    flight_number VARCHAR(6),
    total_customer_mileage INT,
    PRIMARY KEY(id),
    FOREIGN KEY(flight_number) REFERENCES flight(flight_id)
);

INSERT INTO aircraft(aircraft_id, total_aircraft_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO flight(flight_id, aircraft, flight_mileage) VALUES
('DL143', 'Boeing 747', 135),
('DL122', 'Airbus A330', 4370),
('DL53', 'Boeing 777', 2078),
('DL222', 'Boeing 777', 1765),
('DL37', 'Boeing 747', 531);

INSERT INTO customer(customer_name, customer_status, flight_number, total_customer_mileage) VALUES
('Agustine Riviera', 'Silver', 'DL143', 115235),
('Agustine Riviera', 'Silver', 'DL122', 115235),
('Alaina Sepulvida', 'None', 'DL122', 6008),
('Tom Jones', 'Gold', 'DL122', 205767),
('Tom Jones', 'Gold', 'DL53', 205767),
('Sam Rio', 'None', 'DL143', 2653),
('Tom Jones', 'Gold', 'DL222', 205767),
('Jessica James', 'Silver', 'DL143', 127656),
('Ana Janco', 'Silver', 'DL222', 136773),
('Jennifer Cortez', 'Gold', 'DL222', 300582),
('Jessica James', 'Silver', 'DL122', 127656),
('Sam Rio', 'None', 'DL37', 2653),
('Christian Janco', 'Silver', 'DL222', 14642);

SELECT * FROM aircraft;
SELECT * FROM flight;
SELECT * FROM customer;

-- 3. Get the total number of flights in the database
SELECT COUNT(flight_id) 'total number of flights'
FROM flight;

-- 4. Get the average flight distance
SELECT AVG(flight_mileage) 'average flight distance'
FROM flight;

-- 5. Get the average number of seats
SELECT AVG(total_aircraft_seats) 'average number of seats'
FROM aircraft;

-- 6. Get the average number of miles flown by customers grouped by status
SELECT customer_status, AVG(total_customer_mileage) 'average number of miles flown'
FROM customer
GROUP BY customer_status;

-- 7. Get the maximum number of miles flown by customers grouped by status
SELECT customer_status, MAX(total_customer_mileage) 'maximum number of miles flown'
FROM customer
GROUP BY customer_status; 

-- 8. Get the total number of aircraft with a name containing Boeing
SELECT COUNT(aircraft_id) 'total number of aircraft with a name containing Boeing'
FROM aircraft
WHERE aircraft_id LIKE '%Boeing%';

-- 9. Find all flights with a distance between 300 and 2000 miles
SELECT *
FROM flight
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10. Find the average flight distance booked grouped by customer status (this should require a join)
SELECT c.customer_status, AVG(f.flight_mileage) 'average flight distance booked'
FROM customer c
INNER JOIN flight f
ON c.flight_number = f.flight_id
GROUP BY c.customer_status;

-- 11. Find the most often booked aircraft by gold status members (this should require a join)
SELECT c.customer_status, MAX(a.aircraft_id) 'most often booked aircraft'
FROM customer c
INNER JOIN flight f
ON c.flight_number = f.flight_id
INNER JOIN aircraft a 
ON f.aircraft = a.aircraft_id 
WHERE c.customer_status = 'Gold'; 