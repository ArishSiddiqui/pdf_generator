import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generatePdf(File img) async {
    final pdf = Document();
    final memImg = img.readAsBytesSync();
    final date = DateTime.now();

    cvPage() {
      return Column(children: [
        Header(
          text: 'CV',
          textStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image(
          MemoryImage(memImg),
          height: 500,
          width: 500,
        ),
        Text(
          date.toString(),
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]);
    }

    pdf.addPage(Page(
      build: (context) => cvPage(),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);
    // print('File saved to : ${dir.path}, File Path : ${file.path}');

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
