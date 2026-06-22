CREATE TABLE passengers (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    age INT NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255)
);

DESCRIBE passengers;

CREATE TABLE buses (
    b_id INT AUTO_INCREMENT PRIMARY KEY,
    b_number VARCHAR(20) UNIQUE NOT NULL,
    bus_name VARCHAR(100) NOT NULL,
    bus_type ENUM('AC', 'Non-AC', 'Sleeper', 'Semi-Sleeper') NOT NULL,
    total_seats INT NOT NULL,
    source VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL
);

DESCRIBE buses;

-- CONDUCTORS
CREATE TABLE conductors (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    experience_years INT DEFAULT 0
);

-- TICKETS
CREATE TABLE tickets (
    t_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_number VARCHAR(20) UNIQUE NOT NULL,
    booking_date DATE NOT NULL,
    journey_date DATE NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    fare DECIMAL(10,2) NOT NULL
);


-- PASSENGER_BUYS_TICKET (Buy Relationship)
CREATE TABLE passenger_ticket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    p_id INT NOT NULL,
    t_id INT NOT NULL,

    FOREIGN KEY (p_id)
        REFERENCES passengers(p_id)
        ON DELETE CASCADE,

    FOREIGN KEY (t_id)
        REFERENCES tickets(t_id)
        ON DELETE CASCADE
);

-- PASSENGER_TRAVELS_BUS (Travel Relationship)
CREATE TABLE passenger_bus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    p_id INT NOT NULL,
    b_number VARCHAR(20) NOT NULL,

    FOREIGN KEY (p_id)
        REFERENCES passengers(p_id)
        ON DELETE CASCADE,

    FOREIGN KEY (b_number)
        REFERENCES buses(b_number)
        ON DELETE CASCADE
);

-- CONDUCTOR_HAS_BUS (Have Relationship)
CREATE TABLE conductor_bus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT NOT NULL,
    b_number VARCHAR(20) NOT NULL,

    FOREIGN KEY (c_id)
        REFERENCES conductors(c_id)
        ON DELETE CASCADE,

    FOREIGN KEY (b_number)
        REFERENCES buses(b_number)
        ON DELETE CASCADE
);

-- CONDUCTOR_CHECKS_TICKET (Check Relationship)
CREATE TABLE conductor_ticket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT NOT NULL,
    t_id INT NOT NULL,
    checked_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (c_id)
        REFERENCES conductors(c_id)
        ON DELETE CASCADE,

    FOREIGN KEY (t_id)
        REFERENCES tickets(t_id)
        ON DELETE CASCADE
);

SHOW TABLES;
