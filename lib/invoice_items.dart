import 'package:flutter/material.dart';
import 'package:invoice_app/invoice_data.dart';
import 'package:invoice_app/pdf_gen.dart';
// import 'package:path_provider/path_provider.dart';
// invoice_items.dart

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';  // Import the pdf_flutter package
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class InvoiceItems extends StatefulWidget {
  const InvoiceItems({super.key, required this.invData});

  final InvoiceData invData;
  @override
  State<InvoiceItems> createState() => _InvoiceItemsState();
}

class _InvoiceItemsState extends State<InvoiceItems> {
  final TextEditingController desc = TextEditingController();
  final TextEditingController amt = TextEditingController();
  File? pdfFile; // Variable to store the generated PDF file

  Future<void> generateAndSavePDF() async {
    // Call the PDF generation function and store the generated file
    pdfFile = await PDFGenerator.generatePDF(widget.invData.items);
    
    // Navigate to the PDF viewer page
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PDFViewerPage(pdfFile: pdfFile!),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = widget.invData.items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "INVOICE ITEMS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => Dialog(
                    child: Container(
                      height: 325,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("ITEM DETAILS"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              controller: desc,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "DESCRIPTION",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: TextField(
                              controller: amt,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "AMOUNT",
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    desc.text = "";
                                    amt.text = "";
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    var newItem = Map<String, String>();
                                    newItem[desc.text] = amt.text;

                                    desc.text = "";
                                    amt.text = "";

                                    setState(() {
                                      items.add(newItem);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Save"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "ADD ITEM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index].entries.toList();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        item[0].key,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        item[0].value,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: generateAndSavePDF, // Call the PDF generation function
            child:const Text('Generate PDF'),
          ),
        ],
      ),
    );
  }
}


class PDFViewerPage extends StatelessWidget {
  final File pdfFile;

  PDFViewerPage({required this.pdfFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen (InvoiceItems)
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<PDFDocument>(
        future: PDFDocument.fromFile(pdfFile),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading PDF'));
          } else if (snapshot.hasData) {
            return PDFViewer(document: snapshot.data!);
          }
          return Center(child: Text('No PDF available'));
        },
      ),
    );
  }
}


