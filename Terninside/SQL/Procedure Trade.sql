
-- OBTIENE LOS TRADES DE UN JUGADOR ACTIVOS

-- CREATE PROCEDURE SPGetTrade @playerID INT AS
-- SELECT * FROM Trade
-- WHERE (playerID = @playerID OR playerToTradeID = @playerID) AND (isComplete2 = 0 OR isComplete1 = 0)


-- AÑADE UN NUEVO TRADE SI NO EXISTE 
-- CREATE PROCEDURE SPCreateTrade @playerID INT, @playerToTradeID INT, @steelAmount INT, @steelCost INT AS
-- DECLARE @temp_trade TABLE(
--     playerID INT,
--     playerToTradeID INT,
--     steelAmount INT,
--     steelCost INT
-- )

-- INSERT INTO @temp_trade VALUES(
--     @playerID,
--     @playerToTradeID,
--     @steelAmount,
--     @steelCost
-- )
-- MERGE Trade AS Target
-- USING(SELECT * FROM @temp_trade) AS Source
-- ON((Target.playerID = Source.playerID AND Target.playerToTradeID = Source.playerToTradeID AND isComplete1 = 0) OR (Target.playerID = Source.playerToTradeID AND Target.playerToTradeID = Source.playerID AND isComplete1 = 0))
-- WHEN NOT MATCHED BY TARGET THEN
--     INSERT(playerID, playerToTradeID, steelAmount, steelCost, acceptTradeP1, acceptTradeP2, isComplete1, isComplete2)
--     VALUES(Source.playerID, Source.playerToTradeID, Source.steelAmount, Source.steelCost, 1, 0, 0, 0);


-- ACTUALIZA UN TRADE
-- CREATE PROCEDURE SPModifyTrade @playerID INT, @playerToTradeID INT, @newSteelAmount INT, @newSteelCost INT, @acceptTradeP1 INT, @acceptTradeP2 INT AS
-- UPDATE Trade
-- SET steelAmount = @newSteelAmount, steelCost = @newSteelCost, acceptTradeP1 = @acceptTradeP1, acceptTradeP2 = @acceptTradeP2
-- WHERE (playerID = @playerID AND playerToTradeID = @playerToTradeID AND isComplete1 = 0) OR (playerID = @playerToTradeID AND playerToTradeID = @playerID AND isComplete2 = 0)



-- CREATE PROCEDURE SPAcceptTrade @playerID INT, @playerToTradeID INT AS
-- UPDATE Trade
--     SET acceptTradeP1 = (CASE WHEN playerID = @playerID THEN '1' ELSE acceptTradeP1 END),
--         acceptTradeP2 = (CASE WHEN playerToTradeID = @playerID THEN '1' ELSE acceptTradeP2 END),
--         isComplete1 = (CASE WHEN playerID = @playerID THEN '1' ELSE isComplete1 END),
--         isComplete2  = (CASE WHEN playerToTradeID = @playerID THEN '1' ELSE isComplete2 END)
-- WHERE (playerID = @playerID AND playerToTradeID = @playerToTradeID) OR (playerID = @playerToTradeID AND playerToTradeID = @playerID)



-- CREATE PROCEDURE SPDeleteTrade @playerID INT, @playerToTradeID INT AS
-- DELETE Trade
-- WHERE ((playerID = @playerID AND playerToTradeID = @playerToTradeID) OR (playerID = @playerToTradeID AND playerToTradeID = @playerID)) AND (isComplete1 = 0 AND isComplete2 = 0);


-- UPDATE Trade
--     SET acceptTradeP1 = 1, acceptTradeP2 = 0, isComplete1 = 0, isComplete2 = 0
--     WHERE playerID = 8 AND playerToTradeID = 1


EXECUTE SPGetTrade 3

EXECUTE SPCreateTrade 1, 8, 300, 100

EXECUTE SPModifyTrade 8, 1, 300, 150, 0, 1

EXECUTE SPAcceptTrade 8, 1

EXECUTE SPDeleteTrade 1, 2


SELECT * FROM Trade