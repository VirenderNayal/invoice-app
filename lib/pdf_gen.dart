import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

class PDFGenerator {
  static Future<File> generatePDF(List<Map<String, String>> items) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.TableHelper.fromTextArray(
            headers: ["#", "Description", "Amount"],
            data: [
              for (var i = 0; i < items.length; i++)
                [i + 1, items[i].keys.first, items[i].values.first],
            ],
          ),
        ],
      ),
    );
    final bytes = await pdf.save();
    final output = await getApplicationDocumentsDirectory();
    final file = File('${output.path}/invoice.pdf');
    await file.writeAsBytes(bytes);

    return file;
  }
}
