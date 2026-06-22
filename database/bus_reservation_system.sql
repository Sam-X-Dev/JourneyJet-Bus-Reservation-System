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

INSERT INTO passengers
(first_name,last_name,gender,age,phone,email,address)
VALUES
('Rahul','Sharma','Male',19,'9000000001','rahul1@gmail.com','Bhubaneswar'),
('Priya','Sharma','Female',20,'9000000002','priya2@gmail.com','Cuttack'),
('Amit','Sharma','Male',21,'9000000003','amit3@gmail.com','Berhampur'),
('Sneha','Sharma','Female',22,'9000000004','sneha4@gmail.com','Rourkela'),
('Rohit','Sharma','Male',23,'9000000005','rohit5@gmail.com','Puri'),
('Pooja','Sharma','Female',24,'9000000006','pooja6@gmail.com','Sambalpur'),
('Ankit','Sharma','Male',25,'9000000007','ankit7@gmail.com','Balasore'),
('Neha','Sharma','Female',26,'9000000008','neha8@gmail.com','Jeypore'),
('Suresh','Sharma','Male',27,'9000000009','suresh9@gmail.com','Angul'),
('Anjali','Sharma','Female',28,'9000000010','anjali10@gmail.com','Ganjam'),
('Vikas','Sharma','Male',29,'9000000011','vikas11@gmail.com','Bhubaneswar'),
('Kiran','Sharma','Female',30,'9000000012','kiran12@gmail.com','Cuttack'),
('Deepak','Sharma','Male',31,'9000000013','deepak13@gmail.com','Berhampur'),
('Meera','Sharma','Female',32,'9000000014','meera14@gmail.com','Rourkela'),
('Arjun','Sharma','Male',33,'9000000015','arjun15@gmail.com','Puri'),
('Nisha','Sharma','Female',34,'9000000016','nisha16@gmail.com','Sambalpur'),
('Manoj','Sharma','Male',35,'9000000017','manoj17@gmail.com','Balasore'),
('Kavita','Sharma','Female',36,'9000000018','kavita18@gmail.com','Jeypore'),
('Rakesh','Sharma','Male',37,'9000000019','rakesh19@gmail.com','Angul'),
('Divya','Sharma','Female',38,'9000000020','divya20@gmail.com','Ganjam'),
('Rahul','Patel','Male',39,'9000000021','rahul21@gmail.com','Bhubaneswar'),
('Priya','Patel','Female',40,'9000000022','priya22@gmail.com','Cuttack'),
('Amit','Patel','Male',41,'9000000023','amit23@gmail.com','Berhampur'),
('Sneha','Patel','Female',42,'9000000024','sneha24@gmail.com','Rourkela'),
('Rohit','Patel','Male',43,'9000000025','rohit25@gmail.com','Puri'),
('Pooja','Patel','Female',44,'9000000026','pooja26@gmail.com','Sambalpur'),
('Ankit','Patel','Male',45,'9000000027','ankit27@gmail.com','Balasore'),
('Neha','Patel','Female',46,'9000000028','neha28@gmail.com','Jeypore'),
('Suresh','Patel','Male',47,'9000000029','suresh29@gmail.com','Angul'),
('Anjali','Patel','Female',48,'9000000030','anjali30@gmail.com','Ganjam'),
('Vikas','Patel','Male',49,'9000000031','vikas31@gmail.com','Bhubaneswar'),
('Kiran','Patel','Female',50,'9000000032','kiran32@gmail.com','Cuttack'),
('Deepak','Patel','Male',51,'9000000033','deepak33@gmail.com','Berhampur'),
('Meera','Patel','Female',52,'9000000034','meera34@gmail.com','Rourkela'),
('Arjun','Patel','Male',53,'9000000035','arjun35@gmail.com','Puri'),
('Nisha','Patel','Female',54,'9000000036','nisha36@gmail.com','Sambalpur'),
('Manoj','Patel','Male',55,'9000000037','manoj37@gmail.com','Balasore'),
('Kavita','Patel','Female',56,'9000000038','kavita38@gmail.com','Jeypore'),
('Rakesh','Patel','Male',57,'9000000039','rakesh39@gmail.com','Angul'),
('Divya','Patel','Female',58,'9000000040','divya40@gmail.com','Ganjam'),
('Rahul','Das','Male',59,'9000000041','rahul41@gmail.com','Bhubaneswar'),
('Priya','Das','Female',60,'9000000042','priya42@gmail.com','Cuttack'),
('Amit','Das','Male',18,'9000000043','amit43@gmail.com','Berhampur'),
('Sneha','Das','Female',19,'9000000044','sneha44@gmail.com','Rourkela'),
('Rohit','Das','Male',20,'9000000045','rohit45@gmail.com','Puri'),
('Pooja','Das','Female',21,'9000000046','pooja46@gmail.com','Sambalpur'),
('Ankit','Das','Male',22,'9000000047','ankit47@gmail.com','Balasore'),
('Neha','Das','Female',23,'9000000048','neha48@gmail.com','Jeypore'),
('Suresh','Das','Male',24,'9000000049','suresh49@gmail.com','Angul'),
('Anjali','Das','Female',25,'9000000050','anjali50@gmail.com','Ganjam'),
('Vikas','Das','Male',26,'9000000051','vikas51@gmail.com','Bhubaneswar'),
('Kiran','Das','Female',27,'9000000052','kiran52@gmail.com','Cuttack'),
('Deepak','Das','Male',28,'9000000053','deepak53@gmail.com','Berhampur'),
('Meera','Das','Female',29,'9000000054','meera54@gmail.com','Rourkela'),
('Arjun','Das','Male',30,'9000000055','arjun55@gmail.com','Puri'),
('Nisha','Das','Female',31,'9000000056','nisha56@gmail.com','Sambalpur'),
('Manoj','Das','Male',32,'9000000057','manoj57@gmail.com','Balasore'),
('Kavita','Das','Female',33,'9000000058','kavita58@gmail.com','Jeypore'),
('Rakesh','Das','Male',34,'9000000059','rakesh59@gmail.com','Angul'),
('Divya','Das','Female',35,'9000000060','divya60@gmail.com','Ganjam'),
('Rahul','Kumar','Male',36,'9000000061','rahul61@gmail.com','Bhubaneswar'),
('Priya','Kumar','Female',37,'9000000062','priya62@gmail.com','Cuttack'),
('Amit','Kumar','Male',38,'9000000063','amit63@gmail.com','Berhampur'),
('Sneha','Kumar','Female',39,'9000000064','sneha64@gmail.com','Rourkela'),
('Rohit','Kumar','Male',40,'9000000065','rohit65@gmail.com','Puri'),
('Pooja','Kumar','Female',41,'9000000066','pooja66@gmail.com','Sambalpur'),
('Ankit','Kumar','Male',42,'9000000067','ankit67@gmail.com','Balasore'),
('Neha','Kumar','Female',43,'9000000068','neha68@gmail.com','Jeypore'),
('Suresh','Kumar','Male',44,'9000000069','suresh69@gmail.com','Angul'),
('Anjali','Kumar','Female',45,'9000000070','anjali70@gmail.com','Ganjam'),
('Vikas','Kumar','Male',46,'9000000071','vikas71@gmail.com','Bhubaneswar'),
('Kiran','Kumar','Female',47,'9000000072','kiran72@gmail.com','Cuttack'),
('Deepak','Kumar','Male',48,'9000000073','deepak73@gmail.com','Berhampur'),
('Meera','Kumar','Female',49,'9000000074','meera74@gmail.com','Rourkela'),
('Arjun','Kumar','Male',50,'9000000075','arjun75@gmail.com','Puri'),
('Nisha','Kumar','Female',51,'9000000076','nisha76@gmail.com','Sambalpur'),
('Manoj','Kumar','Male',52,'9000000077','manoj77@gmail.com','Balasore'),
('Kavita','Kumar','Female',53,'9000000078','kavita78@gmail.com','Jeypore'),
('Rakesh','Kumar','Male',54,'9000000079','rakesh79@gmail.com','Angul'),
('Divya','Kumar','Female',55,'9000000080','divya80@gmail.com','Ganjam'),
('Rahul','Singh','Male',56,'9000000081','rahul81@gmail.com','Bhubaneswar'),
('Priya','Singh','Female',57,'9000000082','priya82@gmail.com','Cuttack'),
('Amit','Singh','Male',58,'9000000083','amit83@gmail.com','Berhampur'),
('Sneha','Singh','Female',59,'9000000084','sneha84@gmail.com','Rourkela'),
('Rohit','Singh','Male',60,'9000000085','rohit85@gmail.com','Puri'),
('Pooja','Singh','Female',18,'9000000086','pooja86@gmail.com','Sambalpur'),
('Ankit','Singh','Male',19,'9000000087','ankit87@gmail.com','Balasore'),
('Neha','Singh','Female',20,'9000000088','neha88@gmail.com','Jeypore'),
('Suresh','Singh','Male',21,'9000000089','suresh89@gmail.com','Angul'),
('Anjali','Singh','Female',22,'9000000090','anjali90@gmail.com','Ganjam'),
('Vikas','Singh','Male',23,'9000000091','vikas91@gmail.com','Bhubaneswar'),
('Kiran','Singh','Female',24,'9000000092','kiran92@gmail.com','Cuttack'),
('Deepak','Singh','Male',25,'9000000093','deepak93@gmail.com','Berhampur'),
('Meera','Singh','Female',26,'9000000094','meera94@gmail.com','Rourkela'),
('Arjun','Singh','Male',27,'9000000095','arjun95@gmail.com','Puri'),
('Nisha','Singh','Female',28,'9000000096','nisha96@gmail.com','Sambalpur'),
('Manoj','Singh','Male',29,'9000000097','manoj97@gmail.com','Balasore'),
('Kavita','Singh','Female',30,'9000000098','kavita98@gmail.com','Jeypore'),
('Rakesh','Singh','Male',31,'9000000099','rakesh99@gmail.com','Angul'),
('Divya','Singh','Female',32,'9000000100','divya100@gmail.com','Ganjam');

INSERT INTO buses (b_number,bus_name,bus_type,total_seats,source,destination,departure_time,arrival_time)
VALUES
('OD01BUS001','Express 1','AC',50,'Bhubaneswar','Puri','07:00:00','09:30:00'),
('OD02BUS002','Express 2','Non-AC',50,'Cuttack','Rourkela','08:00:00','10:30:00'),
('OD03BUS003','Express 3','Sleeper',50,'Berhampur','Sambalpur','09:00:00','11:30:00'),
('OD04BUS004','Express 4','Semi-Sleeper',50,'Puri','Balasore','10:00:00','12:30:00'),
('OD05BUS005','Express 5','AC',50,'Rourkela','Angul','11:00:00','13:30:00'),
('OD06BUS006','Express 6','Non-AC',50,'Sambalpur','Jeypore','12:00:00','14:30:00'),
('OD07BUS007','Express 7','Sleeper',50,'Balasore','Ganjam','13:00:00','15:30:00'),
('OD08BUS008','Express 8','Semi-Sleeper',50,'Angul','Bhubaneswar','14:00:00','16:30:00'),
('OD09BUS009','Express 9','AC',50,'Jeypore','Cuttack','15:00:00','17:30:00'),
('OD10BUS010','Express 10','Non-AC',50,'Ganjam','Berhampur','16:00:00','18:30:00'),
('OD11BUS011','Express 11','Sleeper',50,'Bhubaneswar','Puri','17:00:00','19:30:00'),
('OD12BUS012','Express 12','Semi-Sleeper',50,'Cuttack','Rourkela','06:00:00','08:30:00'),
('OD13BUS013','Express 13','AC',50,'Berhampur','Sambalpur','07:00:00','09:30:00'),
('OD14BUS014','Express 14','Non-AC',50,'Puri','Balasore','08:00:00','10:30:00'),
('OD15BUS015','Express 15','Sleeper',50,'Rourkela','Angul','09:00:00','11:30:00'),
('OD16BUS016','Express 16','Semi-Sleeper',50,'Sambalpur','Jeypore','10:00:00','12:30:00'),
('OD17BUS017','Express 17','AC',50,'Balasore','Ganjam','11:00:00','13:30:00'),
('OD18BUS018','Express 18','Non-AC',50,'Angul','Bhubaneswar','12:00:00','14:30:00'),
('OD19BUS019','Express 19','Sleeper',50,'Jeypore','Cuttack','13:00:00','15:30:00'),
('OD20BUS020','Express 20','Semi-Sleeper',50,'Ganjam','Berhampur','14:00:00','16:30:00'),
('OD21BUS021','Express 21','AC',50,'Bhubaneswar','Puri','15:00:00','17:30:00'),
('OD22BUS022','Express 22','Non-AC',50,'Cuttack','Rourkela','16:00:00','18:30:00'),
('OD23BUS023','Express 23','Sleeper',50,'Berhampur','Sambalpur','17:00:00','19:30:00'),
('OD24BUS024','Express 24','Semi-Sleeper',50,'Puri','Balasore','06:00:00','08:30:00'),
('OD25BUS025','Express 25','AC',50,'Rourkela','Angul','07:00:00','09:30:00'),
('OD26BUS026','Express 26','Non-AC',50,'Sambalpur','Jeypore','08:00:00','10:30:00'),
('OD27BUS027','Express 27','Sleeper',50,'Balasore','Ganjam','09:00:00','11:30:00'),
('OD28BUS028','Express 28','Semi-Sleeper',50,'Angul','Bhubaneswar','10:00:00','12:30:00'),
('OD29BUS029','Express 29','AC',50,'Jeypore','Cuttack','11:00:00','13:30:00'),
('OD30BUS030','Express 30','Non-AC',50,'Ganjam','Berhampur','12:00:00','14:30:00'),
('OD31BUS031','Express 31','Sleeper',50,'Bhubaneswar','Puri','13:00:00','15:30:00'),
('OD32BUS032','Express 32','Semi-Sleeper',50,'Cuttack','Rourkela','14:00:00','16:30:00'),
('OD33BUS033','Express 33','AC',50,'Berhampur','Sambalpur','15:00:00','17:30:00'),
('OD34BUS034','Express 34','Non-AC',50,'Puri','Balasore','16:00:00','18:30:00'),
('OD35BUS035','Express 35','Sleeper',50,'Rourkela','Angul','17:00:00','19:30:00'),
('OD36BUS036','Express 36','Semi-Sleeper',50,'Sambalpur','Jeypore','06:00:00','08:30:00'),
('OD37BUS037','Express 37','AC',50,'Balasore','Ganjam','07:00:00','09:30:00'),
('OD38BUS038','Express 38','Non-AC',50,'Angul','Bhubaneswar','08:00:00','10:30:00'),
('OD39BUS039','Express 39','Sleeper',50,'Jeypore','Cuttack','09:00:00','11:30:00'),
('OD40BUS040','Express 40','Semi-Sleeper',50,'Ganjam','Berhampur','10:00:00','12:30:00'),
('OD41BUS041','Express 41','AC',50,'Bhubaneswar','Puri','11:00:00','13:30:00'),
('OD42BUS042','Express 42','Non-AC',50,'Cuttack','Rourkela','12:00:00','14:30:00'),
('OD43BUS043','Express 43','Sleeper',50,'Berhampur','Sambalpur','13:00:00','15:30:00'),
('OD44BUS044','Express 44','Semi-Sleeper',50,'Puri','Balasore','14:00:00','16:30:00'),
('OD45BUS045','Express 45','AC',50,'Rourkela','Angul','15:00:00','17:30:00'),
('OD46BUS046','Express 46','Non-AC',50,'Sambalpur','Jeypore','16:00:00','18:30:00'),
('OD47BUS047','Express 47','Sleeper',50,'Balasore','Ganjam','17:00:00','19:30:00'),
('OD48BUS048','Express 48','Semi-Sleeper',50,'Angul','Bhubaneswar','06:00:00','08:30:00'),
('OD49BUS049','Express 49','AC',50,'Jeypore','Cuttack','07:00:00','09:30:00'),
('OD50BUS050','Express 50','Non-AC',50,'Ganjam','Berhampur','08:00:00','10:30:00'),
('OD51BUS051','Express 51','Sleeper',50,'Bhubaneswar','Puri','09:00:00','11:30:00'),
('OD52BUS052','Express 52','Semi-Sleeper',50,'Cuttack','Rourkela','10:00:00','12:30:00'),
('OD53BUS053','Express 53','AC',50,'Berhampur','Sambalpur','11:00:00','13:30:00'),
('OD54BUS054','Express 54','Non-AC',50,'Puri','Balasore','12:00:00','14:30:00'),
('OD55BUS055','Express 55','Sleeper',50,'Rourkela','Angul','13:00:00','15:30:00'),
('OD56BUS056','Express 56','Semi-Sleeper',50,'Sambalpur','Jeypore','14:00:00','16:30:00'),
('OD57BUS057','Express 57','AC',50,'Balasore','Ganjam','15:00:00','17:30:00'),
('OD58BUS058','Express 58','Non-AC',50,'Angul','Bhubaneswar','16:00:00','18:30:00'),
('OD59BUS059','Express 59','Sleeper',50,'Jeypore','Cuttack','17:00:00','19:30:00'),
('OD60BUS060','Express 60','Semi-Sleeper',50,'Ganjam','Berhampur','06:00:00','08:30:00'),
('OD61BUS061','Express 61','AC',50,'Bhubaneswar','Puri','07:00:00','09:30:00'),
('OD62BUS062','Express 62','Non-AC',50,'Cuttack','Rourkela','08:00:00','10:30:00'),
('OD63BUS063','Express 63','Sleeper',50,'Berhampur','Sambalpur','09:00:00','11:30:00'),
('OD64BUS064','Express 64','Semi-Sleeper',50,'Puri','Balasore','10:00:00','12:30:00'),
('OD65BUS065','Express 65','AC',50,'Rourkela','Angul','11:00:00','13:30:00'),
('OD66BUS066','Express 66','Non-AC',50,'Sambalpur','Jeypore','12:00:00','14:30:00'),
('OD67BUS067','Express 67','Sleeper',50,'Balasore','Ganjam','13:00:00','15:30:00'),
('OD68BUS068','Express 68','Semi-Sleeper',50,'Angul','Bhubaneswar','14:00:00','16:30:00'),
('OD69BUS069','Express 69','AC',50,'Jeypore','Cuttack','15:00:00','17:30:00'),
('OD70BUS070','Express 70','Non-AC',50,'Ganjam','Berhampur','16:00:00','18:30:00'),
('OD71BUS071','Express 71','Sleeper',50,'Bhubaneswar','Puri','17:00:00','19:30:00'),
('OD72BUS072','Express 72','Semi-Sleeper',50,'Cuttack','Rourkela','06:00:00','08:30:00'),
('OD73BUS073','Express 73','AC',50,'Berhampur','Sambalpur','07:00:00','09:30:00'),
('OD74BUS074','Express 74','Non-AC',50,'Puri','Balasore','08:00:00','10:30:00'),
('OD75BUS075','Express 75','Sleeper',50,'Rourkela','Angul','09:00:00','11:30:00'),
('OD76BUS076','Express 76','Semi-Sleeper',50,'Sambalpur','Jeypore','10:00:00','12:30:00'),
('OD77BUS077','Express 77','AC',50,'Balasore','Ganjam','11:00:00','13:30:00'),
('OD78BUS078','Express 78','Non-AC',50,'Angul','Bhubaneswar','12:00:00','14:30:00'),
('OD79BUS079','Express 79','Sleeper',50,'Jeypore','Cuttack','13:00:00','15:30:00'),
('OD80BUS080','Express 80','Semi-Sleeper',50,'Ganjam','Berhampur','14:00:00','16:30:00'),
('OD81BUS081','Express 81','AC',50,'Bhubaneswar','Puri','15:00:00','17:30:00'),
('OD82BUS082','Express 82','Non-AC',50,'Cuttack','Rourkela','16:00:00','18:30:00'),
('OD83BUS083','Express 83','Sleeper',50,'Berhampur','Sambalpur','17:00:00','19:30:00'),
('OD84BUS084','Express 84','Semi-Sleeper',50,'Puri','Balasore','06:00:00','08:30:00'),
('OD85BUS085','Express 85','AC',50,'Rourkela','Angul','07:00:00','09:30:00'),
('OD86BUS086','Express 86','Non-AC',50,'Sambalpur','Jeypore','08:00:00','10:30:00'),
('OD87BUS087','Express 87','Sleeper',50,'Balasore','Ganjam','09:00:00','11:30:00'),
('OD88BUS088','Express 88','Semi-Sleeper',50,'Angul','Bhubaneswar','10:00:00','12:30:00'),
('OD89BUS089','Express 89','AC',50,'Jeypore','Cuttack','11:00:00','13:30:00'),
('OD90BUS090','Express 90','Non-AC',50,'Ganjam','Berhampur','12:00:00','14:30:00'),
('OD91BUS091','Express 91','Sleeper',50,'Bhubaneswar','Puri','13:00:00','15:30:00'),
('OD92BUS092','Express 92','Semi-Sleeper',50,'Cuttack','Rourkela','14:00:00','16:30:00'),
('OD93BUS093','Express 93','AC',50,'Berhampur','Sambalpur','15:00:00','17:30:00'),
('OD94BUS094','Express 94','Non-AC',50,'Puri','Balasore','16:00:00','18:30:00'),
('OD95BUS095','Express 95','Sleeper',50,'Rourkela','Angul','17:00:00','19:30:00'),
('OD96BUS096','Express 96','Semi-Sleeper',50,'Sambalpur','Jeypore','06:00:00','08:30:00'),
('OD97BUS097','Express 97','AC',50,'Balasore','Ganjam','07:00:00','09:30:00'),
('OD98BUS098','Express 98','Non-AC',50,'Angul','Bhubaneswar','08:00:00','10:30:00'),
('OD99BUS099','Express 99','Sleeper',50,'Jeypore','Cuttack','09:00:00','11:30:00'),
('OD100BUS100','Express 100','Semi-Sleeper',50,'Ganjam','Berhampur','10:00:00','12:30:00');

INSERT INTO conductors (first_name,last_name,phone,email,experience_years)
VALUES
('Raj','Patel','8000000001','cond1@gmail.com',1),
('Sunil','Patel','8000000002','cond2@gmail.com',2),
('Kiran','Patel','8000000003','cond3@gmail.com',3),
('Ajay','Patel','8000000004','cond4@gmail.com',4),
('Ramesh','Patel','8000000005','cond5@gmail.com',5),
('Vijay','Patel','8000000006','cond6@gmail.com',6),
('Deepak','Patel','8000000007','cond7@gmail.com',7),
('Sanjay','Patel','8000000008','cond8@gmail.com',8),
('Anil','Patel','8000000009','cond9@gmail.com',9),
('Mahesh','Patel','8000000010','cond10@gmail.com',10),
('Raj','Das','8000000011','cond11@gmail.com',11),
('Sunil','Das','8000000012','cond12@gmail.com',12),
('Kiran','Das','8000000013','cond13@gmail.com',13),
('Ajay','Das','8000000014','cond14@gmail.com',14),
('Ramesh','Das','8000000015','cond15@gmail.com',15),
('Vijay','Das','8000000016','cond16@gmail.com',0),
('Deepak','Das','8000000017','cond17@gmail.com',1),
('Sanjay','Das','8000000018','cond18@gmail.com',2),
('Anil','Das','8000000019','cond19@gmail.com',3),
('Mahesh','Das','8000000020','cond20@gmail.com',4),
('Raj','Nayak','8000000021','cond21@gmail.com',5),
('Sunil','Nayak','8000000022','cond22@gmail.com',6),
('Kiran','Nayak','8000000023','cond23@gmail.com',7),
('Ajay','Nayak','8000000024','cond24@gmail.com',8),
('Ramesh','Nayak','8000000025','cond25@gmail.com',9),
('Vijay','Nayak','8000000026','cond26@gmail.com',10),
('Deepak','Nayak','8000000027','cond27@gmail.com',11),
('Sanjay','Nayak','8000000028','cond28@gmail.com',12),
('Anil','Nayak','8000000029','cond29@gmail.com',13),
('Mahesh','Nayak','8000000030','cond30@gmail.com',14),
('Raj','Patro','8000000031','cond31@gmail.com',15),
('Sunil','Patro','8000000032','cond32@gmail.com',0),
('Kiran','Patro','8000000033','cond33@gmail.com',1),
('Ajay','Patro','8000000034','cond34@gmail.com',2),
('Ramesh','Patro','8000000035','cond35@gmail.com',3),
('Vijay','Patro','8000000036','cond36@gmail.com',4),
('Deepak','Patro','8000000037','cond37@gmail.com',5),
('Sanjay','Patro','8000000038','cond38@gmail.com',6),
('Anil','Patro','8000000039','cond39@gmail.com',7),
('Mahesh','Patro','8000000040','cond40@gmail.com',8),
('Raj','Sharma','8000000041','cond41@gmail.com',9),
('Sunil','Sharma','8000000042','cond42@gmail.com',10),
('Kiran','Sharma','8000000043','cond43@gmail.com',11),
('Ajay','Sharma','8000000044','cond44@gmail.com',12),
('Ramesh','Sharma','8000000045','cond45@gmail.com',13),
('Vijay','Sharma','8000000046','cond46@gmail.com',14),
('Deepak','Sharma','8000000047','cond47@gmail.com',15),
('Sanjay','Sharma','8000000048','cond48@gmail.com',0),
('Anil','Sharma','8000000049','cond49@gmail.com',1),
('Mahesh','Sharma','8000000050','cond50@gmail.com',2),
('Raj','Patel','8000000051','cond51@gmail.com',3),
('Sunil','Patel','8000000052','cond52@gmail.com',4),
('Kiran','Patel','8000000053','cond53@gmail.com',5),
('Ajay','Patel','8000000054','cond54@gmail.com',6),
('Ramesh','Patel','8000000055','cond55@gmail.com',7),
('Vijay','Patel','8000000056','cond56@gmail.com',8),
('Deepak','Patel','8000000057','cond57@gmail.com',9),
('Sanjay','Patel','8000000058','cond58@gmail.com',10),
('Anil','Patel','8000000059','cond59@gmail.com',11),
('Mahesh','Patel','8000000060','cond60@gmail.com',12),
('Raj','Das','8000000061','cond61@gmail.com',13),
('Sunil','Das','8000000062','cond62@gmail.com',14),
('Kiran','Das','8000000063','cond63@gmail.com',15),
('Ajay','Das','8000000064','cond64@gmail.com',0),
('Ramesh','Das','8000000065','cond65@gmail.com',1),
('Vijay','Das','8000000066','cond66@gmail.com',2),
('Deepak','Das','8000000067','cond67@gmail.com',3),
('Sanjay','Das','8000000068','cond68@gmail.com',4),
('Anil','Das','8000000069','cond69@gmail.com',5),
('Mahesh','Das','8000000070','cond70@gmail.com',6),
('Raj','Nayak','8000000071','cond71@gmail.com',7),
('Sunil','Nayak','8000000072','cond72@gmail.com',8),
('Kiran','Nayak','8000000073','cond73@gmail.com',9),
('Ajay','Nayak','8000000074','cond74@gmail.com',10),
('Ramesh','Nayak','8000000075','cond75@gmail.com',11),
('Vijay','Nayak','8000000076','cond76@gmail.com',12),
('Deepak','Nayak','8000000077','cond77@gmail.com',13),
('Sanjay','Nayak','8000000078','cond78@gmail.com',14),
('Anil','Nayak','8000000079','cond79@gmail.com',15),
('Mahesh','Nayak','8000000080','cond80@gmail.com',0),
('Raj','Patro','8000000081','cond81@gmail.com',1),
('Sunil','Patro','8000000082','cond82@gmail.com',2),
('Kiran','Patro','8000000083','cond83@gmail.com',3),
('Ajay','Patro','8000000084','cond84@gmail.com',4),
('Ramesh','Patro','8000000085','cond85@gmail.com',5),
('Vijay','Patro','8000000086','cond86@gmail.com',6),
('Deepak','Patro','8000000087','cond87@gmail.com',7),
('Sanjay','Patro','8000000088','cond88@gmail.com',8),
('Anil','Patro','8000000089','cond89@gmail.com',9),
('Mahesh','Patro','8000000090','cond90@gmail.com',10),
('Raj','Sharma','8000000091','cond91@gmail.com',11),
('Sunil','Sharma','8000000092','cond92@gmail.com',12),
('Kiran','Sharma','8000000093','cond93@gmail.com',13),
('Ajay','Sharma','8000000094','cond94@gmail.com',14),
('Ramesh','Sharma','8000000095','cond95@gmail.com',15),
('Vijay','Sharma','8000000096','cond96@gmail.com',0),
('Deepak','Sharma','8000000097','cond97@gmail.com',1),
('Sanjay','Sharma','8000000098','cond98@gmail.com',2),
('Anil','Sharma','8000000099','cond99@gmail.com',3),
('Mahesh','Sharma','8000000100','cond100@gmail.com',4);

INSERT INTO tickets (ticket_number,booking_date,journey_date,seat_number,fare)
VALUES
('TKT00001','2026-06-02','2026-07-02','S1',375.00),
('TKT00002','2026-06-03','2026-07-03','S2',400.00),
('TKT00003','2026-06-04','2026-07-04','S3',425.00),
('TKT00004','2026-06-05','2026-07-05','S4',450.00),
('TKT00005','2026-06-06','2026-07-06','S5',475.00),
('TKT00006','2026-06-07','2026-07-07','S6',500.00),
('TKT00007','2026-06-08','2026-07-08','S7',525.00),
('TKT00008','2026-06-09','2026-07-09','S8',550.00),
('TKT00009','2026-06-10','2026-07-10','S9',575.00),
('TKT00010','2026-06-11','2026-07-11','S10',600.00),
('TKT00011','2026-06-12','2026-07-12','S11',625.00),
('TKT00012','2026-06-13','2026-07-13','S12',650.00),
('TKT00013','2026-06-14','2026-07-14','S13',675.00),
('TKT00014','2026-06-15','2026-07-15','S14',700.00),
('TKT00015','2026-06-16','2026-07-16','S15',725.00),
('TKT00016','2026-06-17','2026-07-17','S16',750.00),
('TKT00017','2026-06-18','2026-07-18','S17',775.00),
('TKT00018','2026-06-19','2026-07-19','S18',800.00),
('TKT00019','2026-06-20','2026-07-20','S19',825.00),
('TKT00020','2026-06-21','2026-07-21','S20',350.00),
('TKT00021','2026-06-22','2026-07-22','S21',375.00),
('TKT00022','2026-06-23','2026-07-23','S22',400.00),
('TKT00023','2026-06-24','2026-07-24','S23',425.00),
('TKT00024','2026-06-25','2026-07-25','S24',450.00),
('TKT00025','2026-06-26','2026-07-26','S25',475.00),
('TKT00026','2026-06-27','2026-07-27','S26',500.00),
('TKT00027','2026-06-28','2026-07-28','S27',525.00),
('TKT00028','2026-06-01','2026-07-01','S28',550.00),
('TKT00029','2026-06-02','2026-07-02','S29',575.00),
('TKT00030','2026-06-03','2026-07-03','S30',600.00),
('TKT00031','2026-06-04','2026-07-04','S31',625.00),
('TKT00032','2026-06-05','2026-07-05','S32',650.00),
('TKT00033','2026-06-06','2026-07-06','S33',675.00),
('TKT00034','2026-06-07','2026-07-07','S34',700.00),
('TKT00035','2026-06-08','2026-07-08','S35',725.00),
('TKT00036','2026-06-09','2026-07-09','S36',750.00),
('TKT00037','2026-06-10','2026-07-10','S37',775.00),
('TKT00038','2026-06-11','2026-07-11','S38',800.00),
('TKT00039','2026-06-12','2026-07-12','S39',825.00),
('TKT00040','2026-06-13','2026-07-13','S40',350.00),
('TKT00041','2026-06-14','2026-07-14','S41',375.00),
('TKT00042','2026-06-15','2026-07-15','S42',400.00),
('TKT00043','2026-06-16','2026-07-16','S43',425.00),
('TKT00044','2026-06-17','2026-07-17','S44',450.00),
('TKT00045','2026-06-18','2026-07-18','S45',475.00),
('TKT00046','2026-06-19','2026-07-19','S46',500.00),
('TKT00047','2026-06-20','2026-07-20','S47',525.00),
('TKT00048','2026-06-21','2026-07-21','S48',550.00),
('TKT00049','2026-06-22','2026-07-22','S49',575.00),
('TKT00050','2026-06-23','2026-07-23','S50',600.00),
('TKT00051','2026-06-24','2026-07-24','S1',625.00),
('TKT00052','2026-06-25','2026-07-25','S2',650.00),
('TKT00053','2026-06-26','2026-07-26','S3',675.00),
('TKT00054','2026-06-27','2026-07-27','S4',700.00),
('TKT00055','2026-06-28','2026-07-28','S5',725.00),
('TKT00056','2026-06-01','2026-07-01','S6',750.00),
('TKT00057','2026-06-02','2026-07-02','S7',775.00),
('TKT00058','2026-06-03','2026-07-03','S8',800.00),
('TKT00059','2026-06-04','2026-07-04','S9',825.00),
('TKT00060','2026-06-05','2026-07-05','S10',350.00),
('TKT00061','2026-06-06','2026-07-06','S11',375.00),
('TKT00062','2026-06-07','2026-07-07','S12',400.00),
('TKT00063','2026-06-08','2026-07-08','S13',425.00),
('TKT00064','2026-06-09','2026-07-09','S14',450.00),
('TKT00065','2026-06-10','2026-07-10','S15',475.00),
('TKT00066','2026-06-11','2026-07-11','S16',500.00),
('TKT00067','2026-06-12','2026-07-12','S17',525.00),
('TKT00068','2026-06-13','2026-07-13','S18',550.00),
('TKT00069','2026-06-14','2026-07-14','S19',575.00),
('TKT00070','2026-06-15','2026-07-15','S20',600.00),
('TKT00071','2026-06-16','2026-07-16','S21',625.00),
('TKT00072','2026-06-17','2026-07-17','S22',650.00),
('TKT00073','2026-06-18','2026-07-18','S23',675.00),
('TKT00074','2026-06-19','2026-07-19','S24',700.00),
('TKT00075','2026-06-20','2026-07-20','S25',725.00),
('TKT00076','2026-06-21','2026-07-21','S26',750.00),
('TKT00077','2026-06-22','2026-07-22','S27',775.00),
('TKT00078','2026-06-23','2026-07-23','S28',800.00),
('TKT00079','2026-06-24','2026-07-24','S29',825.00),
('TKT00080','2026-06-25','2026-07-25','S30',350.00),
('TKT00081','2026-06-26','2026-07-26','S31',375.00),
('TKT00082','2026-06-27','2026-07-27','S32',400.00),
('TKT00083','2026-06-28','2026-07-28','S33',425.00),
('TKT00084','2026-06-01','2026-07-01','S34',450.00),
('TKT00085','2026-06-02','2026-07-02','S35',475.00),
('TKT00086','2026-06-03','2026-07-03','S36',500.00),
('TKT00087','2026-06-04','2026-07-04','S37',525.00),
('TKT00088','2026-06-05','2026-07-05','S38',550.00),
('TKT00089','2026-06-06','2026-07-06','S39',575.00),
('TKT00090','2026-06-07','2026-07-07','S40',600.00),
('TKT00091','2026-06-08','2026-07-08','S41',625.00),
('TKT00092','2026-06-09','2026-07-09','S42',650.00),
('TKT00093','2026-06-10','2026-07-10','S43',675.00),
('TKT00094','2026-06-11','2026-07-11','S44',700.00),
('TKT00095','2026-06-12','2026-07-12','S45',725.00),
('TKT00096','2026-06-13','2026-07-13','S46',750.00),
('TKT00097','2026-06-14','2026-07-14','S47',775.00),
('TKT00098','2026-06-15','2026-07-15','S48',800.00),
('TKT00099','2026-06-16','2026-07-16','S49',825.00),
('TKT00100','2026-06-17','2026-07-17','S50',350.00);

INSERT INTO passenger_ticket (p_id,t_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30),
(31,31),
(32,32),
(33,33),
(34,34),
(35,35),
(36,36),
(37,37),
(38,38),
(39,39),
(40,40),
(41,41),
(42,42),
(43,43),
(44,44),
(45,45),
(46,46),
(47,47),
(48,48),
(49,49),
(50,50),
(51,51),
(52,52),
(53,53),
(54,54),
(55,55),
(56,56),
(57,57),
(58,58),
(59,59),
(60,60),
(61,61),
(62,62),
(63,63),
(64,64),
(65,65),
(66,66),
(67,67),
(68,68),
(69,69),
(70,70),
(71,71),
(72,72),
(73,73),
(74,74),
(75,75),
(76,76),
(77,77),
(78,78),
(79,79),
(80,80),
(81,81),
(82,82),
(83,83),
(84,84),
(85,85),
(86,86),
(87,87),
(88,88),
(89,89),
(90,90),
(91,91),
(92,92),
(93,93),
(94,94),
(95,95),
(96,96),
(97,97),
(98,98),
(99,99),
(100,100);

INSERT INTO passenger_bus (p_id,b_number)
VALUES
(1,'OD01BUS001'),
(2,'OD02BUS002'),
(3,'OD03BUS003'),
(4,'OD04BUS004'),
(5,'OD05BUS005'),
(6,'OD06BUS006'),
(7,'OD07BUS007'),
(8,'OD08BUS008'),
(9,'OD09BUS009'),
(10,'OD10BUS010'),
(11,'OD11BUS011'),
(12,'OD12BUS012'),
(13,'OD13BUS013'),
(14,'OD14BUS014'),
(15,'OD15BUS015'),
(16,'OD16BUS016'),
(17,'OD17BUS017'),
(18,'OD18BUS018'),
(19,'OD19BUS019'),
(20,'OD20BUS020'),
(21,'OD21BUS021'),
(22,'OD22BUS022'),
(23,'OD23BUS023'),
(24,'OD24BUS024'),
(25,'OD25BUS025'),
(26,'OD26BUS026'),
(27,'OD27BUS027'),
(28,'OD28BUS028'),
(29,'OD29BUS029'),
(30,'OD30BUS030'),
(31,'OD31BUS031'),
(32,'OD32BUS032'),
(33,'OD33BUS033'),
(34,'OD34BUS034'),
(35,'OD35BUS035'),
(36,'OD36BUS036'),
(37,'OD37BUS037'),
(38,'OD38BUS038'),
(39,'OD39BUS039'),
(40,'OD40BUS040'),
(41,'OD41BUS041'),
(42,'OD42BUS042'),
(43,'OD43BUS043'),
(44,'OD44BUS044'),
(45,'OD45BUS045'),
(46,'OD46BUS046'),
(47,'OD47BUS047'),
(48,'OD48BUS048'),
(49,'OD49BUS049'),
(50,'OD50BUS050'),
(51,'OD51BUS051'),
(52,'OD52BUS052'),
(53,'OD53BUS053'),
(54,'OD54BUS054'),
(55,'OD55BUS055'),
(56,'OD56BUS056'),
(57,'OD57BUS057'),
(58,'OD58BUS058'),
(59,'OD59BUS059'),
(60,'OD60BUS060'),
(61,'OD61BUS061'),
(62,'OD62BUS062'),
(63,'OD63BUS063'),
(64,'OD64BUS064'),
(65,'OD65BUS065'),
(66,'OD66BUS066'),
(67,'OD67BUS067'),
(68,'OD68BUS068'),
(69,'OD69BUS069'),
(70,'OD70BUS070'),
(71,'OD71BUS071'),
(72,'OD72BUS072'),
(73,'OD73BUS073'),
(74,'OD74BUS074'),
(75,'OD75BUS075'),
(76,'OD76BUS076'),
(77,'OD77BUS077'),
(78,'OD78BUS078'),
(79,'OD79BUS079'),
(80,'OD80BUS080'),
(81,'OD81BUS081'),
(82,'OD82BUS082'),
(83,'OD83BUS083'),
(84,'OD84BUS084'),
(85,'OD85BUS085'),
(86,'OD86BUS086'),
(87,'OD87BUS087'),
(88,'OD88BUS088'),
(89,'OD89BUS089'),
(90,'OD90BUS090'),
(91,'OD91BUS091'),
(92,'OD92BUS092'),
(93,'OD93BUS093'),
(94,'OD94BUS094'),
(95,'OD95BUS095'),
(96,'OD96BUS096'),
(97,'OD97BUS097'),
(98,'OD98BUS098'),
(99,'OD99BUS099'),
(100,'OD100BUS100');

INSERT INTO conductor_bus (c_id,b_number)
VALUES
(1,'OD01BUS001'),
(2,'OD02BUS002'),
(3,'OD03BUS003'),
(4,'OD04BUS004'),
(5,'OD05BUS005'),
(6,'OD06BUS006'),
(7,'OD07BUS007'),
(8,'OD08BUS008'),
(9,'OD09BUS009'),
(10,'OD10BUS010'),
(11,'OD11BUS011'),
(12,'OD12BUS012'),
(13,'OD13BUS013'),
(14,'OD14BUS014'),
(15,'OD15BUS015'),
(16,'OD16BUS016'),
(17,'OD17BUS017'),
(18,'OD18BUS018'),
(19,'OD19BUS019'),
(20,'OD20BUS020'),
(21,'OD21BUS021'),
(22,'OD22BUS022'),
(23,'OD23BUS023'),
(24,'OD24BUS024'),
(25,'OD25BUS025'),
(26,'OD26BUS026'),
(27,'OD27BUS027'),
(28,'OD28BUS028'),
(29,'OD29BUS029'),
(30,'OD30BUS030'),
(31,'OD31BUS031'),
(32,'OD32BUS032'),
(33,'OD33BUS033'),
(34,'OD34BUS034'),
(35,'OD35BUS035'),
(36,'OD36BUS036'),
(37,'OD37BUS037'),
(38,'OD38BUS038'),
(39,'OD39BUS039'),
(40,'OD40BUS040'),
(41,'OD41BUS041'),
(42,'OD42BUS042'),
(43,'OD43BUS043'),
(44,'OD44BUS044'),
(45,'OD45BUS045'),
(46,'OD46BUS046'),
(47,'OD47BUS047'),
(48,'OD48BUS048'),
(49,'OD49BUS049'),
(50,'OD50BUS050'),
(51,'OD51BUS051'),
(52,'OD52BUS052'),
(53,'OD53BUS053'),
(54,'OD54BUS054'),
(55,'OD55BUS055'),
(56,'OD56BUS056'),
(57,'OD57BUS057'),
(58,'OD58BUS058'),
(59,'OD59BUS059'),
(60,'OD60BUS060'),
(61,'OD61BUS061'),
(62,'OD62BUS062'),
(63,'OD63BUS063'),
(64,'OD64BUS064'),
(65,'OD65BUS065'),
(66,'OD66BUS066'),
(67,'OD67BUS067'),
(68,'OD68BUS068'),
(69,'OD69BUS069'),
(70,'OD70BUS070'),
(71,'OD71BUS071'),
(72,'OD72BUS072'),
(73,'OD73BUS073'),
(74,'OD74BUS074'),
(75,'OD75BUS075'),
(76,'OD76BUS076'),
(77,'OD77BUS077'),
(78,'OD78BUS078'),
(79,'OD79BUS079'),
(80,'OD80BUS080'),
(81,'OD81BUS081'),
(82,'OD82BUS082'),
(83,'OD83BUS083'),
(84,'OD84BUS084'),
(85,'OD85BUS085'),
(86,'OD86BUS086'),
(87,'OD87BUS087'),
(88,'OD88BUS088'),
(89,'OD89BUS089'),
(90,'OD90BUS090'),
(91,'OD91BUS091'),
(92,'OD92BUS092'),
(93,'OD93BUS093'),
(94,'OD94BUS094'),
(95,'OD95BUS095'),
(96,'OD96BUS096'),
(97,'OD97BUS097'),
(98,'OD98BUS098'),
(99,'OD99BUS099'),
(100,'OD100BUS100');

INSERT INTO conductor_ticket (c_id,t_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20),
(21,21),
(22,22),
(23,23),
(24,24),
(25,25),
(26,26),
(27,27),
(28,28),
(29,29),
(30,30),
(31,31),
(32,32),
(33,33),
(34,34),
(35,35),
(36,36),
(37,37),
(38,38),
(39,39),
(40,40),
(41,41),
(42,42),
(43,43),
(44,44),
(45,45),
(46,46),
(47,47),
(48,48),
(49,49),
(50,50),
(51,51),
(52,52),
(53,53),
(54,54),
(55,55),
(56,56),
(57,57),
(58,58),
(59,59),
(60,60),
(61,61),
(62,62),
(63,63),
(64,64),
(65,65),
(66,66),
(67,67),
(68,68),
(69,69),
(70,70),
(71,71),
(72,72),
(73,73),
(74,74),
(75,75),
(76,76),
(77,77),
(78,78),
(79,79),
(80,80),
(81,81),
(82,82),
(83,83),
(84,84),
(85,85),
(86,86),
(87,87),
(88,88),
(89,89),
(90,90),
(91,91),
(92,92),
(93,93),
(94,94),
(95,95),
(96,96),
(97,97),
(98,98),
(99,99),
(100,100);

-- Display all passengers
SELECT * FROM passengers;

-- Display all buses
SELECT * FROM buses;

-- Display all conductors
SELECT * FROM conductors;

--  Display all tickets
SELECT * FROM tickets;

--  Display only female passengers
SELECT *
FROM passengers
WHERE gender='Female';

--  Display AC buses
SELECT *
FROM buses
WHERE bus_type='AC';

--  Display tickets costing more than 500
SELECT *
FROM tickets
WHERE fare>500;

--  Display buses ordered by bus name
SELECT *
FROM buses
ORDER BY bus_name;

-- Add a new column to passengers table
ALTER TABLE passengers
ADD emergency_contact VARCHAR(15);


--  Modify the size of bus_name column
ALTER TABLE buses
MODIFY bus_name VARCHAR(150);


-- Drop the added emergency_contact column
ALTER TABLE passengers
DROP COLUMN emergency_contact;

-- INDEXES
-- Index on Passenger Name
CREATE INDEX idx_passenger_name
ON passengers(first_name);

-- Index on Bus Name
CREATE INDEX idx_bus_name
ON buses(bus_name);

-- Index on Ticket Number
CREATE INDEX idx_ticket_number
ON tickets(ticket_number);

SHOW INDEX FROM passengers;
SHOW INDEX FROM buses;
SHOW INDEX FROM tickets;

-- JOINS

-- Display Passenger Details with Ticket Details
SELECT
    p.p_id,
    CONCAT(p.first_name,' ',p.last_name) AS passenger_name,
    t.ticket_number,
    t.seat_number,
    t.fare
FROM passengers p
INNER JOIN passenger_ticket pt
ON p.p_id = pt.p_id
INNER JOIN tickets t
ON pt.t_id = t.t_id;


-- Display Passenger Details with Bus Details
SELECT
    p.p_id,
    CONCAT(p.first_name,' ',p.last_name) AS passenger_name,
    b.bus_name,
    b.source,
    b.destination
FROM passengers p
INNER JOIN passenger_bus pb
ON p.p_id = pb.p_id
INNER JOIN buses b
ON pb.b_id = b.b_number;

-- Display Conductor Details with Assigned Bus
SELECT
    c.c_id,
    CONCAT(c.first_name,' ',c.last_name) AS conductor_name,
    b.bus_name,
    b.bus_type
FROM conductors c
INNER JOIN conductor_bus cb
ON c.c_id = cb.c_id
INNER JOIN buses b
ON cb.b_id = b.b_number;

-- Display Ticket Checked by Conductor
SELECT
    t.ticket_number,
    CONCAT(c.first_name,' ',c.last_name) AS checked_by,
    ct.checked_at
FROM tickets t
INNER JOIN conductor_ticket ct
ON t.t_id = ct.t_id
INNER JOIN conductors c
ON ct.c_id = c.c_id;

-- Complete Passenger Journey Details
SELECT
    CONCAT(p.first_name,' ',p.last_name) AS passenger_name,
    b.bus_name,
    b.source,
    b.destination,
    t.ticket_number,
    t.seat_number,
    t.fare
FROM passengers p
INNER JOIN passenger_bus pb
ON p.p_id = pb.p_id
INNER JOIN buses b
ON pb.b_id = b.b_number
INNER JOIN passenger_ticket pt
ON p.p_id = pt.p_id
INNER JOIN tickets t
ON pt.t_id = t.t_id;

-- AGGREGATE FUNCTIONS

-- Count Total Passengers
SELECT COUNT(*) AS Total_Passengers
FROM passengers;


-- Calculate Total Ticket Revenue
SELECT SUM(fare) AS Total_Revenue
FROM tickets;


-- Calculate Average Ticket Fare
SELECT AVG(fare) AS Average_Fare
FROM tickets;


-- Display Highest Ticket Fare
SELECT MAX(fare) AS Highest_Fare
FROM tickets;


-- Display Lowest Ticket Fare
SELECT MIN(fare) AS Lowest_Fare
FROM tickets;


-- GROUP BY & HAVING QUERIES
-- Count Passengers Travelling in Each Bus
SELECT
    b_number,
    COUNT(p_id) AS Total_Passengers
FROM passenger_bus
GROUP BY b_number;


-- Count Tickets Checked by Each Conductor
SELECT
    c_id,
    COUNT(t_id) AS Total_Tickets_Checked
FROM conductor_ticket
GROUP BY c_id;


-- Display Average Ticket Fare for Each Seat Number
SELECT
    seat_number,
    AVG(fare) AS Average_Fare
FROM tickets
GROUP BY seat_number;


-- Display Buses Having More Than One Passenger
SELECT
    b_number,
    COUNT(p_id) AS Total_Passengers
FROM passenger_bus
GROUP BY b_number
HAVING COUNT(p_id) > 1;


-- Display Conductors Who Checked More Than One Ticket
SELECT
    c_id,
    COUNT(t_id) AS Total_Tickets_Checked
FROM conductor_ticket
GROUP BY c_id
HAVING COUNT(t_id) > 1;


-- NESTED QUERIES
-- Display Passenger(s) Who Purchased the Highest Fare Ticket
SELECT *
FROM passengers
WHERE p_id IN (
    SELECT p_id
    FROM passenger_ticket
    WHERE t_id = (
        SELECT t_id
        FROM tickets
        WHERE fare = (
            SELECT MAX(fare)
            FROM tickets
        )
    )
);


--  Display Bus Details Having the Maximum Number of Passengers
SELECT *
FROM buses
WHERE b_number = (
    SELECT b_number
    FROM passenger_bus
    GROUP BY b_number
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- Display Ticket(s) Whose Fare is Greater Than the Average Fare
SELECT *
FROM tickets
WHERE fare > (
    SELECT AVG(fare)
    FROM tickets
);


-- Display Passenger(s) Who Have Not Purchased Any Ticket
SELECT *
FROM passengers
WHERE p_id NOT IN (
    SELECT p_id
    FROM passenger_ticket
);


-- Display Conductor(s) Who Have Checked the Maximum Number of Tickets
SELECT *
FROM conductors
WHERE c_id = (
    SELECT c_id
    FROM conductor_ticket
    GROUP BY c_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- VIEWS

DROP VIEW IF EXISTS passenger_ticket_details;
DROP VIEW IF EXISTS passenger_bus_details;
DROP VIEW IF EXISTS conductor_bus_details;
-- Passenger Ticket Details
CREATE VIEW passenger_ticket_details AS
SELECT
    p.p_id,
    CONCAT(p.first_name, ' ', p.last_name) AS passenger_name,
    t.ticket_number,
    t.seat_number,
    t.fare
FROM passengers p
INNER JOIN passenger_ticket pt
    ON p.p_id = pt.p_id
INNER JOIN tickets t
    ON pt.t_id = t.t_id;


-- Passenger Bus Details

CREATE VIEW passenger_bus_details AS
SELECT
    p.p_id,
    CONCAT(p.first_name, ' ', p.last_name) AS passenger_name,
    b.b_number,
    b.bus_name,
    b.bus_type,
    b.source,
    b.destination,
    b.departure_time,
    b.arrival_time
FROM passengers p
INNER JOIN passenger_bus pb
    ON p.p_id = pb.p_id
INNER JOIN buses b
    ON pb.b_number = b.b_number;

-- Conductor Bus Details
CREATE VIEW conductor_bus_details AS
SELECT
    c.c_id,
    CONCAT(c.first_name, ' ', c.last_name) AS conductor_name,
    b.b_number,
    b.bus_name,
    b.bus_type,
    b.source,
    b.destination,
    b.departure_time,
    b.arrival_time
FROM conductors c
INNER JOIN conductor_bus cb
    ON c.c_id = cb.c_id
INNER JOIN buses b
    ON cb.b_number = b.b_number;


SELECT * FROM passenger_ticket_details;
SELECT * FROM passenger_bus_details;
SELECT * FROM conductor_bus_details;

