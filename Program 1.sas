/* -----------------Creation----------------- */

/* Create the Customer table */
proc sql;
create table LIB1645.Customer1645 (
    CustomerID1645 int primary key,
    FName varchar(255),
    FLName varchar(255),
    Address varchar(255),
    Phone varchar(20),
    EmailAddress varchar(255)
);
quit;

/* Create the Employee table */
proc sql;
create table LIB1645.Employee1645 (
    EmployeeID1645 int primary key,
    FName varchar(255),
    LName varchar(255),
    Address varchar(255),
    Phone varchar(20),
    EmailAddress varchar(255)
    
);
quit;

/* Create the Rental Location table */
PROC SQL;
CREATE TABLE LIB1645.RentalLocation1645 (
    LocationID1645 INT PRIMARY KEY,
    Name VARCHAR(100),
	Street INT,
	SUBURB VARCHAR(25),
	POSTCODE VARCHAR(5),
	PhoneNo VARCHAR(20),
	CONTACTINFO Varchar(100)
);
QUIT;


/* Create the Vehicle table */
proc sql;
create table LIB1645.Vehicle1645 (
    VehicleID1645 int primary key,
    Model varchar(255),
    Make varchar(255),
    Year int,
    Color varchar(50),
    RentalPricePerDay int
    
);
quit;

/* Create the VehicleAvailability table */
proc sql;
create table LIB1645.VehicleAvailability1645 (
    AvailabilityID1645 int primary key,
    LocationID1645 int, /* Foreign key referencing RentalLocation1645 table */
    VehicleID1645 int, /* Foreign key referencing Vehicle1645 table */
    RentalDate date,
    AvailibilityStatus VARCHAR(50)
   
);
quit;
/* Creating RentalTransaction Table*/
proc sql;
CREATE TABLE LIB1645.RentalTransaction1645 (
    TransactionID1645 INT PRIMARY KEY,
    VehicleID1645 INT,
    LocationID1645 INT,
    EmployeeID1645 INT,
    CustomerID1645 INT,
    RentalDate DATE,
    ReturnDate DATE,
    RentalPrice INT,
    CONSTRAINT FK_VehicleID1645 FOREIGN KEY (VehicleID1645) REFERENCES LIB1645.Vehicle1645(VehicleID1645),
    CONSTRAINT FK_LocationID1645 FOREIGN KEY (LocationID1645) REFERENCES LIB1645.RentalLocation1645(LocationID1645),
    CONSTRAINT FK_EmployeeID1645 FOREIGN KEY (EmployeeID1645) REFERENCES LIB1645.Employee1645(EmployeeID1645),
    CONSTRAINT FK_CustomerID1645 FOREIGN KEY (CustomerID1645) REFERENCES LIB1645.Customer1645(CustomerID1645)
);
quit;

/* Creating Reservation Table */
proc sql;
describe table LIB1645.Reservation1645;
CREATE TABLE LIB1645.Reservation1645 (
    ReservationID1645 INT PRIMARY KEY,
    CustomerID1645 INT,
    VehicleID1645 INT,
    PickupLocation VARCHAR(100),
    DropoffLocation VARCHAR(100),
    PickupDate DATE,
    DropoffDate DATE,
    ReservationDate DATE,
    CONSTRAINT FK_CustomerID1645 FOREIGN KEY (CustomerID1645) REFERENCES LIB1645.Customer1645(CustomerID1645),
    CONSTRAINT FK_VehicleID1645 FOREIGN KEY (VehicleID1645) REFERENCES LIB1645.Vehicle1645(VehicleID1645)
);
quit;

/* Drop */

proc sql;
ALTER TABLE LIB1645.RentalTransaction1645 DROP CONSTRAINT fk_VehicleID1645;
ALTER TABLE LIB1645.RentalTransaction1645 DROP CONSTRAINT fk_LocationID1645;
ALTER TABLE LIB1645.RentalTransaction1645 DROP CONSTRAINT fk_EmployeeID1645;
ALTER TABLE LIB1645.RentalTransaction1645 DROP CONSTRAINT fk_CustomerID1645;
DROP TABLE LIB1645.RentalTransaction1645;

ALTER TABLE LIB1645.VehicleAvailability1645 DROP CONSTRAINT fk_VehicleID1645;
ALTER TABLE LIB1645.VehicleAvailability1645 DROP CONSTRAINT fk_LocationID1645;
DROP TABLE LIB1645.VehicleAvailability1645; 

ALTER TABLE LIB1645.Reservation1645 DROP CONSTRAINT fk_CustomerID1645;
ALTER TABLE LIB1645.Reservation1645 DROP CONSTRAINT fk_VehicleID1645;
DROP TABLE LIB1645.Reservation1645;

ALTER TABLE LIB1645.Vehicle1645 DROP CONSTRAINT fk_LocationID1645;
DROP TABLE LIB1645.Vehicle1645;

DROP TABLE LIB1645.RentalLocation1645;
DROP TABLE LIB1645.Employee1645;
DROP TABLE LIB1645.Customer1645;
quit;

/* part a */

proc sql;
ALTER TABLE LIB1645.Employee1645 ADD DateofJoin1645 DATE;
/* part b */
proc sql;
ALTER TABLE LIB1645.Employee1645 DROP COLUMN DateofJoin1645;
/* part c */
proc sql;
ALTER TABLE LIB1645.RentalTransaction1645 MODIFY RentalDate DATE NOT NULL;

/* part d */
proc sql;
ALTER TABLE LIB1645.RentalTransaction1645 ADD CONSTRAINT CHK_RentalPrice_Positive CHECK (RentalPrice > 0);

DESCRIBE TABLE LIB1645.RentalTransaction1645;


/* Insertion of Customer1645 */
Proc SQl;
INSERT INTO LIB1645.CUSTOMER1645 
VALUES (1, 'John', 'Smith', '123 Main St Melbourne 3000', '123-456-7890', 'john@example.com')
VALUES (2, 'Emma', 'Brown', '456 High St Sydney CBD 2000', '987-654-3210', 'emma@example.com')
VALUES (3, 'Michael', 'Chen', '789 Queen St Brisbane CBD 4000', '456-789-0123', 'michael@example.com')
VALUES (4, 'Lisa', 'Johnson', '567 George St Perth CBD 6000', '234-567-8901', 'lisa@example.com')
VALUES (5, 'David', 'Taylor', '890 King St Adelaide CBD 5000', '345-678-9012', 'david@example.com')
VALUES (6, 'Sarah', 'White', '901 Collins St Canberra CBD 2600', '678-901-2345', 'sarah@example.com');
QUIT;


/* Insertion of Employee1645 */
PROC SQL;
INSERT INTO LIB1645.EMPLOYEE1645 
VALUES (701, 'David', 'Lee', '111 King St, Melbourne', '111-222-3333', 'david@gmail.com')
VALUES (702, 'Sarah', 'Wong', '222 Queen St, Sydney', '444-555-6666', 'sarah@hotmail.com')
VALUES (703, 'James', 'Smith', '333 George St, Brisbane', '777-888-9999', 'james@gmail.com')
VALUES (704, 'Emily', 'Chen', '444 Hay St, Perth', '999-000-1111', 'emily@yahoo.com')
VALUES (705, 'Daniel', 'Taylor', '555 Grenfell St, Adelaide', '222-333-4444', 'daniel@gmail.com')
VALUES (706, 'Jessica', 'White', '666 Northbourne Ave, Canberra', '555-666-7777', 'jessica@hotmail.com')
VALUES (707, 'Michael', 'Brown', '777 Collins St, Melbourne', '888-999-0000', 'michael@hotmail.com')
VALUES (708, 'Olivia', 'Johnson', '888 Pitt St, Sydney', '111-222-3333', 'olivia@hotmail.com')
VALUES (709, 'Ethan', 'Lee', '999 Adelaide St, Brisbane', '444-555-6666', 'ethan@yahoo.com');
QUIT;

/* Insertion of RentalLocation1645 */
PROC SQL;
INSERT INTO LIB1645.RENTALLOCATION1645 (LOCATIONID1645, NAME, STREET, SUBURB, POSTCODE, PHONENO, CONTACTINFO)
VALUES (301, 'Melbourne Airport',789, 'Collins St Melbourne CBD', '3000', '123-456-7890', 'manager@carehire.com')
VALUES (302, 'Sydney Airport', 456, 'George St Sydney CBD', '2000', '987-654-3210', 'manager_sydney@carehire.com')
VALUES (303, 'Brisbane Airport', 123, 'Queen St Brisbane CBD', '4000', '111-222-3333', 'manager_brisbane@carehire.com')
VALUES (304, 'Perth Airport', 567, 'Hay St Perth CBD', '6000', '444-555-6666', 'manager_perth@carehire.com')
VALUES (305, 'Adelaide Airport', 890 ,'Grenfell St Adelaide CBD', '5000', '777-888-9999', 'manager_adelaide@carehire.com') 
VALUES (306, 'Canberra Airport', 345, 'Northbourne Ave Canberra CBD', '2600', '222-333-4444', 'manager_canberra@carehire.com');
QUIT;

/* Insertion of Vehicle Availibility  */

PROC SQL;
INSERT INTO LIB1645.VEHICLEAVAILABILITY1645 (AVAILABILITYID1645, VEHICLEID1645, LOCATIONID1645, RENTALDATE, AVAILIBILITYSTATUS)
VALUES (401, 201, 301, '01May2024'd, 'Available')
VALUES (402, 202, 306, '03May2024'd, 'Available')
VALUES (403, 203, 301, '05May2024'd, 'Available')
VALUES (404, 204, 304, '07May2024'd, 'Unavailable')
VALUES (405, 205, 305, '09May2024'd, 'Available')
VALUES (406, 206, 306, '11May2024'd, 'Available');
QUIT;

/* Insertion into RentalTransaction1645 table */
PROC SQL;
INSERT INTO LIB1645.RentalTransaction1645 (TransactionID1645, VehicleID1645, LocationID1645, EmployeeID1645, CustomerID1645, RentalDate, ReturnDate, RentalPrice)
VALUES (501, 201, 301, 701, 1, '01May2024'd, '05May2024'd, 200)
VALUES (502, 202, 302, 702, 5, '03May2024'd, '07May2024'd, 240)
VALUES (503, 203, 303, 703, 3, '05May2024'd, '10May2024'd, 275)
VALUES (504, 204, 304, 704, 4, '07May2024'd, '12May2024'd, 225)
VALUES (505, 205, 305, 705, 2, '09May2024'd, '14May2024'd, 260)
VALUES (506, 206, 306, 706, 6, '11May2024'd, '16May2024'd, 280);
QUIT;

/* Insertion into Vehicle1645 Table */
PROC SQL;
INSERT INTO LIB1645.VEHICLE1645 (VEHICLEID1645,  MODEL, MAKE, YEAR, COLOR,RentalPricePerDay)
VALUES (201, 'Toyota', 'Camry', 2022, 'Silver', 200)
VALUES (202, 'Honda', 'Civic', 2023, 'Red', 240)
VALUES (203, 'Ford', 'Focus', 2021, 'Blue', 270)
VALUES (204, 'Nissan', 'Altima', 2020, 'Black', 225)
VALUES (205, 'Chevrolet', 'Malibu', 2019, 'White', 260)
VALUES (206, 'Hyundai', 'Elantra', 2024, 'Gray', 280)
VALUES (207, 'Toyota', 'Prado', 2019, 'Black', 200);
QUIT;
PROC SQL;
DESCIRBE TABLE LIB1645.reservation1645;
/* Insertion into Reservation1645 Table */
proc sql;    
INSERT INTO LIB1645.reservation1645 (ReservationID1645, CustomerID1645, VehicleID1645, PickupLocation, DropoffLocation, PickupDate, DropoffDate, ReservationDate )
VALUES(101, 1, 201, 'Melbourne Airport', 'Oak Park', '01MAR2024'd, '03MAR2024'd, '05MAR2024'd)
VALUES(201, 2, 202, 'Sydney Airport', 'Preston', '05MAR2024'd, '07MAR2024'd, '09MAR2024'd)
VALUES(102, 3, 203, 'Brisbane Airport', 'Adelaide Airport', '07MAR2024'd, '10MAR2024'd, '12MAR2024'd)
VALUES(103, 4, 204, 'Perth Airport', 'Canberra Airport', '12MAR2024'd, '12JUN2024'd, '01JAN2024'd)
VALUES(104, 5, 205, 'Adelaide Airport', 'Oak Park', '11MAR2024'd, '14JUL2024'd, '23DEC2023'd)
VALUES(105, 6, 206, 'Canberra Airport', 'Oak Park', '16MAR2024'd, '16MAR2024'd, '01MAR2024'd);
quit;


/* Part a */
Proc sql;
ALTER TABLE Lib1645.RentalTransaction1645 DROP CONSTRAINT fk_EmployeeID1645;
proc sql;
UPDATE Lib1645.Employee1645
SET EmployeeID1645 = 700
WHERE Address ='111 King St, Melbourne';
/* Part b */
proc sql;
UPDATE LIB1645.VehicleAvailability1645
SET AvailibilityStatus ='Unavailable'
WHERE AvailabilityID1645 =403 AND VehicleID1645 =203;

/* Part c */
proc sql;
UPDATE LIB1645.Customer1645
SET FLName = 'XYZ'
WHERE FName = 'John';
/* Part d */
proc sql;
UPDATE LIB1645.Reservation1645
SET DropoffDate =INTNX('WEEK', DropoffDate, 1)
WHERE ReservationID1645 = 103;
proc sql;
ALTER TABLE LIB1645.RentalTransaction1645 DROP CONSTRAINT fk_EmployeeID1645;
proc sql;
DELETE FROM LIB1645.Employee1645
WHERE EmployeeID1645 = 704;
quit;

