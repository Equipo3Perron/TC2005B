-- CREATE PROCEDURE SPCheckFriendUpdate @playerID INT AS 
-- SELECT UpdateData, friendID
-- FROM Friend
-- WHERE playerID = @playerID
-- UPDATE Friend
-- SET UpdateData = 0
-- WHERE playerID = 1

-- CREATE PROCEDURE SPGetFriendData @playerID INT AS
-- SELECT Friend.playerID, Player.playerName 
-- FROM Friend
-- INNER JOIN Player ON Player.playerID = Friend.playerID
-- WHERE friendID = @playerID AND Status1 = 1 AND Status2 = 1

-- SELECT Friend.playerID, Player.playerName 
-- FROM Friend
-- INNER JOIN Player ON Player.playerID = Friend.playerID
-- WHERE friendID = 8 AND Status1 = 1 AND Status2 = 1

-- CREATE PROCEDURE SPCheckFriendRequest @playerID INT AS
-- SELECT Friend.playerID, Player.playerName
-- FROM Friend
-- INNER JOIN Player ON Player.playerID = Friend.playerID
-- WHERE friendID = @playerID AND Status2 = 0

-- CREATE PROCEDURE SPFindStatistic @playerID INT AS 
-- SELECT Statistic.*, Player.playerName
-- FROM Statistic
-- INNER JOIN Player ON Player.playerID = Statistic.playerID 
-- WHERE Statistic.playerID = @playerID

-- CREATE PROCEDURE SPAcceptFriendRequest @playerID INT, @friendID INT AS
-- UPDATE Friend
-- SET Status2 = 1,
--     UpdateData = 1
-- WHERE playerID = @friendID AND friendID = @playerID
-- INSERT INTO Friend VALUES(
--     @playerID,
--     @friendID,
--     1,
--     1,
--     1
-- )

-- CREATE PROCEDURE SPFinishRelationship @playerID INT, @friendID INT AS
-- DELETE Friend
-- WHERE playerID = @playerID AND friendID = @friendID
-- DELETE Friend
-- WHERE playerID = @friendID AND friendID = @playerID


-- CREATE PROCEDURE SPFindFriendName @playerID INT AS
-- SELECT playerName, playerID
-- FROM player
-- WHERE playerID = @playerID



-- Crea un procedimiento para enviar solicitud de amistad
-- CREATE PROCEDURE SPSendFriendRequest @playerID INT, @friendID INT AS
-- DECLARE @temp_friend TABLE(
--     playerID INT,
--     friendID INT
-- );

-- INSERT INTO @temp_friend VALUES(
--     @playerID,
--     @friendID
-- )



-- MERGE Friend as Target
-- USING(SELECT playerID, friendID FROM @temp_friend) AS Source
-- ON(Target.playerID = Source.playerID AND Target.friendID = Source.friendID)
-- WHEN NOT MATCHED BY TARGET THEN
--     INSERT(playerID, friendID, Status1, Status2, UpdateData)
--     VALUES(Source.playerID, Source.friendID, 1, 0, 1);

--Obtiene actualizaciones
EXECUTE SPCheckFriendUpdate 8

--Obtiene toda la informacion
EXECUTE SPGetFriendData 8

--Obtiene las solicitudes de amistad
EXECUTE SPCheckFriendRequest 8

--Acepta solicitudes de amistad
EXECUTE SPAcceptFriendRequest 8, 1

--Termina una relacion
EXECUTE SPFinishRelationship 1, 3

--Busca una amistad
EXECUTE SPFindFriendName 8

--Envia solicitud de amistad
EXECUTE SPSendFriendRequest 1,8

SELECT * FROM Statistic 

SELECT * FROM Usuario

SELECT Statistic.*, Usuario.Nombre 
FROM Statistic INNER JOIN Usuario ON Usuario.idUsuario = Statistic.playerID

SELECT * FROM Usuario

SELECT * FROM player