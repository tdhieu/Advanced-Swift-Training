//--------- Goi thu vien express va su dung cho server ---------//
var express = require("express");
var app = express();
var server = require("http").createServer(app);

//--------- Goi va su dung thu vien socket.io -------------//
var io = require("socket.io").listen(server);

//--------- Goi va su dung thu vien mysql ------------//
var mysql = require("mysql");

//--------- Ket noi den server ------------//
var connection = mysql.createConnection({
	host : "localhost",
	user : "root",
	password : "",
	database : "ChatDB"
});

connection.connect();
connection.query("SELECT * FROM User", function(err, rows, fields) {
	if (!err)
		console.log("The result is: ", rows);
	else
		console.log("Error while performing Query!");
});
connection.end();

//--------- Xac dinh port se mo --------------//
server.listen(process.env.PORT || 7123);

console.log("-----------------");
console.log("Server da bat dau");

//--------- Kiem tra co nguoi ket noi den server --------------//
io.on("connection",function(client){
	console.log("Co nguoi vua ket noi");
	client.emit("DangNhap", {dulieu: "Chao mung ban da quay lai"});
/*	client.on("Click", function(data){
		console.log("Client:")		
		console.log(data);
		client.emit("GuiTinNhan", {tinnhan: data});
	});
*/
	client.on("Create", function(room){
		console.log("Da tham gia vao room");
		client.join(room);
	});

	client.on("Message", function(message){
		console.log(message);
		client.broadcast.to("Phong1").emit("Message", {data: message});
	});
});

