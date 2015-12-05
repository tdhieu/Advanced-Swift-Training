var express = require("express");
var app = express();
var server = require("http").createServer(app);
var io = require("socket.io").listen(server);
server.listen(process.env.PORT || 7123);

io.on("Connection", function(client){
	console.log("Da co nguoi ket noi");
	client.on("Move", function(vitri) {
		console.log(vitri);
		// client.broadcast.emit("vitri", {vitri:vitri});
		client.emit("vitri", )
	});
});


