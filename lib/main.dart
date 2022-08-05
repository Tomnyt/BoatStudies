import 'dart:io';
import 'package:client/message_bar.dart';
import 'lines.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clickable',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var client;
  //String? message;
  String? address;
  int? port;
  bool messageSendable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Lines.textTitle)),
      body: Center(
          child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: Lines.hintTextAddress,
              suffixIcon: const Icon(Icons.message),
            ),
            keyboardType: TextInputType.number,
            onChanged: (msg) {
              address = msg;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: Lines.hintTextPort),
            keyboardType: TextInputType.number,
            onChanged: (msg) {
              port = int.parse(msg);
            },
          ),
          ElevatedButton(
              onPressed: () {
                connectSocket(address, port ?? 3000);
              },
              child: Text(Lines.btnCnct)),
          MessageBar(client: client, sendable: messageSendable),
          /*TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: Lines.btnMsg,
              suffixIcon: IconButton(
                onPressed: () {
                  message = _controller.value.text.toString();
                  sendMessage(client, message);
                  _controller.clear();
                },
                icon: const Icon(Icons.send),
                color: messageSendable ? Colors.blue : Colors.grey,
              ),
            ),
          ),*/
          ElevatedButton(
              onPressed: () {
                closeSocket(client);
              },
              child: Text(Lines.btnCls)),
        ],
      )),
    );
  }

  void connectSocket(address, port) async {
    client = await Socket.connect(address, port);
    setState(() {
      messageSendable = true;
    });
  }

  /*void sendMessage(Socket? socket, String? message) {
    if (socket == null || messageSendable != true) {
      return;
    } else {
      socket.write('${message ?? ''}\n');
    }
  }*/

  void closeSocket(Socket? socket) {
    if (socket == null) {
      return;
    } else {
      socket.close();
      setState(() {
        messageSendable = false;
      });
    }
  }
}
