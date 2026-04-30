import 'package:flutter/services.dart';

class PdfPicker {
  static const _channel = MethodChannel('bhcfms/pdf_picker');

  /// Returns the picked PDF file's local path and name, or null if cancelled.
  static Future<({String path, String name})?> pick() async {
    try {
      final raw =
          await _channel.invokeMethod<Map<Object?, Object?>>('pickPdf');
      if (raw == null) return null;
      return (
        path: raw['path'] as String,
        name: raw['name'] as String,
      );
    } on PlatformException {
      return null;
    }
  }
}
