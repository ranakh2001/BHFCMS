import 'package:flutter/material.dart';
import '../../../children/presentation/screens/children_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../messages/presentation/screens/messages_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../schedule/presentation/screens/schedule_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ChildrenScreen(),
    const ScheduleScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
