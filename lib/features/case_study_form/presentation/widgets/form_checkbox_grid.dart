import 'package:flutter/material.dart';

/// Responsive 2-column Wrap grid for [FormCheckboxItem] lists.
/// Calculates item width from screen width minus standard horizontal padding.
class FormCheckboxGrid extends StatelessWidget {
  final List<Widget> items;

  const FormCheckboxGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 48) / 2;
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children: items
          .map((item) => SizedBox(width: itemWidth, child: item))
          .toList(),
    );
  }
}
