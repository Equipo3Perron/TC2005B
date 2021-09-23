--INSERTA UNA NUEVA ESTADISTICA
-- CREATE PROCEDURE SPInsertStatistic @playerID INT, @ironToSteelTransform INT AS 
-- DECLARE @NewDate AS DATETIME = GETDATE()

-- DECLARE @totalContract AS INT
-- SET @totalContract = (SELECT COUNT(success) FROM Contract WHERE playerID = @playerID AND success = 1)

-- DECLARE @contructionNumber AS INT
-- SET @contructionNumber  = (SELECT COUNT(success) FROM Contract WHERE playerID = @playerID AND success = 1)

-- DECLARE @totalMoney AS INT 
-- SET @totalMoney =  (SELECT scoreMoney FROM Player WHERE playerID = @playerID)

-- DECLARE @totalSteel AS INT 
-- SET @totalSteel = (SELECT scoreSteel FROM Player WHERE playerID = @playerID)

-- DECLARE @playerExperience AS INT 
-- SET @playerExperience = (SELECT playerExperience FROM Player WHERE playerID = @playerID)

-- DECLARE @totalIron AS INT  
-- SET @totalIron = (SELECT scoreIron FROM Player WHERE playerID = @playerID)

-- DECLARE @totalUnpackageSteel AS INT
-- SET @totalUnpackageSteel = (SELECT scoreUnpackageSteel FROM Player WHERE playerID = @playerID)

-- INSERT INTO Statistic VALUES(
--     @playerID,
--     @NewDate,
--     @contructionNumber,
--     @totalMoney,
--     @totalSteel,
--     @totalContract,
--     @playerExperience,
--     @totalIron,
--     @totalUnpackageSteel,
--     @ironToSteelTransform
-- )


SELECT * FROM Statistic
SELECT * FROM Contract

EXECUTE SPGetLastContract 1

-- SELECT scoreUnpackageSteel
-- FROM Player
-- WHERE playerID = 1


-- SELECT * FROM Player
-- SELECT * FROM Statistic

-- EXECUTE SPInsertStatistic 1, 12
