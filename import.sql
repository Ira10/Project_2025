-- COPY transactions
-- FROM '/Users/indrani.sarkar/Downloads/Assignment_data(Transactional).csv' 
-- DELIMITER ',' CSV HEADER;

-- DROP TABLE transactions_staging;


-- CREATE TABLE transactions (
--     userid BIGINT,
--     roundid INT,
--     contestid BIGINT,
--     transactiontype VARCHAR(50),
--     amount FLOAT,
--     creationdate TIMESTAMP,  -- Stores the datetime
--     transactionid VARCHAR(100),
--     lastaccount FLOAT,
--     currency VARCHAR(10),
--     tourid INT
-- );



-- SELECT COUNT(userid) AS users,
--        COUNT(transactiontype) AS transactions,
--        COUNT(amount) AS amounts,
--        COUNT(tourid) AS CREATIONS



-- FROM transactions;



SELECT userid,
        -- TIMESTAMP '1899-12-30' + INTERVAL '1 day' *  creationdate::FLOAT8 AS time,
    --     CASE 
    --        -- If it's an Excel serial number, convert it
    --        WHEN creationdate ~ '^[0-9]+(\.[0-9]+)?$' THEN 
    --            (TIMESTAMP '1899-12-30' + INTERVAL '1 day' * ROUND(creationdate::NUMERIC, 10))
    --        -- If it's already in text date format, parse it
    --        ELSE 
    --            TO_TIMESTAMP(creationdate, 'DD/MM/YY HH24:MI')
    --    END AS fixed_creationdate,
        creationdate,
        roundid,
        contestid,
        transactiontype,
        amount,
        lastaccount

FROM transactions

WHERE userid = 219247354 

ORDER BY creationdate ASC;




-----------   1  -------------
-- CREATE TABLE transactions_staging (
--     userid BIGINT,
--     roundid INT,
--     contestid BIGINT,
--     transactiontype VARCHAR(50),
--     amount FLOAT,
--     creationdate TEXT,  -- Store as text first
--     transactionid VARCHAR(100),
--     lastaccount FLOAT,
--     currency VARCHAR(10),
--     tourid INT
-- );


--------------  2  ---------------
-- COPY transactions_staging 
-- FROM '/Users/indrani.sarkar/Downloads/Assignment_data(Transactional).csv' 
-- DELIMITER ',' 
-- CSV HEADER;


-------------  3  --------------
-- CREATE TABLE transactions (
--     userid BIGINT,
--     roundid INT,
--     contestid BIGINT,
--     transactiontype VARCHAR(50),
--     amount FLOAT,
--     creationdate TIMESTAMP,  -- Store datetime properly
--     transactionid VARCHAR(100),
--     lastaccount FLOAT,
--     currency VARCHAR(10),
--     tourid INT
-- );


----------------  4  ---------------
-- INSERT INTO transactions (
--     userid, roundid, contestid, transactiontype, amount, creationdate, transactionid, lastaccount, currency, tourid
-- )
-- SELECT 
--     userid, roundid, contestid, transactiontype, amount, 
--     TO_TIMESTAMP(creationdate, 'DD/MM/YY HH24:MI'),  -- Convert here
--     transactionid, lastaccount, currency, tourid
-- FROM transactions_staging;



----- demographic ---
-----------   1  -------------

-- CREATE TABLE registration_demographic_staging (
--     UserID BIGINT PRIMARY KEY,
--     stateid VARCHAR(50),
--     teamname VARCHAR(50),
--     familyid BIGINT,
--     Registration_date TEXT,  -- Store as text first,
--     dateofbirth TEXT,  -- Store as text first,
--     emailid VARCHAR(100),
--     gender VARCHAR(10),
--     mobilenum BIGINT
-- );


--------------  2  ---------------
-- COPY registration_demographic_staging 
-- FROM '/Users/indrani.sarkar/Downloads/registration_demographic.csv' 
-- DELIMITER ',' 
-- CSV HEADER;


-----------   3  -------------

-- CREATE TABLE registration_demographic (
--     UserID BIGINT PRIMARY KEY,
--     stateid VARCHAR(50),
--     teamname VARCHAR(50),
--     familyid BIGINT,
--     Registration_date TIMESTAMP,  -- Store datetime properly, 
--     dateofbirth TIMESTAMP,  -- Store datetime properly
--     emailid VARCHAR(100),
--     gender VARCHAR(10),
--     mobilenum BIGINT
-- );


----------------  4  ---------------
-- INSERT INTO registration_demographic (
--     UserID, stateid, teamname, familyid, Registration_date, dateofbirth, emailid, gender, mobilenum
-- )
-- SELECT 
--     UserID, stateid, teamname, familyid,   
--     TO_TIMESTAMP(Registration_date, 'DD/MM/YY HH24:MI'),  -- Convert here
--     TO_TIMESTAMP(dateofbirth, 'DD/MM/YY HH24:MI'),  -- Convert here
--     emailid, gender, mobilenum
-- FROM registration_demographic_staging;



-----------   1  -------------

-- CREATE TABLE current_status (
--     UserID BIGINT PRIMARY KEY,
--     current_status VARCHAR(50)
-- );


--------------  2  ---------------
-- COPY current_status 
-- FROM '/Users/indrani.sarkar/Downloads/Assignment_data(current_status).csv' 
-- DELIMITER ',' 
-- CSV HEADER;