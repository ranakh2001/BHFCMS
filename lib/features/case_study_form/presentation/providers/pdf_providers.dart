import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

/// Rasterises the letterhead PDF once at 300 DPI and caches the result.
///
/// Uses a non-autoDispose FutureProvider so the PNG stays in memory for the
/// lifetime of the app — no repeated rasterisation on every preview rebuild.
final letterheadBgProvider = FutureProvider<pw.MemoryImage>((ref) async {
  final bytes = await rootBundle.load('assets/letterhead.pdf');
  await for (final page in Printing.raster(
    bytes.buffer.asUint8List(),
    dpi: 300,
  )) {
    final png = await page.toPng();
    return pw.MemoryImage(png);
  }
  throw Exception('الملف letterhead.pdf فارغ أو تالف');
});

/// Controls whether the letterhead is baked into the generated PDF bytes.
///
/// - `true`  → letterhead drawn as background (digital sharing / email)
/// - `false` → content only (for printing on pre-printed letterhead paper)
final overlayLetterheadProvider = StateProvider<bool>((ref) => true);
