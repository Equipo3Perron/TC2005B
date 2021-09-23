-- CREA PROCEDIMIENTO PARA OBTENER EL contractGameID MAS GRANDE DE UNA playerID ESPECIFICA DE JUGADOR Y REGRESA EL CONTRATO MAS RECIENTE DE DICHO playerID

-- declare @temp_contract TABLE (
--     playerID int,
--     contractID int,
--     title varchar(100),
--     description varchar(500),
--     steelRequirement int,
--     moneyReward int, 
--     timeRemaining float,
--     penalization float,
--     success int, 
--     isActive int
-- );
-- INSERT INTO @temp_contract
-- SELECT a.playerID, a.contractGameID, a.title, a.description, a.steelRequirement, a.moneyReward, a.timeRemaining, a.penalization, a.success, a.isActive
-- FROM Contract a
-- LEFT OUTER JOIN Contract b
--     ON a.playerID = b.playerID AND a.contractGameID < b.contractGameID
-- WHERE b.playerID IS NULL;
-- SELECT * FROM @temp_contract
-- WHERE playerID = @inputPlayerID


-- EXECUTE SPGetLastContract 2

-- SELECT * FROM Contract


-- ACTUALIZA UN CONTRATO CON UN contractGameID y un playerID, actualiza las columnas isActive y success
-- CREATE PROCEDURE SPUpdateContract @playerID INT, @contractGameID INT, @title VARCHAR(100), @description VARCHAR(500), @steelRequirement INT, @moneyReward INT, @timeRemaining FLOAT, @penalization FLOAT, @success INT, @isActive INT AS
-- declare @temp_contract TABLE(
--     playerID INT,
--     contractGameID INT,
--     title VARCHAR(100),
--     description VARCHAR(500),
--     steelRequirement INT,
--     moneyReward INT,
--     timeRemaining FLOAT,
--     penalization FLOAT,
--     success INT, 
--     isActive INT
-- );

-- INSERT INTO @temp_contract VALUES(
--     @playerID,
--     @contractGameID,
--     @title,
--     @description,
--     @steelRequirement,
--     @moneyReward,
--     @timeRemaining,
--     @penalization,
--     @success,
--     @isActive
-- )

-- MERGE Contract AS TARGET
-- USING (SELECT playerID, contractGameID, title, description, steelRequirement, moneyReward, timeRemaining, penalization, success, isActive FROM @temp_contract) AS Source
-- ON(Target.playerID = Source.playerID AND Target.contractGameID = Source.contractGameID)
-- WHEN MATCHED THEN
--     UPDATE SET
--         Target.timeRemaining = Source.timeRemaining,
--         Target.success = Source.success,
--         TARGET.isActive = Source.isActive
-- WHEN NOT MATCHED BY TARGET THEN
--     INSERT(playerID, contractGameID, title, description, steelRequirement, moneyReward, timeRemaining, penalization, success, isActive)
--     VALUES(Source.playerID, Source.contractGameID, Source.title, Source.description, Source.steelRequirement, Source.moneyReward, Source.timeRemaining, Source.penalization, Source.success, Source.isActive); 



-- AÑADE UN CONTRATO NUEVO
-- CREATE PROCEDURE SPAddContract @playerID INT, @contractGameID INT, @title VARCHAR(100), @descripcion VARCHAR(500), @steelRequirement INT, @moneyReward INT, @timeRemaining FLOAT, @penalization FLOAT, @success INT, @isActive INT AS
-- INSERT INTO Contract VALUES(
--     @playerID,
--     @contractGameID,
--     @title,
--     @descripcion,
--     @steelRequirement,
--     @moneyReward,
--     @timeRemaining,
--     @penalization,
--     @success,
--     @isActive
-- )


-- CREATE PROCEDURE SPGetLastContract @playerID INT AS
-- SELECT *
-- FROM Contract
-- WHERE playerID = @playerID  AND contractID = (SELECT MAX(contractGameID) FROM Contract)

-- SELECT * FROM Contract

EXECUTE SPGetLastContract 2
DELETE Building WHERE playerID = 1
-- EXECUTE SPUpdateContract 1, 11, aterron2, Seguridad, 100, 2783, 500, 0.5, 1,1

-- EXECUTE SPUpdateContract 1,4,0,0
-- EXECUTE SPGetLastContract 1
-- EXECUTE SPAddContract 1, 5, 'Tengo un nuevo contrato', 'Descripcion nueva', 100, 5000, 40.5, 0.4, 0, 1
