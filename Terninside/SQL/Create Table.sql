-- CREATE TABLE Player(
--     playerID INT IDENTITY (1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     playerExperience INT,
--     playerName VARCHAR(100),
--     scoreMoney INT,
--     scoreIron FLOAT,
--     scoreUnpackageSteel FLOAT,
--     scoreSteel FLOAT,
--     difficulty INT
-- ) 

-- CREATE TABLE Setting(
--     playerID INT NOT NULL,
--     constraint PK_Setting primary key (playerID),
--     constraint FK_playerID foreign key (playerID) references Player(playerID),
--     volumeMusic FLOAT,
--     cameraSensibility FLOAT,
--     cameraSpeed FLOAT
-- )

-- CREATE TABLE Statistic(
--     playerID INT CONSTRAINT FK_Statistic_playerID FOREIGN KEY(playerID) references Player(playerID),
--     statisticID int identity (1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     timeDate DATETIME NOT NULL,
--     constructionNumber INT,
--     totalMoney FLOAT,
--     totalSteel FLOAT,
--     totalContract INT,
--     ironToSteelTransform FLOAT
-- )

-- CREATE TABLE Contract(
--     playerID INT constraint FK_Contract_playerID foreign key (playerID) references Player(playerID),
--     contractID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     contractGameID INT,
--     title VARCHAR(100),
--     description VARCHAR(500),
--     steelRequirement INT,
--     moneyReward INT,
--     timeRemaining FLOAT,
--     penalization FLOAT,
--     success INT,
--     isActive INT
-- )

-- CREATE TABLE Trade(
--     playerID INT constraint FK_Trade_PlayerID foreign key (playerID) references player(playerID),
--     tradeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     playerToTradeID INT,
--     steelAmount INT,
--     steelCost INT,
--     acceptTradeP1 INT,
--     acceptTradeP2 INT,
--     isComplete1 INT,
--     isComplete2 INT
-- )

-- CREATE TABLE Friend(
--     playerID INT constraint FK_Friend_PlayerID foreign key (playerID) references Player(playerID),
--     relationID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     friendID INT,
--     Status1 INT,
--     Status2 INT,
--     UpdateData INT
-- )

-- CREATE TABLE Building(
--     playerID INT constraint FK_Building_PlayerID foreign key (playerID) references Player(playerID),
--     buildingID INT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     buildingGameID INT,
--     buildingType Varchar(50),
--     posX FLOAT,
--     posZ FLOAT,
--     rotation FLOAT,
--     attributeBuildingData VARCHAR(100)
-- ) 

SELECT GETDATE();

SELECT * FROM Statistic