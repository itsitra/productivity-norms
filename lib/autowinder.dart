import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:test/spinplan.dart';

class autowind extends StatefulWidget {
  String yarn, count;
  autowind({super.key, required this.yarn, required this.count});
  @override
  State<autowind> createState() => _autowind(yarn: yarn, count: count);
}

List<List<String>> spindletext = [
  ['', '', ''],
  ['', '', ''],
  ['', '', '']
];

String pon1 = '';
String pon12 = '';
String pon2 = '';
String pon21 = '';
String pon3 = '';
String pon31 = '';
String pon4 = '';
String pon41 = '';
String pon5 = '';
String pon51 = '';
String polon = '';

class _autowind extends State<autowind> {
  String yarn, count;
  _autowind({required this.yarn, required this.count});

  final TextEditingController c1 = TextEditingController();
  final TextEditingController c2 = TextEditingController();
  final TextEditingController c3 = TextEditingController();
  final TextEditingController c4 = TextEditingController();
  final TextEditingController c5 = TextEditingController();
  final TextEditingController c6 = TextEditingController();
  final TextEditingController c7 = TextEditingController();
  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();
  final FocusNode f4 = FocusNode();
  final FocusNode f5 = FocusNode();
  final FocusNode f6 = FocusNode();
  final FocusNode f7 = FocusNode();
  var val = "-1";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isChecked = false;
    String actbreak = '';
    double heightconv(double arg) {
      return screenHeight * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenWidth * (arg / 392.7);
    }

    bool containsOnlyDigits(String input) {
      final parsedValue = double.tryParse(input);
      return parsedValue != null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Automatic cone winding tenter\nproductivity",
          style: TextStyle(fontSize: widthconv(18)),
        ),
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
              SizedBox(
                height: heightconv(39),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "    " + widget.count + "s" + " " + widget.yarn,
                  style: TextStyle(
                      color: Color.fromARGB(255, 68, 146, 132),
                      fontSize: widthconv(20),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: heightconv(20),
              ),
              SizedBox(
                height: heightconv(50),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            'Average winding-on speed (mpm)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              ':',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: widthconv(100),
                          height: heightconv(40),
                          child: TextField(
                            focusNode: f1,
                            controller: c1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: widthconv(16)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 68, 146,
                                  132), // Specify the desired color here
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(5),
              ),
              SizedBox(
                height: heightconv(50),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            'Clearer cuts per 1 lakh meters',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              ':',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: widthconv(100),
                          height: heightconv(40),
                          child: TextField(
                            focusNode: f2,
                            controller: c2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: widthconv(16)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 68, 146,
                                  132), // Specify the desired color here
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(5),
              ),
              SizedBox(
                height: heightconv(50),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            'Cop content (g)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              ':',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: widthconv(100),
                          height: heightconv(40),
                          child: TextField(
                            focusNode: f3,
                            controller: c3,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 68, 146,
                                  132), // Specify the desired color here
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(5),
              ),
              SizedBox(
                height: heightconv(50),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            'Delivery cone weight (kg)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              ':',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: widthconv(100),
                          height: heightconv(40),
                          child: TextField(
                            focusNode: f4,
                            controller: c4,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: widthconv(16)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 68, 146,
                                  132), // Specify the desired color here
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(5),
              ),
              SizedBox(
                height: heightconv(50),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            'Cop rejection (%)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              ':',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: widthconv(100),
                          height: heightconv(40),
                          child: TextField(
                            focusNode: f5,
                            controller: c5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: widthconv(16)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 68, 146,
                                  132), // Specify the desired color here
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(5),
              ),
              SizedBox(
                height: heightconv(50),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            'Repeater cycles (%)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              ':',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          width: widthconv(100),
                          height: heightconv(40),
                          child: TextField(
                            focusNode: f6,
                            controller: c6,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: widthconv(16)),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 68, 146,
                                  132), // Specify the desired color here
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.number,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(5),
              ),
              SizedBox(
                height: heightconv(15),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: heightconv(35),
                  width: widthconv(300),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (c1.text != '' &&
                          c2.text != '' &&
                          c3.text != '' &&
                          c4.text != '' &&
                          c5.text != '' &&
                          c6.text != '') {
                        if (containsOnlyDigits(c1.text) &&
                            containsOnlyDigits(c2.text) &&
                            containsOnlyDigits(c3.text) &&
                            containsOnlyDigits(c4.text) &&
                            containsOnlyDigits(c5.text) &&
                            containsOnlyDigits(c6.text)) {
                          if (double.parse(c1.text) < 500 ||
                              double.parse(c1.text) > 3000) {
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
                                      Text("Average winding(mpm) out of range"),
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
                          } else if (double.parse(c2.text) < 0 ||
                              double.parse(c2.text) > 300) {
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
                                      "Clearer cuts per 1 lakh meters out of range"),
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
                          } else if (double.parse(c3.text) < 10 ||
                              double.parse(c3.text) > 120) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text("Cop content(g) out of range"),
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
                          } else if (double.parse(c4.text) < 0.5 ||
                              double.parse(c4.text) > 10) {
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
                                      "Delivery cone weight(kg) out of range"),
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
                          } else if (double.parse(c5.text) < 0 ||
                              double.parse(c5.text) > 30) {
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
                                      Text("Cop rejection(%) out of range"),
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
                          } else if (double.parse(c6.text) < 0 ||
                              double.parse(c6.text) > 30) {
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
                                      Text("Repeater cycles(%) out of range"),
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
                        f1.unfocus();
                        f2.unfocus();
                        f3.unfocus();
                        f4.unfocus();
                        f5.unfocus();
                        f6.unfocus();
                        String temp1 = c1.text;
                        String temp2 = c2.text;
                        String temp3 = c3.text;
                        String temp4 = c4.text;
                        String temp5 = c5.text;
                        String temp6 = c6.text;
                        String temp7 = c7.text;
                        List<String> lhs = [];
                        List<String> rhs = [];
                        var mapnames, mapvalues;
                        var dio = Dio();
                        var data = await dio.get(
                            "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_ac_productivity/$count/$temp1/$temp2/$temp3/$temp4/$temp5/$temp6/0/");
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
                        setState(() {
                          pon1 = lhs[0];
                          pon2 = lhs[1];
                          pon3 = lhs[2];
                          pon4 = lhs[3];
                          pon12 = rhs[0];
                          pon21 = rhs[1];
                          pon31 = rhs[2];
                          pon41 = rhs[3];
                          polon = ':';
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Results :',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0),
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
                                        "$pon1   :  $pon12",
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
                                        width: widthconv(200),
                                        child: TextField(
                                          focusNode: f7,
                                          controller: c7,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: widthconv(16)),
                                          decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                                255,
                                                68,
                                                146,
                                                132), // Specify the desired color here
                                            hintText: 'Enter assigned drums ',
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          keyboardType: TextInputType.number,
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
                                            if (c7.text != "" &&
                                                containsOnlyDigits(c7.text)) {
                                              f1.unfocus();
                                              f2.unfocus();
                                              f3.unfocus();
                                              f4.unfocus();
                                              f5.unfocus();
                                              f6.unfocus();
                                              String temp1 = c1.text;
                                              String temp2 = c2.text;
                                              String temp3 = c3.text;
                                              String temp4 = c4.text;
                                              String temp5 = c5.text;
                                              String temp6 = c6.text;
                                              String temp7 = c7.text;
                                              List<String> lhs = [];
                                              List<String> rhs = [];
                                              var mapnames, mapvalues;
                                              var dio = Dio();
                                              var data = await dio.get(
                                                  "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_ac_productivity/$count/$temp1/$temp2/$temp3/$temp4/$temp5/$temp6/$temp7/");
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
                                              setState(() {
                                                pon1 = lhs[0];
                                                pon2 = lhs[1];
                                                pon3 = lhs[2];
                                                pon4 = lhs[3];
                                                pon5 = lhs[4];
                                                pon12 = rhs[0];
                                                pon21 = rhs[1];
                                                pon31 = rhs[2];
                                                pon41 = rhs[3];
                                                pon51 = rhs[4];
                                                polon = ':';
                                              });

                                              Navigator.of(context).pop();
                                            }
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(const Color
                                                        .fromARGB(171, 0, 0,
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
                        ).then((value) {
                          f1.unfocus();
                          f2.unfocus();
                          f3.unfocus();
                          f4.unfocus();
                          f5.unfocus();
                          f6.unfocus();
                          f7.unfocus();
                          // This code will be executed when the dialog is closed
                          print('Dialog closed');
                        });
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
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 255,
                              255)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: widthconv(16),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightconv(10),
              ),
              SizedBox(
                height: heightconv(40),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            pon1.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              polon.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              pon12.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: widthconv(16)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(40),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            pon2.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              polon.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              pon21.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: widthconv(16)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(40),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            pon3.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              polon.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              pon31.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: widthconv(16)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(40),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            pon4.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              polon.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              pon41.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: widthconv(16)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: heightconv(40),
                child: Row(
                  children: [
                    SizedBox(
                      width: widthconv(20),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: screenWidth / 2,
                          child: Text(
                            pon5.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: widthconv(60),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              polon.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              pon51.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: widthconv(16)),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
