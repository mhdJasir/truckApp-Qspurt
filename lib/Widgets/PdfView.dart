import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:truckapp/Constants/Constants.dart';
import 'package:truckapp/Widgets/AppBar.dart';

class PdfView extends StatefulWidget {
  const PdfView({Key key}) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  var pdfUrl = "http://www.africau.edu/images/default/sample.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(
        text: 'Trip Pdf', centerText: true,
      ),
      body: SafeArea(
        child: Container(
          padding: basicPadding,
          child: Column(
            children: [
              Container(
                height: height(context) * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500,width: 2)
                ),
                child: SfPdfViewer.network(
                  pdfUrl,
                  onDocumentLoaded: (val){
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





