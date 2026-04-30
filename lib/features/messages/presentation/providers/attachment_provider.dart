import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../models/chat_message.dart';
import '../../data/services/attachment_service.dart';

enum UploadStatus { idle, loading, success, error }

class AttachmentState {
  final String? localPath;
  final String? fileName;
  final MessageType? type;
  final UploadStatus uploadStatus;
  final double uploadProgress;
  final String? uploadedUrl;
  final String? error;

  const AttachmentState({
    this.localPath,
    this.fileName,
    this.type,
    this.uploadStatus = UploadStatus.idle,
    this.uploadProgress = 0.0,
    this.uploadedUrl,
    this.error,
  });

  bool get hasAttachment => localPath != null;
  bool get isUploading => uploadStatus == UploadStatus.loading;
  bool get hasError => uploadStatus == UploadStatus.error;

  AttachmentState copyWith({
    String? localPath,
    String? fileName,
    MessageType? type,
    UploadStatus? uploadStatus,
    double? uploadProgress,
    String? uploadedUrl,
    String? error,
  }) {
    return AttachmentState(
      localPath: localPath ?? this.localPath,
      fileName: fileName ?? this.fileName,
      type: type ?? this.type,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      uploadedUrl: uploadedUrl ?? this.uploadedUrl,
      error: error ?? this.error,
    );
  }
}

class AttachmentNotifier extends Notifier<AttachmentState> {
  final _picker = ImagePicker();
  final _service = AttachmentService();

  @override
  AttachmentState build() => const AttachmentState();

  Future<void> pickImage(ImageSource source) async {
    final result = await _picker.pickImage(source: source, imageQuality: 80);
    if (result == null) return;
    state = AttachmentState(
      localPath: result.path,
      fileName: result.name,
      type: MessageType.image,
    );
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt', 'ppt', 'pptx'],
    );
    if (result == null || result.files.isEmpty) return;
    final file = result.files.first;
    if (file.path == null) return;
    state = AttachmentState(
      localPath: file.path,
      fileName: file.name,
      type: MessageType.file,
    );
  }

  void clearAttachment() {
    state = const AttachmentState();
  }

  Future<String?> upload() async {
    if (!state.hasAttachment) return null;
    state = state.copyWith(
      uploadStatus: UploadStatus.loading,
      uploadProgress: 0.0,
      error: null,
    );
    try {
      await for (final progress in _service.uploadWithProgress(state.localPath!)) {
        state = state.copyWith(uploadProgress: progress);
      }
      final url = await _service.getMockUploadUrl(state.localPath!);
      state = state.copyWith(uploadStatus: UploadStatus.success, uploadedUrl: url);
      return url;
    } catch (e) {
      state = state.copyWith(
        uploadStatus: UploadStatus.error,
        error: e.toString(),
      );
      return null;
    }
  }

  Future<String?> retryUpload() => upload();
}

final attachmentProvider =
    NotifierProvider<AttachmentNotifier, AttachmentState>(AttachmentNotifier.new);
