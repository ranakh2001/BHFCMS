import 'dart:async';
import 'dart:math';

class AttachmentService {
  final _random = Random();

  Stream<double> uploadWithProgress(String localPath) async* {
    double progress = 0.0;
    while (progress < 1.0) {
      await Future.delayed(const Duration(milliseconds: 120));
      progress = (progress + _random.nextDouble() * 0.22 + 0.05).clamp(0.0, 1.0);
      yield progress;
    }
  }

  Future<String> getMockUploadUrl(String localPath) async {
    final filename = localPath.replaceAll('\\', '/').split('/').last;
    final ts = DateTime.now().millisecondsSinceEpoch;
    return 'https://mock-cdn.bhcfms.com/uploads/${ts}_$filename';
  }
}
