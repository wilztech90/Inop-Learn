import 'package:file_picker/file_picker.dart';

Future<String> pickFileDocument() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc'],
    allowCompression: true,
  );
  if (result != null) {
    final String? file = result.files.single.path;
    return file!;
  } else {
    return '';
  }
}
