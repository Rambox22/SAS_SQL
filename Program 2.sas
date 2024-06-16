/* Q#1 */
PROC SQL;
CREATE TABLE LIB1645.CLIENT1645 LIKE LIB1645.CUSTOMER1645;
QUIT;

/* Q#2 */
PROC SQL;
CREATE TABLE LIB1645.HIRETRANSACTION1645 AS
SELECT * FROM LIB1645.RENTALTRANSACTION1645;
QUIT;

/* Q#3 */
PROC SQL;
SELECT * FROM LIB1645.HIRETRANSACTION1645;
QUIT;

/* Q#4 */
PROC SQL;
SELECT RESERVATIONID1645, VEHICLEID1645, DropOffLocation
FROM LIB1645.RESERVATION1645
WHERE PICKUPDATE > '07Mar2024'd
ORDER BY PICKUPDATE ASC;
QUIT;
/* Q#5 */
PROC SQL;
  SELECT CATX(' ', UPCASE(FLNAME), FNAME) AS Name,
         Address,
         PHONE,
         EMAILADDRESS
  FROM LIB1645.CUSTOMER1645;
QUIT;

/* Q#6 */
PROC SQL;
  SELECT *
  FROM LIB1645.VEHICLEAVAILABILITY1645
  ORDER BY RENTALDATE;
QUIT;

/* Q#7 */
PROC SQL;
  SELECT *
  FROM LIB1645.VEHICLE1645
  WHERE Model = 'Honda' OR Model = 'Ford';
QUIT;

/* Q#8 */
PROC SQL OUTOBS=1;
    SELECT *
    FROM LIB1645.RENTALLOCATION1645
    ORDER BY NAME DESC;
QUIT;

/* Q#9 */
PROC SQL;
    SELECT *
    FROM LIB1645.VEHICLE1645
    WHERE MODEL = "Toyota";
QUIT;

/* Q#10 */

PROC SQL;
    SELECT *
    FROM LIB1645.EMPLOYEE1645
    WHERE Address LIKE "%Melbourne" AND EMPLOYEEID1645 = 707;
QUIT;

/*----------------PART-B----------------------- */

/* Q#1 */
PROC SQL;
    SELECT Model, COUNT(*) AS VehicleCount
    FROM LIB1645.VEHICLE1645
    GROUP BY Model
    HAVING COUNT(*) > 1;
QUIT;

/* Q#2 */

PROC SQL;
    SELECT CATX(', ', UPCASE(LNAME), FNAME) AS Name
    FROM LIB1645.EMPLOYEE1645
    WHERE SUBSTR(FNAME, 2, 1) = 'a';
QUIT;

/* Q#3 */

PROC SQL;
    SELECT TRANSACTIONID1645, 
           ROUND(RentalPrice, -2) AS RoundedPrice
    FROM LIB1645.RENTALTRANSACTION1645;
    LABEL RoundedPrice = 'Price to nearest hundred';
QUIT;


/* Q#4 */
PROC SQL;
    SELECT V.VEHICLEID1645, V.Make, V.Model
    FROM LIB1645.VEHICLE1645 AS V 
    INNER JOIN LIB1645.RENTALTRANSACTION1645 AS T
    ON V.VEHICLEID1645 = T.VEHICLEID1645
    
    WHERE (T.RENTALPRICE / (T.ReturnDate - T.RentalDate)) BETWEEN 46 AND 64;
QUIT;


/* Q#5 */

PROC SQL;
    SELECT MAKE,
           AVG(RENTALPRICEPERDAY) AS AVGRENTALPRICE
    FROM LIB1645.Vehicle1645
    GROUP BY MAKE
    ORDER BY AVGRENTALPRICE DESC;
QUIT;

/*---------------Part C------------- */

/* Q#1 */
PROC SQL;
    SELECT V.VEHICLEID1645, V.MAKE, V.MODEL, S.AVAILIBILITYSTATUS
    FROM LIB1645.VEHICLE1645 AS V
    INNER JOIN LIB1645.VEHICLEAVAILABILITY1645 AS S
    ON V.VEHICLEID1645 = S.VEHICLEID1645
    WHERE S.AvailibilityStatus = 'Unavailable';
QUIT;

/* Q#2 */

PROC SQL;
    SELECT T.TRANSACTIONID1645, T.VEHICLEID1645, T.RETURNDATE, T.RENTALPRICE, V.AvailibilityStatus
    FROM LIB1645.RENTALTRANSACTION1645 AS T
    INNER JOIN LIB1645.VEHICLEAVAILABILITY1645 AS V
    ON T.VEHICLEID1645 = V.VEHICLEID1645
    WHERE T.TRANSACTIONID1645 = 503;
QUIT;

/* Q#3 */

PROC SQL;
    SELECT V.VEHICLEID1645, V.MAKE, V.MODEL, T.TRANSACTIONID1645, T.RENTALPRICE
    FROM LIB1645.VEHICLE1645 AS V
    INNER JOIN LIB1645.RENTALTRANSACTION1645 AS T
    ON V.VEHICLEID1645 = T.VEHICLEID1645
    WHERE T.RENTALPRICE = 275;
QUIT;

/* Q#4 */

PROC SQL;
    SELECT R.RESERVATIONID1645, R.CUSTOMERID1645, C.FNAME, C.FLNAME, R.PICKUPDATE, R.PICKUPLOCATION
    FROM LIB1645.RESERVATION1645 AS R
    INNER JOIN LIB1645.CUSTOMER1645 AS C
    ON R.CUSTOMERID1645 = C.CUSTOMERID1645
    WHERE R.PICKUPLOCATION LIKE '%Melbourne%';
QUIT;

/* Q#5 */

PROC SQL;
SELECT VEHICLEID1645
FROM LIB1645.Vehicle1645
WHERE RentalPricePerDay = (
    SELECT MAX(RentalPricePerDay)
    FROM LIB1645.Vehicle1645
    WHERE RentalPricePerDay NOT IN (
        SELECT MAX(RentalPricePerDay)
        FROM LIB1645.Vehicle1645
    )
);
QUIT;

PROC SQL OUTOBS=2;
    SELECT VEHICLEID1645, RENTALPRICEPERDAY 
    FROM LIB1645.VEHICLE1645
    ORDER BY RENTALPRICEPERDAY DESC;
QUIT;

/* Q#6 */

PROC SQL;
    SELECT *
    FROM LIB1645.VEHICLEAVAILABILITY1645
    WHERE AVAILABILITYID1645 = 402
      AND VEHICLEID1645 IN (
          SELECT VEHICLEID1645
          FROM LIB1645.VEHICLE1645
          WHERE AVAILABILITYID1645 = 402
      );
QUIT;





