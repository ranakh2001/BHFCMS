import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_helper.dart';

class AiAssistantScreen extends StatelessWidget {
  const AiAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Assistant',
          style: TextStyle(fontSize: res.scaleText(20)),
        ),
      ),
      body: Center(
        child: Text(
          'AI Assistant Feature',
          style: TextStyle(fontSize: res.scaleText(16)),
        ),
      ),
    );
  }
}
