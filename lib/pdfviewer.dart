import 'package:flutter/material.dart';

class PDFScreen extends StatelessWidget {
  int pdfcode;
  PDFScreen({super.key, required this.pdfcode});
  List<String> titles = [
    'Standard Work Assignment',
    'Standard Work Assignment'
  ];
  List urls = [
    [
      'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fstandard_workassn_synthetic.jpg?alt=media&token=19be31f2-7623-4635-bc13-4b4427eaca10'
    ],
    [
      'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fstandard_workassn_cotton.jpg?alt=media&token=79ad902d-9df5-43b8-983a-6a0c10543e01'
    ]
  ];
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double heightconv(double arg) {
      return screenheight * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenWidth * (arg / 392.7);
    }

    List<String> selectedurls = urls[pdfcode];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            titles[pdfcode],
            style: TextStyle(fontSize: widthconv(18)),
          ),
          backgroundColor: const Color.fromARGB(255, 68, 146, 132),
        ),
        body: ListView.builder(
          itemCount: selectedurls.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Image.network(selectedurls[index]),
            );
          },
        ));
  }
}
