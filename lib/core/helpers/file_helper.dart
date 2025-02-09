import 'dart:io';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart';

class FileHelper {
  FileHelper._();

  static File renameFileWithDateTime({
    required File file,
    String prefix = 'File',
  }) {
    String tempFileName = file.path.split('/').last;
    String formatFile = tempFileName.split(".").last;
    String fileDir = path.dirname(file.path);
    String newPath = path.join(fileDir,
        '$prefix-${DateTime.now().extToFormattedString(outputDateFormat: 'ddMMyy-HH:mm')}.$formatFile');

    return File(file.path).renameSync(newPath);
  }

  static File renameFile({
    required File file,
    required String customName,
  }) {
    String tempFileName = file.path.split('/').last;
    String formatFile = tempFileName.split(".").last;
    String fileDir = path.dirname(file.path);
    String newPath = path.join(fileDir, '$customName.$formatFile');
    return File(file.path).renameSync(newPath);
  }

  static getFileExtension(String fileName) {
    return fileName.split('.').last;
  }

  static Future<File> urlToFile(String imageUrl) async {
    try {
      var random = math.Random();

      Directory tempDir = await getTemporaryDirectory();
      String fileType = getFileExtension(imageUrl);
      String tempPath = tempDir.path;
      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${random.nextInt(10000)}.$fileType';
      File file = File(
        '$tempPath/$fileName',
      );
      // add timeout to get method to avoid delay
      var response = await Dio()
          .get(
            imageUrl,
            options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            ),
          )
          .timeout(
            const Duration(seconds: 10),
          );

      await file.writeAsBytes(response.data);

      return file;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
