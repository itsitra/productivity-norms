import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard-2.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);
  @override
  State<Dash> createState() => _Dash();
}

String warn = "";

class _Dash extends State<Dash> {
  TextEditingController c2 = TextEditingController();
  FocusNode _focusNode = FocusNode();
  var val = "-1";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height; //781.09
    double screenheight = MediaQuery.of(context).size.width; //392.7
    print(screenWidth);
    print(screenheight);
    double heightconv(double arg) {
      return screenWidth * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenheight * (arg / 392.7);
    }

    bool containsOnlyDigits(String input) {
      final parsedValue = int.tryParse(input);
      return parsedValue != null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/dashboard.jpg"),
                      fit: BoxFit.cover)),
            ),
            Column(
              children: [
                SizedBox(
                  height: heightconv(180),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: widthconv(260),
                    child: Text(
                      "Productivity norms for spinning mills",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 68, 146, 132),
                          fontSize: widthconv(26),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightconv(20),
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
                SizedBox(
                  height: heightconv(10),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "     Enter Yarn Specifications ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: widthconv(20),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: heightconv(20),
                ),
                SizedBox(
                  height: heightconv(55),
                  width: widthconv(300),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 68, 146, 132),
                    ),
                    style:
                        TextStyle(color: Colors.white, fontSize: widthconv(18)),
                    focusColor: const Color.fromARGB(255, 68, 146, 132),
                    dropdownColor: const Color.fromARGB(255, 68, 146, 132),
                    value: val,
                    items: [
                      DropdownMenuItem(
                          value: "-1",
                          child: SizedBox(
                            width: widthconv(250),
                            child: const Opacity(
                              opacity: 0.5,
                              child: Text(
                                "    Yarn type ",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          )),
                      const DropdownMenuItem(value: "1", child: Text(" C ")),
                      const DropdownMenuItem(
                        value: "2",
                        child: Text(" C-Comp "),
                      ),
                      DropdownMenuItem(
                        child: Text(" CH "), //Combed Hoisery
                        value: "3",
                      ),
                      DropdownMenuItem(
                        child: Text(" CH-Comp "),
                        value: "4",
                      ),
                      DropdownMenuItem(
                        child: Text(" C-HT "),
                        value: "5",
                      ),
                      DropdownMenuItem(
                        child: Text(" K "), //Carded
                        value: "6",
                      ),
                      DropdownMenuItem(
                        child: Text(" KH "),
                        value: "7",
                      ),
                      DropdownMenuItem(
                        child: Text(" K-HT "),
                        value: "8",
                      ),
                      DropdownMenuItem(
                        child: Text(" PC "), //Polyester Cotton
                        value: "9",
                      ),
                      DropdownMenuItem(
                        child: Text(" PC-C "),
                        value: "10",
                      ),
                      DropdownMenuItem(
                        child: Text(" PC-CH "),
                        value: "11",
                      ),
                      DropdownMenuItem(
                        child: Text(" PC-C-HT "),
                        value: "12",
                      ),
                      DropdownMenuItem(
                        child: Text(" PC-H "),
                        value: "13",
                      ),
                      DropdownMenuItem(
                        child: Text(" PC-HT "),
                        value: "14",
                      ),
                      DropdownMenuItem(
                        child: Text(" PSF "), //Polyester Staple Fibre
                        value: "15",
                      ),
                      DropdownMenuItem(
                        child: Text(" PSF-HT "),
                        value: "16",
                      ),
                      DropdownMenuItem(
                        child: Text(" PV "), //Polyester Viscose
                        value: "17",
                      ),
                      DropdownMenuItem(
                        child: Text(" PV-HT "),
                        value: "18",
                      ),
                      DropdownMenuItem(
                        child: Text(" VSF "), //Viscose Staple Fibre
                        value: "19",
                      ),
                      DropdownMenuItem(
                        child: Text(" VSF-HT "),
                        value: "20",
                      ),
                    ],
                    onChanged: (v) {
                      setState(() {
                        val = v.toString();
                        _focusNode.requestFocus();
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: widthconv(300),
                    child: TextField(
                      focusNode: _focusNode,
                      controller: c2,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: widthconv(16)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 68, 146,
                            132), // Specify the desired color here
                        hintText: "Enter count",
                        hintStyle: TextStyle(
                            fontSize: widthconv(18),
                            color: Colors.white.withOpacity(0.5),
                            fontStyle: FontStyle.italic),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(
                  height: heightconv(10),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: widthconv(100),
                    child: ElevatedButton(
                      onPressed: () {
                        _focusNode.unfocus();
                        if (containsOnlyDigits(c2.text)) {
                        } else if (c2.text != "") {
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
                        if (c2.text == "" || val == "" || val == "-1") {
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
                          if (val == "1" &&
                              (int.parse(c2.text) > 120 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 120";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "2" &&
                              (int.parse(c2.text) > 120 ||
                                  int.parse(c2.text) < 16)) {
                            warn = "Select count between 16 & 120";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "3" &&
                              (int.parse(c2.text) > 60 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 60";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "4" &&
                              (int.parse(c2.text) > 60 ||
                                  int.parse(c2.text) < 16)) {
                            warn = "Select count between 16 & 60";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "5" &&
                              (int.parse(c2.text) > 100 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 100";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "6" &&
                              (int.parse(c2.text) > 100 ||
                                  int.parse(c2.text) < 6)) {
                            warn = "Select count between 6 & 100";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "7" &&
                              (int.parse(c2.text) > 60 ||
                                  int.parse(c2.text) < 16)) {
                            warn = "Select count between 16 & 60";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "8" &&
                              (int.parse(c2.text) > 70 ||
                                  int.parse(c2.text) < 16)) {
                            warn = "Select count between 16 & 70";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "9" &&
                              (int.parse(c2.text) > 100 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 100";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "10" &&
                              (int.parse(c2.text) > 100 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 100";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "11" &&
                              (int.parse(c2.text) != 14 &&
                                  int.parse(c2.text) != 16 &&
                                  int.parse(c2.text) != 18 &&
                                  int.parse(c2.text) != 20 &&
                                  int.parse(c2.text) != 24 &&
                                  int.parse(c2.text) != 26 &&
                                  int.parse(c2.text) != 30 &&
                                  int.parse(c2.text) != 34 &&
                                  int.parse(c2.text) != 36 &&
                                  int.parse(c2.text) != 38 &&
                                  int.parse(c2.text) != 40 &&
                                  int.parse(c2.text) != 45 &&
                                  int.parse(c2.text) != 60 &&
                                  int.parse(c2.text) != 80)) {
                            warn =
                                "Select count as 14,16,18,20,24,26,30,34,36,\n38,40,45,60 or 80";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "12" &&
                              (int.parse(c2.text) != 50 &&
                                  int.parse(c2.text) != 55 &&
                                  int.parse(c2.text) != 60 &&
                                  int.parse(c2.text) != 62 &&
                                  int.parse(c2.text) != 64 &&
                                  int.parse(c2.text) != 66 &&
                                  int.parse(c2.text) != 84)) {
                            warn = "Select count as 50,55,60,62,64,66 or 84";
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "13" &&
                              (int.parse(c2.text) != 14 &&
                                  int.parse(c2.text) != 18 &&
                                  int.parse(c2.text) != 20 &&
                                  int.parse(c2.text) != 24 &&
                                  int.parse(c2.text) != 26 &&
                                  int.parse(c2.text) != 30 &&
                                  int.parse(c2.text) != 34 &&
                                  int.parse(c2.text) != 36 &&
                                  int.parse(c2.text) != 38 &&
                                  int.parse(c2.text) != 40 &&
                                  int.parse(c2.text) != 45 &&
                                  int.parse(c2.text) != 60 &&
                                  int.parse(c2.text) != 80)) {
                            warn =
                                "Select count as 14,18,20,24,26,30,34,36,38,\n40,45,60 or 80"; //PC-H
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "14" &&
                              (int.parse(c2.text) != 50 &&
                                  int.parse(c2.text) != 55 &&
                                  int.parse(c2.text) != 60 &&
                                  int.parse(c2.text) != 62 &&
                                  int.parse(c2.text) != 64 &&
                                  int.parse(c2.text) != 84)) {
                            warn =
                                "Select count as 50,55,60,62,64 or 84"; //PC-HT
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "15" &&
                              (int.parse(c2.text) > 80 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 80"; //PSF
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "16" &&
                              (int.parse(c2.text) != 20 &&
                                  int.parse(c2.text) != 24 &&
                                  int.parse(c2.text) != 30 &&
                                  int.parse(c2.text) != 45 &&
                                  int.parse(c2.text) != 50 &&
                                  int.parse(c2.text) != 55 &&
                                  int.parse(c2.text) != 60 &&
                                  int.parse(c2.text) != 80)) {
                            warn =
                                "Select count as 20,24,30,45,50,55,60 or 80"; //PSF-HT
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "17" &&
                              (int.parse(c2.text) > 90 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 90"; //PV
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "18" &&
                              (int.parse(c2.text) != 24 &&
                                  int.parse(c2.text) != 30 &&
                                  int.parse(c2.text) != 40 &&
                                  int.parse(c2.text) != 45 &&
                                  int.parse(c2.text) != 50 &&
                                  int.parse(c2.text) != 55 &&
                                  int.parse(c2.text) != 60 &&
                                  int.parse(c2.text) != 80)) {
                            warn =
                                "Select count as 24,30,40,45,50,55,60 or 80"; //PV-HT
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "19" &&
                              (int.parse(c2.text) > 80 ||
                                  int.parse(c2.text) < 10)) {
                            warn = "Select count between 10 & 80"; //VSF
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          if (val == "20" &&
                              (int.parse(c2.text) != 20 &&
                                  int.parse(c2.text) != 24 &&
                                  int.parse(c2.text) != 30 &&
                                  int.parse(c2.text) != 40 &&
                                  int.parse(c2.text) != 45 &&
                                  int.parse(c2.text) != 50 &&
                                  int.parse(c2.text) != 55 &&
                                  int.parse(c2.text) != 60 &&
                                  int.parse(c2.text) != 80)) {
                            warn =
                                "Select count as 20,24,30,40,45,50,55,60 or 80"; //PV-HT
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text(warn),
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
                          warn = "";
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  d2(yarncode: val, count: c2.text)));
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
                            color: Colors.black, fontSize: widthconv(17)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightconv(10),
                ),
                SizedBox(
                  height: heightconv(40),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: widthconv(300),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: widthconv(15)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightconv(195.2725),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: widthconv(314.16),
                      child: Text(
                        """C-Combed | H-Hoisery | K-Carded | Comp-Compact | PC-Polyester Cotton | HT-High Twist | PSF-Polyester Staple Fibre | PV-Polyester Viscose | VSF-Viscose Staple Fibre""",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: widthconv(10)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
