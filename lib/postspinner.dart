import 'doubler.dart';
import 'pdfviewer.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'pretfo.dart';

class postspinner extends StatelessWidget {
  String yarn, count;
  postspinner({super.key, required this.yarn, required this.count});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double heightconv(double arg) {
      return screenHeight * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenWidth * (arg / 392.7);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              SizedBox(
                height: screenHeight / 4,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "    " +
                      count +
                      "s" +
                      " " +
                      yarn +
                      " \n\n    Post Spinning Productivity ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 68, 146, 132),
                      fontSize: widthconv(22),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: screenHeight / 10,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: heightconv(50),
                  width: widthconv(300),
                  child: ElevatedButton(
                    onPressed: () async {
                      ton1 = '';
                      ton2 = '';
                      ton12 = '';
                      ton21 = '';
                      tolon = '';
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              doubler(yarn: yarn, count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Doubler winding',
                      style: TextStyle(
                          fontSize: widthconv(16), color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightconv(5),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: heightconv(50),
                  width: widthconv(300),
                  child: ElevatedButton(
                    onPressed: () async {
                      xon1 = '';
                      xon12 = '';
                      xon2 = '';
                      xon21 = '';
                      xon3 = '';
                      xon31 = '';
                      xolon = '';
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              pretfo(yarn: yarn, count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Two for one twister',
                      style: TextStyle(
                          fontSize: widthconv(16), color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
