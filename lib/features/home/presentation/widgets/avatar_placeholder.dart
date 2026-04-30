import 'package:flutter/material.dart';

class AvatarPlaceholder extends StatelessWidget {
  final double radius;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const AvatarPlaceholder({
    super.key,
    this.radius = 24.0,
    this.icon = Icons.person,
    this.backgroundColor = const Color(0xFFF06292), // Soft pinkish bg as per design
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2), // Clean white border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          size: radius * 1.2,
          color: iconColor,
        ),
      ),
    );
  }
}
