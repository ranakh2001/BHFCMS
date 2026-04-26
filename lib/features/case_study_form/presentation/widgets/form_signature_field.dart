import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../domain/entities/case_study_form_data.dart';

/// Freehand signature canvas using only built-in Flutter APIs.
/// Captures stylus and touch input via [GestureDetector] and renders with
/// [CustomPainter]. No third-party packages required.
class FormSignatureField extends StatefulWidget {
  final String label;
  final String clearLabel;
  final SignatureData? initialData;
  final ValueChanged<SignatureData> onChanged;
  final double canvasHeight;

  const FormSignatureField({
    super.key,
    required this.label,
    required this.onChanged,
    this.clearLabel = 'Clear',
    this.initialData,
    this.canvasHeight = 130,
  });

  @override
  State<FormSignatureField> createState() => _FormSignatureFieldState();
}

class _FormSignatureFieldState extends State<FormSignatureField> {
  final List<List<Offset>> _strokes = [];
  final List<Offset> _current = [];

  @override
  void initState() {
    super.initState();
    final d = widget.initialData;
    if (d != null && !d.isEmpty) {
      _strokes.addAll(
        d.strokes.map(
          (s) => s.map((p) => Offset(p['x']!, p['y']!)).toList(),
        ),
      );
    }
  }

  SignatureData _toSignatureData() => SignatureData(
        strokes: _strokes
            .map((s) => s.map((p) => {'x': p.dx, 'y': p.dy}).toList())
            .toList(),
      );

  void _onPanStart(DragStartDetails d) {
    _current
      ..clear()
      ..add(d.localPosition);
    setState(() {});
  }

  void _onPanUpdate(DragUpdateDetails d) {
    _current.add(d.localPosition);
    setState(() {});
  }

  void _onPanEnd(DragEndDetails _) {
    if (_current.isEmpty) return;
    _strokes.add(List<Offset>.of(_current));
    _current.clear();
    setState(() {});
    widget.onChanged(_toSignatureData());
  }

  void _clear() {
    _strokes.clear();
    _current.clear();
    setState(() {});
    widget.onChanged(const SignatureData());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _clear,
              child: Text(
                widget.clearLabel,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: widget.canvasHeight,
            color: const Color(0xFFF5F6FA),
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              onPanEnd: _onPanEnd,
              child: CustomPaint(
                painter: _SignaturePainter(
                  strokes: _strokes,
                  current: _current,
                ),
                size: Size.infinite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SignaturePainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final List<Offset> current;

  const _SignaturePainter({required this.strokes, required this.current});

  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    void drawStroke(List<Offset> pts) {
      if (pts.isEmpty) return;
      if (pts.length == 1) {
        canvas.drawCircle(pts[0], 1.0, Paint()..color = Colors.black87);
        return;
      }
      final path = Path()..moveTo(pts[0].dx, pts[0].dy);
      for (var i = 1; i < pts.length; i++) {
        path.lineTo(pts[i].dx, pts[i].dy);
      }
      canvas.drawPath(path, pen);
    }

    for (final s in strokes) {
      drawStroke(s);
    }
    drawStroke(current);
  }

  @override
  bool shouldRepaint(_SignaturePainter _) => true;
}
