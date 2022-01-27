// JS client
const io = require('socket.io-client');
var socket = io('http://localhost:4041');
socket.on('connect', function(){console.log('connect')});
socket.on('event', function(data){console.log(data)});
socket.on('disconnect', function(){console.log('disconnect')});
socket.on('fromServer', function(e){console.log(e)});