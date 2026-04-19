import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_helper.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(fontSize: res.scaleText(20)),
        ),
      ),
      body: Center(
        child: Text(
          'Reports Feature',
          style: TextStyle(fontSize: res.scaleText(16)),
        ),
      ),
    );
  }
}
