import 'dart:io';
import 'package:flutter/material.dart';
import 'lines.dart';

String? message;

class MessageBar extends StatelessWidget {
  final client;
  final bool sendable;
  final controller = TextEditingController();

  MessageBar({
    required this.client,
    required this.sendable,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: Lines.btnMsg,
        suffixIcon: IconButton(
          onPressed: () {
            message = controller.value.text.toString();
            sendMessage(client, message);
            controller.clear();
          },
          icon: const Icon(Icons.send),
          color: sendable ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }

  void sendMessage(Socket? socket, String? message) {
    if (socket == null || sendable != true) {
      return;
    } else {
      socket.write('${message ?? ''}\n');
    }
  }
}
