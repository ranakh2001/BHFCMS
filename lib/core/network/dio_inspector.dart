import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Custom Dio [Interceptor] that pretty-prints every request, response, and
/// error to the debug console.
///
/// All output is guarded by [kDebugMode] — nothing leaks into release builds.
class DioInspector extends Interceptor {
  static const _line = '══════════════════════════════════════════════';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      final buf = StringBuffer()
        ..writeln('╔══ 🚀 REQUEST ══╗')
        ..writeln('  Method   : ${options.method}')
        ..writeln('  URL      : ${options.uri}')
        ..writeln('  Headers  : ${_redactAuth(options.headers)}');
      if (options.queryParameters.isNotEmpty) {
        buf.writeln('  Params   : ${options.queryParameters}');
      }
      if (options.data != null) {
        buf.writeln('  Body     : ${options.data}');
      }
      buf.write('╚$_line╝');
      debugPrint(buf.toString());
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      final buf = StringBuffer()
        ..writeln('╔══ ✅ RESPONSE ══╗')
        ..writeln('  Status   : ${response.statusCode}')
        ..writeln('  URL      : ${response.realUri}')
        ..writeln('  Data     : ${response.data}')
        ..write('╚$_line╝');
      debugPrint(buf.toString());
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      final buf = StringBuffer()
        ..writeln('╔══ ❌ ERROR ══╗')
        ..writeln('  Type     : ${err.type}')
        ..writeln('  Message  : ${err.message}')
        ..writeln('  Status   : ${err.response?.statusCode}');
      if (err.response?.data != null) {
        buf.writeln('  Data     : ${err.response?.data}');
      }
      buf.write('╚$_line╝');
      debugPrint(buf.toString());
    }
    super.onError(err, handler);
  }

  /// Replaces the Bearer token value with `[REDACTED]` so credentials never
  /// appear in logs, even in debug mode.
  Map<String, dynamic> _redactAuth(Map<String, dynamic> headers) {
    final copy = Map<String, dynamic>.from(headers);
    if (copy.containsKey('Authorization')) {
      copy['Authorization'] = '[REDACTED]';
    }
    return copy;
  }
}
