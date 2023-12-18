import 'cf2.dart';
import 'cf.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class precf extends StatelessWidget {
  String yarn, count;
  precf({super.key, required this.yarn, required this.count});
  var val = '-1';
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
                  "    Standard HOK and \n    Conversion factors\n\n " +
                      "   " +
                      count +
                      "s" +
                      " " +
                      yarn,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 3, 3),
                      fontSize: widthconv(20),
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
                      List<String> lhs = [];
                      List<String> rhs = [];
                      List<String> rhs1 = [];
                      var mapnames, mapvalues;
                      var dio = Dio();
                      var data = await dio.get(
                          "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_conv_factors/$count/$yarn/");
                      var map = jsonDecode(data.data.toString());
                      String names = jsonEncode(map["name"]);
                      mapnames = jsonDecode(names);
                      mapnames.forEach((key, value) {
                        lhs.add(value.toString());
                      });
                      String values = jsonEncode(map["value"]);
                      mapvalues = jsonDecode(values);
                      mapvalues.forEach((key, value) {
                        rhs.add(value.toString());
                      });
                      String values1 = jsonEncode(map["value1"]);
                      mapvalues = jsonDecode(values1);
                      mapvalues.forEach((key, value) {
                        rhs1.add(value.toString());
                      });
                      List<String> lhstemp = [];
                      lhstemp.add(lhs[0]);
                      lhstemp.add(lhs[1]);
                      lhstemp.add("Category");
                      for (int i = 2; i < rhs.length; i++) {
                        lhstemp.add(lhs[i]);
                      }
                      List<String> rhstemp = [];
                      rhstemp.add(rhs[0]);
                      rhstemp.add(rhs[1]);
                      rhstemp.add("Std. Conv. Factor");
                      for (int i = 2; i < rhs.length; i++) {
                        rhstemp.add(rhs[i]);
                      }
                      List<String> rhs1temp = [];
                      rhs1temp.add(rhs1[0]);
                      rhs1temp.add(rhs1[1]);
                      rhs1temp.add("Standard HOK");
                      for (int i = 2; i < rhs1.length; i++) {
                        rhs1temp.add(rhs1[i]);
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Temp(
                              left: lhstemp,
                              right: rhstemp,
                              right1: rhs1temp,
                              yarn: yarn,
                              count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: const Text(
                      'Up to ring frames ',
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Automatic cone winding :',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: SizedBox(
                              height: heightconv(160),
                              width: widthconv(300),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Count : $count / Yarn type : $yarn",
                                      style: TextStyle(
                                          fontSize: widthconv(18),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightconv(15),
                                  ),
                                  SizedBox(
                                      height: heightconv(50),
                                      width: widthconv(260),
                                      child: DropdownButtonFormField(
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor:
                                              Color.fromARGB(255, 68, 146, 132),
                                        ),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: widthconv(16)),
                                        focusColor: const Color.fromARGB(
                                            255, 68, 146, 132),
                                        dropdownColor: const Color.fromARGB(
                                            255, 68, 146, 132),
                                        value: val,
                                        items: const [
                                          DropdownMenuItem(
                                            value: "-1",
                                            child: Opacity(
                                              opacity: 0.5,
                                              child: Text(
                                                "Enter single or doubled yarn",
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                              value: "1",
                                              child: Text(" Single ")),
                                          DropdownMenuItem(
                                              value: "2",
                                              child: Text(" Double "))
                                        ],
                                        onChanged: (v) {
                                          print("changed");
                                          val = v.toString();
                                        },
                                      )),
                                  SizedBox(
                                    height: heightconv(10),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: widthconv(100),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (val != '-1') {
                                            print(val);
                                            String temp1 = val;
                                            int step =
                                                (int.parse(count) % 2 != 0)
                                                    ? int.parse(count) - 1
                                                    : 0;
                                            String temp2 = step.toString();
                                            int step2 =
                                                (int.parse(count) % 2 != 0)
                                                    ? int.parse(count) + 1
                                                    : 0;
                                            String temp3 = step.toString();
                                            print(temp2);
                                            List<String> lhs = ["Category"];
                                            List<String> rhs = ["Standard HOK"];
                                            List<String> rhs1 = [
                                              "Standard Conversion Factor"
                                            ];
                                            var mapnames, mapvalues, mapvalues1;
                                            var dio = Dio();
                                            var data = await dio.get(
                                                "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_ac_conv_factors/$count/$val/");
                                            var map = jsonDecode(
                                                data.data.toString());
                                            String names =
                                                jsonEncode(map["name"]);
                                            mapnames = jsonDecode(names);
                                            mapnames.forEach((key, value) {
                                              lhs.add(value.toString());
                                            });
                                            String values =
                                                jsonEncode(map["value"]);
                                            mapvalues = jsonDecode(values);
                                            mapvalues.forEach((key, value) {
                                              rhs.add(value.toString());
                                            });
                                            String values1 =
                                                jsonEncode(map["value1"]);
                                            mapvalues1 = jsonDecode(values1);
                                            mapvalues1.forEach((key, value) {
                                              rhs1.add(value.toString());
                                            });
                                            /*if (int.parse(count) % 2 != 0) {
                                              String names =
                                                  jsonEncode(map["name1"]);
                                              mapnames = jsonDecode(names);
                                              mapnames.forEach((key, value) {
                                                lhs.add(value.toString());
                                              });
                                              String values =
                                                  jsonEncode(map["value1"]);
                                              mapvalues = jsonDecode(values);
                                              mapvalues.forEach((key, value) {
                                                rhs.add(value.toString());
                                              });
                                            }*/
                                            print(lhs);
                                            print(rhs);
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) => cf2(
                                                          left: lhs,
                                                          right: rhs,
                                                          right1: rhs1,
                                                          yarn: yarn,
                                                          count: count,
                                                          chk: val,
                                                        )));
                                          }
                                          //Navigator.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(const Color.fromARGB(
                                                  171,
                                                  0,
                                                  0,
                                                  0)), // Specify the desired button color here
                                        ),
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: widthconv(17)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Automatic cone winding',
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
