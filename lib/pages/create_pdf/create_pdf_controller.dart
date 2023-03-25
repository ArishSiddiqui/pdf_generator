import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_generator/service/pdf_service.dart';

class CreatePdfController {
  static final pickingFile = StateProvider<bool>((ref) => false);

  static File? image;

  static pickFile(WidgetRef ref) async {
    ref.read(pickingFile.notifier).state = true;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      image = File(result.files.first.path!);
      final pdf = await PdfApi.generatePdf(image!);
      // await 
      PdfApi.openFile(pdf);
    }
    ref.read(pickingFile.notifier).state = false;
  }
}
