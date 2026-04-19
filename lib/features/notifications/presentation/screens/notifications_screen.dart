import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_helper.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: res.scaleText(20)),
        ),
      ),
      body: Center(
        child: Text(
          'Notifications Feature',
          style: TextStyle(fontSize: res.scaleText(16)),
        ),
      ),
    );
  }
}
