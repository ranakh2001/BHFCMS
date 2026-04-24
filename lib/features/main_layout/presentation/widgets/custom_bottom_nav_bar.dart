import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/responsive_helper.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  /// Icon asset paths — one per tab. Driven by [MainLayoutScreen] so the
  /// bar has no knowledge of roles or feature flags.
  final List<String> iconPaths;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.iconPaths,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slotAnimation;
  int _prevIndex = 0;

  @override
  void initState() {
    super.initState();
    _prevIndex = widget.currentIndex;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slotAnimation = AlwaysStoppedAnimation(widget.currentIndex.toDouble());
  }

  @override
  void didUpdateWidget(CustomBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _slotAnimation = Tween<double>(
        begin: _prevIndex.toDouble(),
        end: widget.currentIndex.toDouble(),
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller.forward(from: 0);
      _prevIndex = widget.currentIndex;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final itemCount = widget.iconPaths.length;

    return Padding(
      padding: EdgeInsets.only(
        left: res.scaleSpacing(16),
        right: res.scaleSpacing(16),
        bottom: bottomInset + res.scaleSpacing(12),
      ),
      child: Container(
        height: res.scaleHeight(58),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(res.scaleRadius(29)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.45),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.12),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(res.scaleRadius(29)),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final isRtl = Directionality.of(context) == TextDirection.rtl;
              final indicatorWidth = res.scaleWidth(20);
              final indicatorHeight = res.scaleHeight(3);
              final bottomPad = res.scaleSpacing(5);

              return Stack(
                children: [
                  AnimatedBuilder(
                    animation: _slotAnimation,
                    builder: (context, _) {
                      final slotWidth = totalWidth / itemCount;
                      double centerX =
                          (_slotAnimation.value + 0.5) * slotWidth;
                      if (isRtl) centerX = totalWidth - centerX;
                      final left = centerX - indicatorWidth / 2;

                      return Positioned(
                        bottom: bottomPad,
                        left: left,
                        child: Container(
                          width: indicatorWidth,
                          height: indicatorHeight,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                res.scaleRadius(2)),
                          ),
                        ),
                      );
                    },
                  ),
                  Row(
                    children: List.generate(
                      itemCount,
                      (i) => Expanded(
                        child: _NavItemTile(
                          iconPath: widget.iconPaths[i],
                          isSelected: widget.currentIndex == i,
                          onTap: () => widget.onTap(i),
                          res: res,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavItemTile extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;
  final ResponsiveHelper res;

  const _NavItemTile({
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox.expand(
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            opacity: isSelected ? 1.0 : 0.5,
            child: SvgPicture.asset(
              iconPath,
              width: res.scaleWidth(26),
              height: res.scaleWidth(26),
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
