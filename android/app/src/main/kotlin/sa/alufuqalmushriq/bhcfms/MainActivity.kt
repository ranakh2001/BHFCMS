package sa.alufuqalmushriq.bhcfms

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.provider.OpenableColumns
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val channelName = "bhcfms/pdf_picker"
    private var pendingResult: MethodChannel.Result? = null

    companion object {
        private const val PICK_PDF_CODE = 1001
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName,
        ).setMethodCallHandler { call, result ->
            if (call.method == "pickPdf") {
                pendingResult = result
                val intent = Intent(Intent.ACTION_GET_CONTENT).apply {
                    type = "application/pdf"
                    addCategory(Intent.CATEGORY_OPENABLE)
                }
                startActivityForResult(
                    Intent.createChooser(intent, "Select PDF"),
                    PICK_PDF_CODE,
                )
            } else {
                result.notImplemented()
            }
        }
    }

    @Suppress("DEPRECATION")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != PICK_PDF_CODE) return

        val result = pendingResult ?: return
        pendingResult = null

        if (resultCode == Activity.RESULT_OK) {
            val uri = data?.data
            if (uri != null) {
                val name = queryFileName(uri) ?: "document.pdf"
                val path = copyUriToCache(uri, name)
                if (path != null) {
                    result.success(mapOf("path" to path, "name" to name))
                } else {
                    result.error("COPY_FAILED", "Failed to copy PDF to cache", null)
                }
            } else {
                result.success(null)
            }
        } else {
            result.success(null)
        }
    }

    private fun queryFileName(uri: Uri): String? {
        contentResolver.query(uri, null, null, null, null)?.use { cursor ->
            if (cursor.moveToFirst()) {
                val col = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                if (col >= 0) return cursor.getString(col)
            }
        }
        return null
    }

    private fun copyUriToCache(uri: Uri, name: String): String? {
        return try {
            val dest = java.io.File(cacheDir, name)
            contentResolver.openInputStream(uri)?.use { src ->
                dest.outputStream().use { out -> src.copyTo(out) }
            }
            dest.absolutePath
        } catch (_: Exception) {
            null
        }
    }
}
