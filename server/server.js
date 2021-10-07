const PORT = 8080
const express = require('express')
//accept req from everywhere
//parse data from req
const app = express()
// define endpoint

app.listen(PORT,() => {
    console.log(`app running listening ${PORT}`)
})