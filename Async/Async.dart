import "dart:io";
import "dart:async";
import "dart:core";
import "dart:convert";
import "package:http/http.dart" as http;

class HttpException implements Exception {
  String msg()  => 'Http Request Error';
  String code() => '404';
  
}
// Using async method return Future
Future<Map> runUsingFuture() async {
  var path = "https://raw.githubusercontent.com/SMAPPNYU/ProgrammerGroup/master/LargeDataSets/sample-tweet.raw.json";
  var client = http.Client();
  try {
    var response = await client.get(Uri.parse(path));
    var decoder = jsonDecode(response.body) as Map;
    return decoder;
  }
  catch(err) {
    throw new HttpException();
  } 
  finally {
    client.close();
  }
}
// Using simple request http
Future<Map> runUsingSimpleHttp() {
  var path = "https://raw.githubusercontent.com/SMAPPNYU/ProgrammerGroup/master/LargeDataSets/sample-tweet.raw.json";
  var res  = http.get(Uri.parse(path));
  return res
  .then((data) => jsonDecode(data.body) as Map)
  .catchError((err) => { throw new HttpException()});
}

// Using simple request http with Future.sync
Future<Map> runUsingSimpleHttpSync() {
  var path = "https://raw.githubusercontent.com/SMAPPNYU/ProgrammerGroup/master/LargeDataSets/sample-tweet.raw.json";
  
  return Future.sync(() {
    var res = http.get(Uri.parse(path));
    return res
    .then( (data) { 
      var response = jsonDecode(data.body) as Map;
      return response;
    });
  });
}

void main() {
  print('-----------------------------Future Read File');
  File file = new File(Directory.current.path + '/Async.txt');
  Future<String> f = file.readAsString();
  f.then((data) => print(data));
  // Define Future request 
  Future<Map> req1 = runUsingFuture();
  // Solve data and catch err with req
  
  req1
  .then((data) => { 
    print('--------------------------------------Future async'),
    print('Data Length: ${data.length} with detail: ${data}' )
  })
  .catchError((err) => { print('Error cause by : ${err.msg()} with code ${err.code()}') });
  
  Future<Map> req2 = runUsingSimpleHttp();
  req2
  .then((data) => { 
    print('---------------------------------------Future Simple Http'),
    print('Data Length: ${data.length} with detail: ${data}')
  })
  .catchError((err) => { print('Error cause by: ${err} with code ${err}') });

  Future<Map> req3 = runUsingSimpleHttpSync();
  req3
  .then((data) => { 
    print('---------------------------------------Future Sync Simple Http'),
    print('Data Length: ${data.length} with detail: ${data}')
  })
  .catchError((err) => { print('Error cause by: ${err} with code ${err}') });

}