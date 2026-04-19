import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_helper.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: TextStyle(fontSize: res.scaleText(20)),
        ),
      ),
      body: Center(
        child: Text(
          'Appointments Feature',
          style: TextStyle(fontSize: res.scaleText(16)),
        ),
      ),
    );
  }
}
