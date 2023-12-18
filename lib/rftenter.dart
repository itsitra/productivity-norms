import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:test/spinplan.dart';

class rftenter extends StatefulWidget {
  String yarn, count;
  rftenter({super.key, required this.yarn, required this.count});
  @override
  State<rftenter> createState() => _rftenterState(yarn: yarn, count: count);
}

List<List<String>> spindletext = [
  ['', '', ''],
  ['', '', ''],
  ['', '', '']
];

String con1 = '';
String con12 = '';
String con2 = '';
String con21 = '';
String con3 = '';
String con31 = '';
String colon = '';

class _rftenterState extends State<rftenter> {
  String yarn, count;
  _rftenterState({required this.yarn, required this.count});

  final TextEditingController c1 = TextEditingController();
  final TextEditingController c2 = TextEditingController();
  final TextEditingController c3 = TextEditingController();
  final TextEditingController c4 = TextEditingController();
  final TextEditingController c5 = TextEditingController();
  final TextEditingController c6 = TextEditingController();
  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();
  final FocusNode f4 = FocusNode();
  final FocusNode f5 = FocusNode();
  final FocusNode f6 = FocusNode();

  var val = "-1";
  var val2 = "1";
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

    bool containsOnlyDigits(String input) {
      final parsedValue = double.tryParse(input);
      return parsedValue != null;
    }

    //print(containsOnlyDigits("2"));
    bool isChecked = false;
    String actbreak = '';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Ring frame tenter productivity",
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
                height: screenHeight / 15,
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
                height: heightconv(45),
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
                            'Bobbin changing duty :',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
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
                            child: Text("Yes"), // Combed
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text("No"), // Combed
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
                            'Expected Pneumafil waste (%)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
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
                            'Prodn./ spl./ 8 hrs. (g)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
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
                            'Spindles assigned per tenter',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
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
                            'Bobbin content (g)',
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
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
                height: heightconv(15),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: widthconv(300),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (val != '-1' &&
                          c1.text != '' &&
                          c2.text != '' &&
                          c3.text != '' &&
                          c5.text != '') {
                        if (containsOnlyDigits(c1.text) &&
                            containsOnlyDigits(c2.text) &&
                            containsOnlyDigits(c3.text) &&
                            containsOnlyDigits(c5.text)) {
                          if (double.parse(c1.text) < 0 ||
                              double.parse(c1.text) > 20) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Warning',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 0, 0)),
                                  ),
                                  content: Text("Pneumafil waste out of range"),
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
                              double.parse(c2.text) > 10000) {
                            print("trigger");
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
                                      Text("Prodn/spl/8 hrs (g) out of range"),
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
                          } else if (double.parse(c3.text) < 100 ||
                              double.parse(c3.text) > 20000) {
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
                                      "Spindles assigned per tenter out of range"),
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
                          } else if (double.parse(c5.text) < 100 ||
                              double.parse(c5.text) > 3000) {
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
                                      Text("Bobbin content (g) out of range"),
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
                        print(val);
                        print('clicked');
                        c6.text = '';
                        f2.unfocus();
                        f1.unfocus();
                        f3.unfocus();
                        f4.unfocus();
                        f5.unfocus();

                        String temp1 = c1.text;
                        String temp2 = c2.text;
                        String temp3 = c3.text;
                        String temp4 = '0';
                        String temp5 = c5.text;
                        String pattype = '';
                        String duty = '';
                        if (val2 == '1') {
                          duty = 'Yes';
                        }
                        if (val2 == '2') {
                          duty = 'No';
                        }
                        if (val == '1') {
                          pattype = 'Normal';
                        }
                        if (val == '2') {
                          pattype = 'ZigZag';
                        }
                        print(
                            "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_rftenter_productivity/$count/$yarn/$pattype/$temp1/$temp2/$temp3/$temp4/$temp5/5/");
                        List<String> lhs = [];
                        List<String> rhs = [];
                        var mapnames, mapvalues;
                        var dio = Dio();
                        var data = await dio.get(
                            "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_rftenter_productivity/$count/$yarn/$pattype/$temp1/$temp2/$temp3/$temp4/$temp5/0/$val2");
                        var map = jsonDecode(data.data.toString());

                        String values = jsonEncode(map["value"]);
                        mapvalues = jsonDecode(values);
                        mapvalues.forEach((key, value) {
                          rhs.add(value.toString());
                        });
                        print(
                            "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_rftenter_productivity/$count/$yarn/$pattype/$temp1/$temp2/$temp3/$temp4/$temp5/5/");
                        actbreak = rhs[0].toString();

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
                                        "Expected breaks   :  $actbreak",
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
                                          focusNode: f6,
                                          controller: c6,
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
                                            hintText: 'Enter actual breaks ',
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
                                            if (c6.text != "" &&
                                                containsOnlyDigits(c6.text)) {
                                              f1.unfocus();
                                              f2.unfocus();
                                              f3.unfocus();
                                              f4.unfocus();
                                              f5.unfocus();
                                              f6.unfocus();
                                              String temp1 = c1.text;
                                              String temp2 = c2.text;
                                              String temp3 = c3.text;
                                              String temp4 = '0';
                                              String temp5 = c5.text;
                                              String pattype = '';
                                              String duty = '';
                                              if (val2 == '1') {
                                                duty = 'Yes';
                                              }
                                              if (val2 == '2') {
                                                duty = 'No';
                                              }
                                              if (val == '1') {
                                                pattype = 'Normal';
                                              }
                                              if (val == '2') {
                                                pattype = 'ZigZag';
                                              }
                                              String temp6 = c6.text;
                                              print(
                                                  "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_rftenter_productivity/$count/$yarn/$pattype/$temp1/$temp2/$temp3/$temp4/$temp5/$temp6/");
                                              List<String> lhs = [];
                                              List<String> rhs = [];
                                              var mapnames, mapvalues;
                                              var dio = Dio();
                                              var data = await dio.get(
                                                  "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_rftenter_productivity/$count/$yarn/$pattype/$temp1/$temp2/$temp3/$temp4/$temp5/$temp6/$val2");
                                              var map = jsonDecode(
                                                  data.data.toString());

                                              String values =
                                                  jsonEncode(map["value"]);
                                              mapvalues = jsonDecode(values);
                                              mapvalues.forEach((key, value) {
                                                rhs.add(value.toString());
                                              });
                                              print(
                                                  "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_rftenter_productivity/$count/$yarn/$pattype/$temp1/$temp2/$temp3/$temp4/$temp5/5/");

                                              setState(() {
                                                con1 = 'Expected breaks';
                                                con12 = actbreak;
                                                con2 = 'Actual breaks';
                                                con21 = c6.text;
                                                con3 = 'Spindles assignable';
                                                con31 = rhs[1];
                                                colon = ':';
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
                        );
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
                          color: Colors.black, fontSize: widthconv(17)),
                    ),
                  ),
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
                            con1.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              colon.toString(),
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
                              con12,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ],
                ),
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
                            con2.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              colon.toString(),
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
                              con21.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ],
                ),
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
                            con3.toString(),
                            style: TextStyle(
                                fontSize: widthconv(16),
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: screenWidth / 6.67,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              colon.toString(),
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
                              con31.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: screenHeight / 35,
              ),
              Row(
                children: [
                  SizedBox(
                    height: heightconv(80),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: widthconv(200),
                      ),
                      SizedBox(
                        height: heightconv(50),
                        width: widthconv(180),
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 68, 146, 132),
                          ),
                          style: TextStyle(
                              color: Colors.white, fontSize: widthconv(16)),
                          focusColor: const Color.fromARGB(255, 68, 146, 132),
                          dropdownColor:
                              const Color.fromARGB(255, 68, 146, 132),
                          value: val,
                          items: [
                            DropdownMenuItem(
                              child: Opacity(
                                opacity: 0.5,
                                child: Text(
                                  "Patrol type ",
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              value: "-1",
                            ),
                            DropdownMenuItem(
                              child: Text(" Normal patrolling"), // Combed
                              value: "1",
                            ),
                            DropdownMenuItem(
                              child:
                                  Text(" Zig Zag patrolling"), // Combed Compact
                              value: "2",
                            )
                          ],
                          onChanged: (v) {
                            print("changed");
                            setState(() {
                              val = v.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
