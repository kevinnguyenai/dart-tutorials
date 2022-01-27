// Dart client
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  IO.Socket socket = IO.io('http://localhost:4041');
  socket.on('connect', (_) {
    print('connect');
    socket.emit('msg', 'test');
  });
  socket.on('event', (data) => print(data));
  socket.on('disconnect', (_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));
}
