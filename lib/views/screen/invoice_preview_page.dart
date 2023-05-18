import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/modal/pro_modals.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class invoice_preview_page extends StatefulWidget {
  const invoice_preview_page({Key? key}) : super(key: key);

  @override
  State<invoice_preview_page> createState() => _invoice_preview_pageState();
}

class _invoice_preview_pageState extends State<invoice_preview_page> {
  pw.Document pdf = pw.Document();

  generatePdf() async {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    // Size s = MediaQuery.of(context).size ;
    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) => pw.Container(
          height: double.infinity,
          width: double.infinity,
          alignment: pw.Alignment.center,
          decoration: const pw.BoxDecoration(
              // color: PdfColors.white,
              ),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                height: 120,
                width: 150,
                color: PdfColors.cyanAccent,
              ),
              pw.Container(
                height: 200,
                width: 100,
                color: PdfColors.black,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text(
                      "Total",
                      style: const pw.TextStyle(fontSize: 25),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      "${allproduct[index].price}",
                      style: const pw.TextStyle(fontSize: 25),
                    ),
                    pw.SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    generatePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add, color: Colors.transparent),
        title: Text(
          "Invoice",
          style: GoogleFonts.varta(
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) => pdf.save(),
      ),
    );
  }
}