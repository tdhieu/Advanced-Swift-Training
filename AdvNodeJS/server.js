//--------- Goi thu vien express va su dung cho server ---------//
var express = require("express");
var app = express();
var server = require("http").createServer(app);

//--------- Goi va su dung thu vien socket.io -------------//
var io = require("socket.io").listen(server);

//--------- Xac dinh port se mo --------------//
server.listen(process.env.PORT || 7123);

console.log("-----------------");
console.log("server da bat dau");