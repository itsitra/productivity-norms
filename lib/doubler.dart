import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:test/spinplan.dart';
import 'doublerres.dart';

class doubler extends StatefulWidget {
  String yarn, count;
  doubler({super.key, required this.yarn, required this.count});
  @override
  State<doubler> createState() => _doubler(yarn: yarn, count: count);
}

List<List<String>> spindletext = [
  ['', '', ''],
  ['', '', ''],
  ['', '', '']
];
String ton1 = '';
String ton12 = '';
String ton2 = '';
String ton21 = '';
String tolon = '';

class _doubler extends State<doubler> {
  String yarn, count;
  _doubler({required this.yarn, required this.count});
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
  var val2 = "1";
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

    List<String> actionlist = ['SITRA standards'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Doubler winding",
          style: TextStyle(fontSize: widthconv(18)),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == actionlist[0]) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        backgroundColor: Colors
                            .transparent, // Make the background transparent
                        insetPadding: EdgeInsets.zero,
                        content: InteractiveViewer(
                            child: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fdoubler_winding_productivity_stds.jpg?alt=media&token=5beffa6b-0381-4c2d-81c3-7b47919b0e20')));
                  },
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return actionlist.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList();
            },
          ),
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
              SizedBox(
                height: heightconv(39),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "    " + "2/" + widget.count + "s" + " " + widget.yarn,
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
                            'Drums/ tenter   ',
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
                            'Average. winding-on speed (mpm)',
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
                            'Feed cone weight (g)',
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
                            'Delivery cheese weight (g)',
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
                            'Breaks/1 lakh metre',
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
                            'Type of joining (K - Knotting ; S - Splicing)',
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
                    SizedBox(
                      height: heightconv(50),
                      width: widthconv(100),
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 68, 146, 132),
                        ),
                        style: TextStyle(
                            color: Colors.white, fontSize: widthconv(16)),
                        focusColor: const Color.fromARGB(255, 68, 146, 132),
                        dropdownColor: const Color.fromARGB(255, 68, 146, 132),
                        value: val2,
                        items: [
                          DropdownMenuItem(
                            child: Text("    K"), // Combed
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text("    S"), // Combed
                            value: "2",
                          )
                        ],
                        onChanged: (v) {
                          setState(() {
                            val2 = v.toString();
                          });
                          print(val2);
                        },
                      ),
                    ),
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
                          c5.text != '') {
                        if (containsOnlyDigits(c1.text) &&
                            containsOnlyDigits(c2.text) &&
                            containsOnlyDigits(c3.text) &&
                            containsOnlyDigits(c4.text) &&
                            containsOnlyDigits(c5.text)) {
                          if (double.parse(c1.text) < 0 ||
                              double.parse(c1.text) > 500) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text("Drums/tenter out of range"),
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
                          } else if (double.parse(c2.text) < 50 ||
                              double.parse(c2.text) > 2000) {
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
                                      "Average winding-on speed(mpm) out of range"),
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
                          } else if (double.parse(c3.text) < 200 ||
                              double.parse(c3.text) > 5000) {
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
                                      Text("Feed cone weight (g) out of range"),
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
                          } else if (double.parse(c4.text) < 200 ||
                              double.parse(c4.text) > 5000) {
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
                                      "Delivery cheese weight (g) out of range"),
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
                              double.parse(c5.text) > 100) {
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
                                      Text("Breaks/1 lakh metre out of range"),
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
                        String temp1 = c1.text;
                        String temp2 = c2.text;
                        String temp3 = c3.text;
                        String temp4 = c4.text;
                        String temp5 = c5.text;
                        String temp6 = '';
                        if (val2 == '1') {
                          temp6 = 'K';
                        }
                        if (val2 == '2') {
                          temp6 = 'S';
                        }
                        List<String> lhs = [];
                        List<String> rhs = [];
                        var mapnames, mapvalues;
                        var dio = Dio();
                        var data = await dio.get(
                            "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_dwg_productivity/$count/$temp1/$temp2/$temp3/$temp4/$temp5/$temp6/");
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
                          ton1 = lhs[0];
                          ton2 = lhs[1];
                          ton12 = rhs[0];
                          ton21 = rhs[1];
                          tolon = ':';
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
                            ton1.toString(),
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
                              tolon.toString(),
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
                              ton12.toString(),
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
                            ton2.toString(),
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
                              tolon.toString(),
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
                              ton21.toString(),
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
