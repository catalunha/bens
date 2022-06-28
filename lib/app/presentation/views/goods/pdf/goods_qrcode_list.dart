import 'dart:typed_data';
import 'package:intl/intl.dart';

import 'package:bens/app/presentation/controllers/auth/splash/splash_controller.dart';
import 'package:bens/app/presentation/controllers/goods/goods_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GoodsQrCodeList extends StatelessWidget {
  final GoodsController _goodsController = Get.find();
  final SplashController _splashController = Get.find();

  GoodsQrCodeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de QrCodes em PDF')),
      body: PdfPreview(
        pdfFileName: 'bens_pdf',
        build: (format) async => await _generatePdf(format, 'Bens em PDF'),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    // final pdf = pw.Document();
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();
    // pw.ImageProvider image;

    // try {
    //   final provider = await flutterImageProvider(NetworkImage(authorPhoto));
    //   image = provider;
    // } catch (e) {
    //   print("--> Erro em _generatePdf: $e");
    // }
    var goodsLines = await buildGoodsByLine();
    pdf.addPage(
      pw.MultiPage(
        theme: theme(font1, font2),
        pageFormat: pageFormat(format),
        orientation: pw.PageOrientation.portrait,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        footer: (pw.Context context) => footerPage(context),
        build: (pw.Context context) => <pw.Widget>[
          header(name: _splashController.userModel?.profile?.fullName),
          // pw.Text('Classificador da frase:'),
          ...goodsLines,
        ],
      ),
    );

    return pdf.save();
  }

  header({String? name}) {
    return pw.Header(
      level: 1,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: <pw.Widget>[
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            name == null
                ? pw.Text('Nome completo não informado.')
                : pw.Text(name),
            // pw.Text('Solicitante deste relatório.'),
          ]),
          // pw.Image(
          //   image,
          //   width: 50,
          //   height: 100,
          // ),
        ],
      ),
    );
  }

  footerPage(context) {
    return pw.Container(
      alignment: pw.Alignment.centerRight,
      margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
      decoration: const pw.BoxDecoration(
          border: pw.Border(
              top: pw.BorderSide(width: 1.0, color: PdfColors.black))),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            'CEMEC(R) 2022. Relatório de ${DateFormat('dd-MM-y hh:mm').format(DateTime.now())}',
            style: const pw.TextStyle(fontSize: 10),
          ),
          pw.Text(
            'Pág.: ${context.pageNumber} de ${context.pagesCount}',
            style: const pw.TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  pageFormat(format) {
    return format.copyWith(
      width: 21.0 * PdfPageFormat.cm,
      height: 29.7 * PdfPageFormat.cm,
      marginTop: 1.0 * PdfPageFormat.cm,
      marginLeft: 1.0 * PdfPageFormat.cm,
      marginRight: 1.0 * PdfPageFormat.cm,
      marginBottom: 1.0 * PdfPageFormat.cm,
    );
  }

  theme(font1, font2) {
    return pw.ThemeData.withFont(
      base: font1,
      bold: font2,
    );
  }

  getImage(String photoUrl) async {
    pw.ImageProvider image;

    try {
      final provider = await flutterImageProvider(NetworkImage(photoUrl));
      image = provider;
      return image;
    } catch (e) {
      print("--> Erro em _generatePdf: $e");
    }
    return null;
  }

  Future<List<pw.Widget>> buildGoodsByLine() async {
    List<pw.Widget> lineList = [];
    int index = 1;
    for (var good in _goodsController.goodsList) {
      debugPrint('PDF ${good.id}');
      var image = await getImage(good.image!);
      lineList.add(
        pw.Column(
          children: [
            pw.Divider(height: 2),
            pw.Text('Item número: ${index++} Id: ${good.id!}'),
            pw.Divider(height: 2),
            pw.Row(
              // mainAxisAlignment: pw.MainAxisAlignment.center,
              // crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: <pw.Widget>[
                pw.Text(good.name),
                pw.SizedBox(width: 10),
                pw.Text(good.ownership),
                pw.SizedBox(width: 10),
                pw.Text(good.room),
              ],
            ),
            pw.SizedBox(width: 10),
            pw.Row(
              children: [
                pw.Image(
                  image,
                  width: 150,
                  height: 150,
                ),
                pw.SizedBox(width: 30),
                pw.BarcodeWidget(
                  data: good.id!,
                  width: 40,
                  height: 40,
                  barcode: pw.Barcode.qrCode(),
                  drawText: false,
                ),
                pw.SizedBox(width: 20),
                pw.BarcodeWidget(
                  data: good.id!,
                  width: 100,
                  height: 100,
                  barcode: pw.Barcode.qrCode(),
                  drawText: false,
                ),
                pw.SizedBox(width: 20),
                pw.BarcodeWidget(
                  data: good.id!,
                  width: 150,
                  height: 150,
                  barcode: pw.Barcode.qrCode(),
                  drawText: false,
                ),
                pw.SizedBox(width: 10),
              ],
            ),
            // pw.Divider(height: 2),
            pw.SizedBox(height: 10),
          ],
        ),
      );
    }

    return lineList;
  }
}
