-- Building Development


-- INSERT INTO Building VALUES(
--     2,
--     2,
--     'StreetStraight',
--     4.5,
--     2.5,
--     90,
--     '15,2,1,3'
-- )

-- SELECT * FROM Building

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



-- OBTENEMOS LOS EDIFICIOS DE UN JUGADOR
-- CREATE PROCEDURE SPGetBuilding @inputPlayerID INT AS
-- SELECT * FROM Building
-- WHERE playerID = @inputPlayerID

-- EXECUTE SPGetBuilding 2


-- ACTUALIZA O AÑADE DATOS A LA TABLA DE EDIFICIOS, SI EL ELEMENTO YA EXISTE EN BASE A playerID y buildingGameID, ENTONCES ACTUALIZA, SI NO EXISTE, ENTONCES LO INSERTA
-- CREATE PROCEDURE SPUpdateBuilding @playerID INT, @buildingGameID INT, @buildingType VARCHAR(50), @posX FLOAT, @posZ FLOAT, @rotation FLOAT, @attributeBuildingData VARCHAR(100) AS
-- declare @temp_building TABLE(
--     playerID INT,
--     buildingGameID INT,
--     buildingType VARCHAR(50),
--     posX FLOAT,
--     posZ FLOAT,
--     rotation FLOAT,
--     attributeBuildingData VARCHAR(100)    
-- );

-- INSERT INTO @temp_building VALUES(
--     @playerID,
--     @buildingGameID,
--     @buildingType,
--     @posX,
--     @posZ,
--     @rotation,
--     @attributeBuildingData 
-- )

-- MERGE Building as Target
-- USING(SELECT playerID, buildingGameID, buildingType, posX, posZ, rotation, attributeBuildingData FROM @temp_building) AS Source
-- ON(Target.playerID = Source.playerID AND Target.buildingGameID = Source.buildingGameID)
-- WHEN MATCHED THEN
--     UPDATE SET 
--         Target.buildingType = Source.buildingType,
--         Target.posX = Source.posX,
--         Target.posZ = Source.posZ,
--         Target.rotation = Source.rotation,
--         Target.attributeBuildingData = Source.attributeBuildingData
-- WHEN NOT MATCHED BY TARGET THEN
--     INSERT(playerID, buildingGameID, buildingType, posX, posZ, rotation, attributeBuildingData)
--     VALUES(Source.playerID, Source.buildingGameID, Source.buildingType, Source.posX, Source.posZ, Source.rotation, Source.attributeBuildingData);

-- EXECUTE SPUpdateBuilding 2,3, 'Street', -1.5, -1.5, 90, ''



-- ELIMINA EDIFICIOS EN BASE A playerID y buildingGameID
-- CREATE PROCEDURE SPDeleteBuilding @playerID INT, @buildingGameID INT AS
-- DELETE FROM Building
-- WHERE playerID = @playerID AND buildingGameID = @buildingGameID

-- SELECT * FROM Building

DELETE FROM Building
WHERE playerID = 1


EXECUTE SPGetBuilding 1
-- EXECUTE SPUpdateBuilding 1,1, 'SalesGenerator', 2.5, 3.5, 90, '10,1'
-- EXECUTE SPDeleteBuilding 2,3

SELECT * FROM Statistic 
