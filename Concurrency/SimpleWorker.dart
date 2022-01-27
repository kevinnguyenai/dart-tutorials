// https://dart.dev/guides/language/concurrency#implementing-a-simple-worker-isolate
import "dart:isolate";
import "dart:convert";
import "dart:io";
import "dart:async";

Future<Map> _parseInBackground() async  {
  final p = ReceivePort();
  await Isolate.spawn(_readAndParseJson, p.sendPort);
  return await p.first;
}

Future _readAndParseJson(SendPort p) async {
  final fileData = await File('file.json').readAsString();
  final jsonData = jsonDecode(fileData);
  Isolate.exit(p, jsonData);
}

void main() async {
  // read some file data.
  final jsonData = await _parseInBackground();

  // Use that data
  for(int i=0;i<10;i++) {
    _parseInBackground().then((res) => print('${DateTime.now()} : ${res.length}'));
  }
}

