import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_helper.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: TextStyle(fontSize: res.scaleText(20)),
        ),
      ),
      body: Center(
        child: Text(
          'Chat Feature',
          style: TextStyle(fontSize: res.scaleText(16)),
        ),
      ),
    );
  }
}
