CREATE DATABASE BUSLUGGAGE;


USE busluggage;


CREATE TABLE Buses (
    Bus_ID INT PRIMARY KEY,
    NumberPlate VARCHAR(255),
    DriversName VARCHAR(255)
);



INSERT INTO Buses (Bus_ID, NumberPlate, DriversName) 
VALUES 
(1, 'UAX-124U', 'RIAK JAMES'), 
(2, 'UBH-222K', 'Raymond M'), 
(3, 'UBB-345S', 'Samuel Kabanda'), 
(4, 'UAH-003L', 'Katende Francis'), 
(5, 'UBK-584P', 'OKELLO JIMMY');


CREATE TABLE Drivers (
    Driver_ID INT PRIMARY KEY,
    Driver_Name VARCHAR(255),
    Contact VARCHAR(255),
    Bus_ID INT,
    FOREIGN KEY (Bus_ID) REFERENCES Buses(Bus_ID)
);


INSERT INTO Drivers (Driver_ID, Driver_Name, Contact, Bus_ID) 
VALUES
(1, 'RIAK JAMES', '077737383', 1),
(2, 'Raymond M', '074823829', 2),
(3, 'Samuel Kabanda', '0784323424', 3),
(4, 'Katende Francis', '0764323143', 4),
(5, 'OKELLO JIMMY', '0755032436', 5);


CREATE TABLE Routes (
    Route_ID INT PRIMARY KEY,
    Origin VARCHAR(255),
    Destination VARCHAR(255)
);


INSERT INTO Routes (Route_ID, Origin, Destination) 
VALUES 
(4, 'KAMPALA', 'GULU'), 
(3, 'ARUA', 'KAMPALA'), 
(1, 'PAKWACH', 'GULU'), 
(2, 'KABALE', 'MBARARA'), 
(5, 'KASESE', 'FORT PORTAL');


CREATE TABLE Delivery (
    Delivery_ID INT PRIMARY KEY,
    Status_of_Delivery VARCHAR(255),
    Delivery_Date VARCHAR(255),
    Booking_ID INT,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);


INSERT INTO Delivery (Delivery_ID, Status_of_Delivery, Delivery_Date, Booking_ID) 
VALUES 
(1, 'In Transit', '2024-11-14', 1),
(2, 'Delivered', '2024-11-15', 2),
(3, 'In Transit', '2024-11-12', 3),
(4, 'Delivered', '2024-11-12', 4),
(5, 'In Transit', '2024-11-25', 5);






CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Booking_Date VARCHAR(255),
    Delivery_Date VARCHAR(255),
    Customer_ID INT,
    Receiver_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Receiver_ID) REFERENCES Receiver(Receiver_ID)
);

INSERT INTO Booking (Booking_ID, Booking_Date, Delivery_Date, Customer_ID, Receiver_ID) 
VALUES 
(1, '2024-11-10', '2024-11-14', 1, 1),
(2, '2024-11-12', '2024-11-15', 2, 2),
(3, '2024-11-09', '2024-11-12', 3, 3),
(4, '2024-11-11', '2024-11-12', 4, 4),
(5, '2024-11-22', '2024-11-25', 5, 5);



CREATE TABLE Luggage (
    Luggage_ID INT PRIMARY KEY,
    Type_of_Luggage VARCHAR(255),
    Booking_ID INT,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

INSERT INTO Luggage (Luggage_ID, Type_of_Luggage, Booking_ID) 
VALUES 
(1, 'fragile', 1),
(2, 'perishable', 2),
(3, 'perishable', 3),
(4, 'fragile', 4),
(5, 'fragile', 5);






-- Create Table Payment
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Amount INT,
    Payment_Method VARCHAR(255),
    Booking_ID INT,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

INSERT INTO Payment (Payment_ID, Amount, Payment_Method, Booking_ID) 
VALUES 
(1, 20000, 'Credit Card', 1),
(2, 30000, 'Cash', 2),
(3, 10000, 'Cash', 3),
(4, 15000, 'Credit Card', 4),
(5, 50000, 'Cash', 5);





CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(255),
    Contact VARCHAR(255),
    Customer_Address VARCHAR(255)
);

INSERT INTO Customer (Customer_ID, Customer_Name, Contact, Customer_Address) 
VALUES 
(1, 'OBONG EMMANUEL', '0787789896', 'KAPCHORWA'),
(2, 'BYANSI CHARLES', '0761551286', 'MUKONO'),
(3, 'KAMOGA AKRAM', '0707781233', 'MPIGI'),
(4, 'FRED ENANGA', '0709845322', 'KAJJANSI'),
(5, 'BARBRA KATUNGI', '0712898969', 'KITALYA');




CREATE TABLE Receiver (
    Receiver_ID INT PRIMARY KEY,
    Receiver_Name VARCHAR(255),
    Contact VARCHAR(255),
    Receiver_Address VARCHAR(255)
);

INSERT INTO Receiver (Receiver_ID, Receiver_Name, Contact, Receiver_Address) 
VALUES 
(1, 'Mark NSAMBA', '070654321', 'KASESE'),
(2, 'KANSIIME JOHN', '078932321', 'MBARARA'),
(3, 'DANIEL MATOVU', '0708453424', 'FORT PORTAL'),
(4, 'KIDEA BROWN', '0743123454', 'MASAKA'),
(5, 'SHARIF ACHEN', '0709848932', 'ENTEBBE');






DESCRIBE Buses;
DESCRIBE Drivers;
DESCRIBE Routes;
DESCRIBE Delivery;
DESCRIBE Booking;
DESCRIBE Luggage;
DESCRIBE Payment;
DESCRIBE Customer;
DESCRIBE Receiver;
