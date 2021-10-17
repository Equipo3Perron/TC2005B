const { query } = require('express');
const { sql, poolPromise } = require('../database/db');

class MainController {
  async getFeedback(req, res) {
    try {
      const pool = await poolPromise;
      const result = await pool
        .request()
        .input('playerID', sql.Int, req.params.id)
        .query('select activated from [dbo].[Player_Feedback] WHERE playerID = @playerID');

      res.json(result.recordset);

      console.log(result.recordset);
    } catch (error) {
      console.log('FALLO EL BUSCAR WEY');
      res.status(500);
      res.send(error.message);
    }
  }
  async addFirstFeedback(req, res) {
    try {
        const pool = await poolPromise;
        const result = await pool
        .request()
        .input('playerID', sql.Int, req.params.id)
        .input('furnaceFeedback', sql.Bit, req.body.furnaceFeedback)
        .input('energyFeedback', sql.Bit, req.body.energyFeedback)
        .input('friendFeedback', sql.Bit, req.body.friendFeedback)
        .query(
          'EXECUTE SPAddFeedback @playerID, @furnaceFeedback, @energyFeedback, @friendFeedback'
        );
      console.log("EL req.body");
      console.log(req.body);
      console.log("EL id");
      console.log(req.body.id);
      console.log("EL IDPlayer");
      console.log(req.body.IDPlayer);
      res.json(result);
    } catch (error) {
      console.log(error);
      console.log('FALLO EL ANADIR AL INICIO');
      res.status(500);
      res.send(error.message);
    }
  }
  async updateFeedback(req, res) {
    try {
      const pool = await poolPromise;
      const result = await pool
        .request()
        .input('playerID', sql.Int, req.params.id)
        .input('furnaceFeedback', sql.Bit, req.body.furnaceFeedback)
        .input('energyFeedback', sql.Bit, req.body.energyFeedback)
        .input('friendFeedback', sql.Bit, req.body.friendFeedback)
        .query(
          'EXECUTE SPUpdateFeedback @playerID, @furnaceFeedback, @energyFeedback, @friendFeedback'
        );
        console.log(req.body);
        res.json(result);
       
    } catch (error) {
      console.log('FALLO EL ACTUALIZAR');
      res.status(500);
      res.send(error.message);
    }
  }
}

const feedbackController = new MainController();
module.exports = feedbackController;