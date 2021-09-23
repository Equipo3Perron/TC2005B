-- CREATE PROCEDURE SPInsertSetting @playerID INT, @volumeMusic FLOAT, @cameraSensibility FLOAT, @cameraSpeed FLOAT AS
-- INSERT INTO Setting VALUES(
--     @playerID,
--     @volumeMusic,
--     @cameraSensibility,
--     @cameraSpeed
-- )


-- CREATE PROCEDURE SPUpdateSetting @playerID INT, @volumeMusic FLOAT, @cameraSensibility FLOAT, @cameraSpeed FLOAT AS
-- UPDATE Setting
-- SET volumeMusic = @volumeMusic,
--     cameraSensibility = @cameraSensibility,
--     cameraSpeed = @cameraSpeed
-- WHERE playerID = @playerID


-- CREATE PROCEDURE SPGetSetting @playerID INT AS
-- SELECT * FROM Setting
-- WHERE playerID = @playerID

SELECT * FROM Setting
EXECUTE SPInsertSetting 1,0,0,0
-- EXECUTE SPUpdateSetting 1,0,0,0
-- EXECUTE SPGetSetting 1

