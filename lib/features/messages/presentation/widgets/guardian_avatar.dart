import 'package:flutter/material.dart';

class GuardianAvatar extends StatelessWidget {
  final double size;

  const GuardianAvatar({super.key, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE8A0A0),
      ),
      child: ClipOval(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: size * 0.65,
                height: size * 0.65,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8A0A0),
                ),
              ),
            ),
            Positioned(
              top: size * 0.15,
              child: Container(
                width: size * 0.35,
                height: size * 0.35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD4756A),
                ),
              ),
            ),
            Positioned(
              bottom: -size * 0.05,
              child: Container(
                width: size * 0.6,
                height: size * 0.45,
                decoration: const BoxDecoration(
                  color: Color(0xFFD4756A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size * 0.05,
              right: size * 0.05,
              child: Container(
                width: size * 0.2,
                height: size * 0.15,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4A62A),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuardianAvatarLarge extends StatelessWidget {
  final double size;

  const GuardianAvatarLarge({super.key, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: GuardianAvatar(size: size),
    );
  }
}
