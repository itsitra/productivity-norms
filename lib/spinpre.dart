import 'dart:convert';
import 'spinplan.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard-2.dart';

String warn = "";

class prespin extends StatelessWidget {
  String yarn, count, rate;
  prespin(
      {super.key, required this.yarn, required this.count, required this.rate});
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    print(rate);
    double screenWidth = MediaQuery.of(context).size.height;
    double screenheight = MediaQuery.of(context).size.width;
    double heightconv(double arg) {
      return screenWidth * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenheight * (arg / 392.7);
    }

    bool containsOnlyDigits(String input) {
      final parsedValue = double.tryParse(input);
      return parsedValue != null;
    }

    Widget body() {
      if (rate == "0" && yarn != "PSF" && yarn[0] == "P") {
        return Column(
          children: [
            SizedBox(
              height: (screenWidth / 4),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Number of ring spindles allotted :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c3,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Spindles Assigned :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Spindle utilization (%) :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c4,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter utilization :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Ring frame production rate (g/spl./8 hrs.)",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c5,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Production Rate :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Enter the blend proportion of Polyester :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c2,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Proportion :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            SizedBox(
              height: heightconv(20),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: widthconv(100),
                child: ElevatedButton(
                  onPressed: () async {
                    _focusNode.unfocus();

                    if (c2.text == "" ||
                        c3.text == "" ||
                        c4.text == "" ||
                        c5.text == "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Warning',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0)),
                            ),
                            content: Text("Enter required inputs"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Perform an action when the "Close" button is pressed
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    } else {
                      if (containsOnlyDigits(c2.text) &&
                          containsOnlyDigits(c3.text) &&
                          containsOnlyDigits(c4.text) &&
                          containsOnlyDigits(c5.text)) {
                        if (double.parse(c3.text) < 100 ||
                            double.parse(c3.text) > 1000000) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("No. of spindles out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c4.text) < 1 ||
                            double.parse(c4.text) > 100) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text(
                                    "Spindle utilization (%) out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c5.text) < 1 ||
                            double.parse(c5.text) > 10000) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("Production rate out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c2.text) < 1 ||
                            double.parse(c2.text) > 99) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("Blend proportion out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Warning',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0)),
                              ),
                              content:
                                  Text("No special characters are allowed"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Perform an action when the "Close" button is pressed
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      print("clk");
                      List<String> lhs = ["Department"];
                      List<String> rhs = ["Nos"];
                      List<String> rhs2 = ["Production rate"];
                      var mapnames, mapvalues, mapv2;
                      var dio = Dio();
                      var spinc = c2.text;
                      var temp1 = c3.text;
                      var temp2 = c4.text;
                      var temp3 = c5.text;
                      var data = await dio.get(
                          "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_spin_plan/$count/$yarn/$spinc/$temp1/$temp2/$temp3/");
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => spin(
                              left: lhs,
                              right: rhs,
                              yarn: yarn,
                              count: count,
                              stdcode: c3.text)));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(148, 0, 0,
                            0)), // Specify the desired button color here
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: widthconv(17)),
                  ),
                ),
              ),
            ),
          ],
        );
      }
      if (yarn != "PSF" && yarn[0] == "P" && rate != "0") {
        print("triggered");
        return Column(
          children: [
            SizedBox(
              height: (screenWidth / 4),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Number of ring spindles allotted :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c3,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Spindles Assigned :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Spindle utilization (%) :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c4,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter utilization :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Ring frame production rate (g/spl./8 hrs.)",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(25),
                width: widthconv(50),
                child: Text(
                  rate,
                  style: TextStyle(
                      fontSize: widthconv(18), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Enter the blend proportion of Polyester :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c2,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Proportion :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            SizedBox(
              height: heightconv(20),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: widthconv(100),
                child: ElevatedButton(
                  onPressed: () async {
                    _focusNode.unfocus();

                    if (c2.text == "" || c3.text == "" || c4.text == "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Warning',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0)),
                            ),
                            content: Text("Enter required inputs"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Perform an action when the "Close" button is pressed
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    } else {
                      if (containsOnlyDigits(c3.text) &&
                          containsOnlyDigits(c4.text) &&
                          containsOnlyDigits(c2.text)) {
                        if (double.parse(c3.text) < 100 ||
                            double.parse(c3.text) > 1000000) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("No. of spindles out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c4.text) < 1 ||
                            double.parse(c4.text) > 100) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text(
                                    "Spindle utilization (%) out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c2.text) < 1 ||
                            double.parse(c2.text) > 99) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("Blend proportion out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Warning',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0)),
                              ),
                              content:
                                  Text("No special characters are allowed"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Perform an action when the "Close" button is pressed
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      print("clk");
                      List<String> lhs = ["Department"];
                      List<String> rhs = ["Nos"];
                      List<String> rhs2 = ["Production rate"];
                      var mapnames, mapvalues, mapv2;
                      var dio = Dio();
                      var spinc = c2.text;
                      var temp1 = c3.text;
                      var temp2 = c4.text;
                      var temp3 = c5.text;
                      var data = await dio.get(
                          "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_spin_plan/$count/$yarn/$spinc/$temp1/$temp2/$rate/");
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => spin(
                              left: lhs,
                              right: rhs,
                              yarn: yarn,
                              count: count,
                              stdcode: c3.text)));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(148, 0, 0,
                            0)), // Specify the desired button color here
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: widthconv(17)),
                  ),
                ),
              ),
            ),
          ],
        );
      }
      if (rate != "0") {
        return Column(
          children: [
            SizedBox(
              height: (screenWidth / 4),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Number of ring spindles allotted :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c3,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Spindles Assigned :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Spindle utilization (%) :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c4,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter utilization :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Ring frame production rate (g/spl./8 hrs.)",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: heightconv(25),
                  width: widthconv(50),
                  child: Text(
                    rate,
                    style: TextStyle(
                        fontSize: widthconv(18), fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: heightconv(20),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: widthconv(100),
                child: ElevatedButton(
                  onPressed: () async {
                    _focusNode.unfocus();

                    if (c3.text == "" || c4.text == "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Warning',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0)),
                            ),
                            content: Text("Enter required inputs"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Perform an action when the "Close" button is pressed
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    } else {
                      if (containsOnlyDigits(c3.text) &&
                          containsOnlyDigits(c4.text)) {
                        if (double.parse(c3.text) < 100 ||
                            double.parse(c3.text) > 1000000) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("No. of spindles out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c4.text) < 1 ||
                            double.parse(c4.text) > 100) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text(
                                    "Spindle utilization (%) out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Warning',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0)),
                              ),
                              content:
                                  Text("No special characters are allowed"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Perform an action when the "Close" button is pressed
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      print("clk");
                      List<String> lhs = ["Department"];
                      List<String> rhs = ["Nos"];
                      List<String> rhs2 = ["Production rate"];
                      var mapnames, mapvalues, mapv2;
                      var dio = Dio();
                      var spinc = c2.text;
                      var temp1 = c3.text;
                      var temp2 = c4.text;
                      var temp3 = c5.text;
                      var data = await dio.get(
                          "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_spin_plan/$count/$yarn/0/$temp1/$temp2/$rate/");
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => spin(
                              left: lhs,
                              right: rhs,
                              yarn: yarn,
                              count: count,
                              stdcode: c3.text)));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(148, 0, 0,
                            0)), // Specify the desired button color here
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: widthconv(17)),
                  ),
                ),
              ),
            ),
          ],
        );
      }
      if (rate == "0") {
        return Column(
          children: [
            SizedBox(
              height: (screenWidth / 4),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Number of ring spindles allotted :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c3,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Spindles Assigned :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Spindle utilization (%) :",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c4,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter utilization :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "      Ring frame production rate (g/spl./8 hrs.)",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: widthconv(17),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: heightconv(10),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: heightconv(45),
                width: widthconv(300),
                child: TextField(
                  autofocus: true,
                  //focusNode: _focusNode,
                  controller: c5,
                  inputFormatters: [LengthLimitingTextInputFormatter(8)],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.white, fontSize: widthconv(16)),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(
                        255, 68, 146, 132), // Specify the desired color here
                    hintText: 'Enter Production Rate :',
                    hintStyle: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(
              height: heightconv(20),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: widthconv(100),
                child: ElevatedButton(
                  onPressed: () async {
                    _focusNode.unfocus();

                    if (c3.text == "" || c4.text == "" || c5.text == "") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Warning',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0)),
                            ),
                            content: Text("Enter required inputs"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Perform an action when the "Close" button is pressed
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    } else {
                      if (containsOnlyDigits(c3.text) &&
                          containsOnlyDigits(c4.text) &&
                          containsOnlyDigits(c5.text)) {
                        if (double.parse(c3.text) < 100 ||
                            double.parse(c3.text) > 1000000) {
                          print("triger");
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("No. of spindles out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c4.text) < 1 ||
                            double.parse(c4.text) > 100) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text(
                                    "Spindle utilization (%) out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        } else if (double.parse(c5.text) < 1 ||
                            double.parse(c5.text) > 10000) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Warning',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                content: Text("Production rate out of range"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      // Perform an action when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Warning',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0)),
                              ),
                              content:
                                  Text("No special characters are allowed"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Perform an action when the "Close" button is pressed
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }
                      print("clk");
                      List<String> lhs = ["Department"];
                      List<String> rhs = ["Nos"];
                      List<String> rhs2 = ["Production rate"];
                      var mapnames, mapvalues, mapv2;
                      var dio = Dio();
                      var spinc = c2.text;
                      var temp1 = c3.text;
                      var temp2 = c4.text;
                      var temp3 = c5.text;
                      var data = await dio.get(
                          "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_spin_plan/$count/$yarn/0/$temp1/$temp2/$temp3/");
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => spin(
                              left: lhs,
                              right: rhs,
                              yarn: yarn,
                              count: count,
                              stdcode: c3.text)));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(148, 0, 0,
                            0)), // Specify the desired button color here
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: widthconv(17)),
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return Column();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Stack(
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
                  height: screenWidth / 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "    " + count + "s" + " " + yarn + " Spin Plan",
                    style: TextStyle(
                        color: Color.fromARGB(255, 68, 146, 132),
                        fontSize: widthconv(25),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "     ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: widthconv(20),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            body()
          ],
        ),
      ),
    );
  }
}
