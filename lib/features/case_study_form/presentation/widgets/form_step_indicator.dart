import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class FormStepIndicator extends StatelessWidget {
  /// 0-indexed: 0 = no sections submitted, [totalSteps] = all done.
  final int currentStep;
  final int totalSteps;

  const FormStepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  static const double _circleSize = 34.0;
  static const double _lineWidth = 24.0;
  static const double _barHeight = 4.0;

  @override
  Widget build(BuildContext context) {
    final progress =
        totalSteps == 0 ? 0.0 : (currentStep / totalSteps).clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Circle step indicators ──────────────────────────────────────
        SizedBox(
          height: _circleSize,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(totalSteps * 2 - 1, (i) {
                if (i.isOdd) return _buildConnector(i ~/ 2);
                return _buildCircle(context, i ~/ 2);
              }),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // ── Progress bar ────────────────────────────────────────────────
        LayoutBuilder(
          builder: (context, constraints) {
            final fullWidth = constraints.maxWidth;
            return SizedBox(
              height: _barHeight,
              child: Stack(
                children: [
                  // Track
                  Container(
                    width: fullWidth,
                    height: _barHeight,
                    color: AppColors.primary.withValues(alpha: 0.15),
                  ),
                  // Fill
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    width: fullWidth * progress,
                    height: _barHeight,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(3),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCircle(BuildContext context, int step) {
    final isCompleted = step < currentStep;
    final isCurrent = step == currentStep;

    Color bg;
    Color border;
    Widget child;

    if (isCompleted) {
      bg = AppColors.primary;
      border = AppColors.primary;
      child = const Icon(Icons.check, color: Colors.white, size: 16);
    } else if (isCurrent) {
      bg = AppColors.primary;
      border = AppColors.primary;
      child = Text(
        '${step + 1}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      );
    } else {
      bg = Colors.white;
      border = AppColors.primary.withValues(alpha: 0.4);
      child = Text(
        '${step + 1}',
        style: TextStyle(
          color: AppColors.primary.withValues(alpha: 0.6),
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: _circleSize,
      height: _circleSize,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
        border: Border.all(color: border, width: 1.5),
      ),
      child: Center(child: child),
    );
  }

  Widget _buildConnector(int leftStep) {
    final isDone = leftStep < currentStep - 1;
    final isActive = leftStep == currentStep - 1;

    return SizedBox(
      width: _lineWidth,
      child: Divider(
        thickness: 1.5,
        color: (isDone || isActive)
            ? AppColors.primary
            : AppColors.primary.withValues(alpha: 0.2),
      ),
    );
  }
}
