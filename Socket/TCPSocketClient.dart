//https://api.dart.dev/stable/2.15.1/dart-io/dart-io-library.html
// 
import "dart:isolate";
import "dart:convert";
import "dart:io";
import "dart:async";

import "package:async/async.dart";

void main() async {
  var client = await Socket.connect('127.0.0.1', 4041);
  utf8.decoder.bind(client).listen(print);
  client.write("Ping");
}