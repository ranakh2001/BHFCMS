import 'package:flutter/material.dart';

/// Light-grey card container used for treatment cards, medication cards,
/// assessment rows, milestone cards, and similar grouped form blocks.
class FormCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const FormCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }
}
