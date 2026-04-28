import Flutter
import UIKit
import UniformTypeIdentifiers

@main
@objc class AppDelegate: FlutterAppDelegate {

    private var pdfPickerResult: FlutterResult?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        if let controller = window?.rootViewController as? FlutterViewController {
            let channel = FlutterMethodChannel(
                name: "bhcfms/pdf_picker",
                binaryMessenger: controller.binaryMessenger
            )
            channel.setMethodCallHandler { [weak self] call, result in
                guard call.method == "pickPdf" else {
                    result(FlutterMethodNotImplemented)
                    return
                }
                self?.pdfPickerResult = result
                self?.presentDocumentPicker(from: controller)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func presentDocumentPicker(from viewController: UIViewController) {
        let picker: UIDocumentPickerViewController
        if #available(iOS 14.0, *) {
            picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.pdf])
        } else {
            picker = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: .import)
        }
        picker.delegate = self
        picker.allowsMultipleSelection = false
        viewController.present(picker, animated: true)
    }
}

extension AppDelegate: UIDocumentPickerDelegate {

    func documentPicker(
        _ controller: UIDocumentPickerViewController,
        didPickDocumentsAt urls: [URL]
    ) {
        guard let url = urls.first else {
            pdfPickerResult?(nil)
            pdfPickerResult = nil
            return
        }
        let temp = FileManager.default.temporaryDirectory
            .appendingPathComponent(url.lastPathComponent)
        do {
            if FileManager.default.fileExists(atPath: temp.path) {
                try FileManager.default.removeItem(at: temp)
            }
            try FileManager.default.copyItem(at: url, to: temp)
            pdfPickerResult?(["path": temp.path, "name": url.lastPathComponent])
        } catch {
            pdfPickerResult?(FlutterError(
                code: "COPY_FAILED",
                message: error.localizedDescription,
                details: nil
            ))
        }
        pdfPickerResult = nil
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        pdfPickerResult?(nil)
        pdfPickerResult = nil
    }
}
