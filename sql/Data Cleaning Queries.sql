USE data_cleaning;

SHOW TABLES;
DESC hr_data;
SET SQL_SAFE_UPDATES = 0;

-- Count Cols
SELECT COUNT(*) AS col_cnt 
FROM information_schema.columns
WHERE table_name = 'hr_data';

-- Standardize names  
UPDATE hr_data  
SET Name = CONCAT(
			UPPER(LEFT(TRIM(NAME), 1)),
			LOWER(MID(TRIM(NAME), 2, LENGTH(TRIM(NAME))))
            );
            
-- Check non-numeric values
SELECT 
	Age,
    Salary
FROM hr_data
WHERE (NOT Age REGEXP '^[0-9]+$') OR (NOT Salary REGEXP '^[0-9]+$');

-- standardize Joining Date Col
SELECT 
	`Joining Date`
FROM hr_data
GROUP BY `Joining Date`;

UPDATE hr_data
SET `Joining Date` =
	CASE 
		WHEN `Joining Date` REGEXP "^[A-Za-z]+ [0-9]+, [0-9]{4}$" THEN STR_TO_DATE(`Joining Date`, "%M %d, %Y")
        WHEN `Joining Date` REGEXP "^[0-9]{4}/[0-9]{2}/[0-9]{2}$" THEN STR_TO_DATE(`Joining Date`, "%Y/%m/%d")
        WHEN `Joining Date` REGEXP "^[0-9]{2}/[0-9]{2}/[0-9]{4}$" THEN STR_TO_DATE(`Joining Date`, "%m/%d/%Y")
        WHEN `Joining Date` REGEXP "^[0-9]{2}-[0-9]{2}-[0-9]{4}$" THEN STR_TO_DATE(`Joining Date`, "%m-%d-%Y")
        WHEN `Joining Date` REGEXP "^[0-9]{4}.[0-9]{2}.[0-9]{2}$" THEN STR_TO_DATE(`Joining Date`, "%Y.%d.%m")
	END;

-- update non-numeric values
UPDATE hr_data
SET 
	Age = 30,
	Salary =  60000
WHERE 
	(Salary = 'SIXTY THOUSAND')
	OR (Age = 'thirty');
    
-- Update NaN and empty values
UPDATE hr_data
SET Age = NULL
WHERE TRIM(Age) = "nan";

UPDATE hr_data
SET Salary = NULL
WHERE TRIM(Salary) = "NAN";
    
UPDATE hr_data
SET Email = NULL	
WHERE TRIM(Email)= "nan" OR TRIM(Email) = "";

UPDATE hr_data
SET `Phone Number` = NULL	
WHERE TRIM(`Phone Number`)= "nan" OR TRIM(`Phone Number`) = "";
SELECT * FROM hr_data;

ALTER TABLE hr_data
MODIFY COLUMN `Joining Date` Date,
MODIFY COLUMN Age INT(3),
MODIFY COLUMN Salary DECIMAL(10);
