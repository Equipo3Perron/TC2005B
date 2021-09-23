
-- CREATE PROCEDURE SPUpdatePlayer @playerID INT, @playerExperience INT, @playerName VARCHAR(100), @scoreMoney INT, @scoreIron FLOAT, @scoreUnpackageSteel FLOAT, @scoreSteel FLOAT, @difficulty INT AS
-- declare @temp_player TABLE(
--     playerID INT,
--     playerExperience INT,
--     playerName VARCHAR(100),
--     scoreMoney INT,
--     scoreIron FLOAT,
--     scoreUnpackageSteel FLOAT,
--     scoreSteel FLOAT,
--     difficulty INT   
-- );

-- INSERT INTO @temp_player VALUES(
--     @playerID,
--     @playerExperience,
--     @playerName,
--     @scoreMoney,
--     @scoreIron,
--     @scoreUnpackageSteel,
--     @scoreSteel,
--     @difficulty
-- )

-- MERGE Player as Target
-- USING(SELECT playerID, playerExperience, playerName, scoreMoney, scoreIron, scoreUnpackageSteel, scoreSteel, difficulty FROM @temp_player) AS Source
-- ON(Target.playerID = Source.playerID)
-- WHEN MATCHED THEN
--     UPDATE SET 
--         Target.playerExperience = Source.playerExperience,
--         Target.playerName = Source.playerName,
--         Target.scoreMoney = Source.scoreMoney,
--         Target.scoreIron = Source.scoreIron,
--         Target.scoreUnpackageSteel = Source.scoreUnpackageSteel,
--         Target.scoreSteel = Source.scoreSteel,
--         Target.difficulty = Source.difficulty
-- WHEN NOT MATCHED BY TARGET THEN
--     INSERT(playerExperience, playerName, scoreMoney, scoreIron, scoreUnpackageSteel, scoreSteel, difficulty)
--     VALUES(Source.playerExperience, Source.playerName, Source.scoreMoney, Source.scoreIron, Source.scoreUnpackageSteel, Source.scoreSteel, Source.difficulty);
--     SELECT SCOPE_IDENTITY()



-- CREATE PROCEDURE SPGetPlayer @playerID INT AS
-- SELECT * FROM Player
-- WHERE playerID = @playerID

-- EXECUTE SPUpdatePlayer 0,20,'aterron2000', 2000, 20, 10, 20,2
-- EXECUTE SPGetPlayer 2

-- DELETE FROM Player WHERE playerID = 4
-- SELECT * FROM Player


EXECUTE SPUpdatePlayer 2, 100, 'Heuhue', 0, 100, 100, 100 , 1

insert into [dbo].[Usuario] values('UsuarioNuevo', 'Terron', 'TerniumUser@ternium.com', '1234', '0') EXECUTE SPUpdatePlayer 0, 0, 'UsuarioNuevo', 3000, 0, 0, 0 , 1

SELECT Statistic.*, Usuario.Nombre, Usuario.Apellido FROM Statistic INNER JOIN Usuario ON Usuario.IDUsuario = Statistic.playerID
