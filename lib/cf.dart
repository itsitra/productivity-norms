import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'pdfviewer.dart';
import 'dashboard-2.dart';

class Temp extends StatelessWidget {
  List<String> left, right, right1;
  String yarn, count;
  Temp(
      {super.key,
      required this.left,
      required this.right,
      required this.right1,
      required this.yarn,
      required this.count});
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

    Widget body() {
      if (right.contains(null.toString())) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              """Contents unavailable for selected 
              yarn specifications """,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: widthconv(20),
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      } else {
        return ListView.builder(
          itemCount: left.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: (index > 2) ? heightconv(50) : heightconv(65),
              child: Card(
                color: (index == 2)
                    ? Color.fromARGB(255, 68, 146, 132)
                    : Colors.white,
                child: ListTile(
                    title: Row(
                  children: [
                    SizedBox(
                      width: screenWidth / 3.1,
                      child: Align(
                        alignment: (index == 2)
                            ? Alignment.centerLeft
                            : Alignment.topLeft,
                        child: Text(
                          left[index],
                          style: TextStyle(
                              color: (index == 12)
                                  ? Colors.red
                                  : (index == 2)
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: widthconv(16)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widthconv(10),
                      child: Align(
                        alignment: (index == 2)
                            ? Alignment.center
                            : Alignment.topCenter,
                        child: Text(
                          (index == 0 || index == 1) ? "" : ":",
                          style: TextStyle(
                              color: (index == 12)
                                  ? Colors.red
                                  : (index == 2)
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: widthconv(16)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 4,
                      child: Align(
                        alignment: (index == 2)
                            ? Alignment.center
                            : Alignment.topCenter,
                        child: Text(
                          (index == 0 || index == 1) ? ":" : right1[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: (index == 12)
                                  ? Colors.red
                                  : (index == 2)
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: widthconv(16)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widthconv(10),
                      child: Align(
                        alignment: (index == 2)
                            ? Alignment.center
                            : Alignment.topCenter,
                        child: Text(
                          (index == 0 || index == 1) ? "" : ":",
                          style: TextStyle(
                              color: (index == 12)
                                  ? Colors.red
                                  : (index == 2)
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: widthconv(16)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 3.8,
                      child: Align(
                        alignment: (index == 2)
                            ? Alignment.center
                            : Alignment.topCenter,
                        child: Text(
                          right[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: (index == 12)
                                  ? Colors.red
                                  : (index == 2)
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: widthconv(16)),
                        ),
                      ),
                    )
                  ],
                )),
              ),
            );
          },
        );
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            count + "s" + " " + yarn,
            style: TextStyle(fontSize: widthconv(18)),
          ),
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  if (value == "1") {
                    if (yarn[0] == 'P' || yarn[0] == 'V') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              backgroundColor: Colors
                                  .transparent, // Make the background transparent
                              insetPadding: EdgeInsets.zero,
                              content: InteractiveViewer(
                                  child: Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fstandard_workassn_synthetic.jpg?alt=media&token=19be31f2-7623-4635-bc13-4b4427eaca10')));
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              backgroundColor: Colors
                                  .transparent, // Make the background transparent
                              insetPadding: EdgeInsets.zero,
                              content: InteractiveViewer(
                                  child: Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fstandard_workassn_cotton.jpg?alt=media&token=79ad902d-9df5-43b8-983a-6a0c10543e01')));
                        },
                      );
                    }
                  }
                  if (value == "2") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            child: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/ringframe%2FRing%20frame%20std%20HOK.jpg?alt=media&token=9df9692c-b055-43be-816e-bf939b693e4c&_gl=1*1k93qwf*_ga*MTE1NjA4MTM3Ni4xNjg0NjAzNjk1*_ga_CW55HF8NVT*MTY4NjU4MTA0Ni4xOC4xLjE2ODY1ODM2MTYuMC4wLjA.'),
                          ),
                        );
                      },
                    );
                  }
                  if (value == "3") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            backgroundColor: Colors
                                .transparent, // Make the background transparent
                            insetPadding: EdgeInsets.zero,
                            content: InteractiveViewer(
                                child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fstandard_hok.jpg?alt=media&token=38dd4876-9ad1-4381-8207-ea4e98e28e8a')));
                      },
                    );
                  }
                },
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "1",
                        child: Text('Standard work assignment',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const PopupMenuItem(
                        value: "3",
                        child: Text('Ultra modern mill work assignment',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ])
          ],
          /*leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => d2(yarncode: yarn, count: count)));
              }),*/
          backgroundColor: const Color.fromARGB(255, 68, 146, 132),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/d2.jpg"), fit: BoxFit.cover)),
            ),
            Column(
              children: [
                Expanded(child: body()),
              ],
            )
          ],
        ));
  }
}

Color? highlight(int index) {
  if (index == 1 && index == 2)
    return Colors.red;
  else
    return Colors.black;
}
