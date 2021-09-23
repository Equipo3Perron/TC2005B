// Server=tcp:equipoperron.database.windows.net,1433;Initial Catalog=Terninside;Persist Security Info=False;User ID=equipoperron;Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;

const sql = require('mssql');

const config = {
  user: 'equipoperron',
  password: 'Patas.wowow',
  database: 'Terninside',
  server: 'equipoperron.database.windows.net',
  options: {
    trustedConnection: true
  }
};

const poolPromise = new sql.ConnectionPool(config)
  .connect()
  .then(pool => {
    console.log('Connected to MSSQL');
    return pool;
  })
  .catch(err => console.log('Database Connection Failed! Bad Config: ', err));

module.exports = {
  sql,
  poolPromise
};
