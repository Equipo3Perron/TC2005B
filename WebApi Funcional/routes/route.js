//Definicion poolPromise (Agregado ayuda de Martin Palomares)
const { sql, poolPromise } = require('../database/db');


const express = require('express');
//web
const webcontroller = require('../controllers/webController');
//game
const contractController = require('../controllers/contractController');
const buildingController = require('../controllers/buildingController');
const settingController = require('../controllers/settingController');
const playerController = require('../controllers/playerController');
const tradeController = require('../controllers/tradeController');
const friendController = require('../controllers/friendController');
const controller = require('../controllers/playerController');
const statisticController = require('../controllers/statisticController');
const feedbackController = require('../controllers/feedbackController');


const router = express.Router();
//web
router.get('/api/getPlayers', webcontroller.getPlayers);
router.get('/api/getPlayer/:id', webcontroller.getPlayer);
router.post('/api/addPlayer', webcontroller.addPlayer);
router.put('/api/updatePlayer/:id', webcontroller.updatePlayer);
router.delete('/api/deletePlayer/:id', webcontroller.deletePlayer);
router.get('/api/json/Terniumeq2.json', webcontroller.getWord);
router.get('/api/json/loginPlayer/:email', webcontroller.login);
router.get('/api/json/getStatistics', webcontroller.getStatistics);
router.get('/api/json/statistics/:name', webcontroller.getStatisticsName);
router.get('/api/json/getStatisticsID/:id', webcontroller.getStatisticsID);
router.post('/api/addImg', webcontroller.addImg);
router.delete('/api/deleteImg/:questionImage', webcontroller.deleteImg);
//game
//player
router.get('/api/getPlayerGame/:id', controller.getPlayer);
router.put('/api/updatePlayerGame/:id', controller.updatePlayer);
//Contract
router.get('/api/getContract/:id', contractController.getContract);
router.put('/api/updateContract/:id/:contractID', contractController.updateContract);
//building
router.get('/api/getBuilding/:id', buildingController.getBuilding);
router.put('/api/updateBuilding', buildingController.updateBuilding);
router.delete('/api/deleteBuilding/:playerID/:buildingGameID', buildingController.deleteBuilding);
//setting
router.get('/api/getSetting/:id', settingController.getSetting);
router.put('/api/updateSetting/:id', settingController.updateSetting);
//Cambie de post a put
router.put('/api/addSetting', settingController.addSetting);
//friends
router.get('/api/checkFriendUpdate/:id', friendController.checkUpdateFriend);
router.get('/api/getFriend/:id', friendController.getFriend);
router.get('/api/getRequest/:id', friendController.getRequest);
//Feedback
router.get('/api/getFeedback/:id',feedbackController.getFeedback);
router.put('/api/updateFeedback/:id',feedbackController.updateFeedback);
router.post('/api/addFirstFeedback/:id',feedbackController.addFirstFeedback);
//NOT IN SWAGGER
//FriendRequest
router.get('/api/acceptFriendRequest/:id/:friendID', friendController.acceptFriendRequest);
router.get('/api/finishFriendRelation/:id/:friendID', friendController.finishFriendRelation);
router.get('/api/getPlayername/:id', friendController.getPlayername);
router.get('/api/sendFriendRequest/:id/:friendID', friendController.sendFriendRequest);
//Trade
router.get('/api/getTrade/:id', tradeController.getTrade);
router.put('/api/createTrade/:id/:playerToTradeID', tradeController.createTrade);
router.put('/api/modifyTrade/:id/:playerToTradeID', tradeController.modifyTrade);
router.get('/api/acceptTrade/:id/:playerToTradeID', tradeController.acceptTrade);
router.get('/api/deleteTrade/:id/:playerToTradeID', tradeController.deleteTrade);
//STATISTIC NUEVO
router.get('/api/newStatistic/:id/:inputTransform', statisticController.newStatistic);

//Prueba query (Agregado ayuda de Martin Palomares)
router.get("/test", async (request, res) => {
    try {
        const pool = await poolPromise
        const result = await pool.request()
            .query(`
            select activated from [dbo].[Player_Feedback] WHERE playerID = 1;
            `)
        res.send(result.recordset)
    } catch (error) {
        console.log(error)
        res.status(500)
        res.send(error.message)
    }
})

module.exports = router;