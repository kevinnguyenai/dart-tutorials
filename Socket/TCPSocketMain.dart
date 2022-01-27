//https://api.dart.dev/stable/2.15.1/dart-io/dart-io-library.html
// 
import "dart:isolate";
import "dart:convert";
import "dart:io";
import "dart:async";

import "package:async/async.dart";

const filenames = [
  'file.json',
  'file2.json',
  'file3.json'
];

void main() async {
  ServerSocket.bind('127.0.0.1', 4041)
  .then((serverSocket) {
    print('Server startup successful at tcp://127.0.0.1:4041');
    serverSocket.listen((socket) {
      utf8.decoder.bind(socket).listen((data) {
        print(data);
        socket.write('Pong');
      });
    });
  })
  .catchError((err) {
    print('Server startup failed by ${err}');
  });
}