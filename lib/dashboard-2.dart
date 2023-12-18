import 'doubler.dart';
import 'pretfo.dart';
import 'precf.dart';
import 'postspinner.dart';
import 'autowinder.dart';
import 'rftenter.dart';
import 'spinpre.dart';
import 'spinplan.dart';
import 'dart:convert';
import 'cf.dart';
import 'package:flutter/material.dart';
import 'productivitystd.dart';
import 'package:dio/dio.dart';

class d2 extends StatelessWidget {
  String yarncode, count;
  d2({super.key, required this.yarncode, required this.count});
  String yarn = "";
  void yarncode2(yarncode) {
    if (yarncode == "1") {
      yarn = "C";
    }
    if (yarncode == "2") {
      yarn = "C-Comp";
    }
    if (yarncode == "3") {
      yarn = "CH";
    }
    if (yarncode == "4") {
      yarn = "CH-Comp";
    }
    if (yarncode == "5") {
      yarn = "C-HT";
    }
    if (yarncode == "6") {
      yarn = "K";
    }
    if (yarncode == "7") {
      yarn = "KH";
    }
    if (yarncode == "8") {
      yarn = "K-HT";
    }
    if (yarncode == "9") {
      yarn = "PC";
    }
    if (yarncode == "10") {
      yarn = "PC-C";
    }
    if (yarncode == "11") {
      yarn = "PC-CH";
    }
    if (yarncode == "12") {
      yarn = "PC-C-HT";
    }
    if (yarncode == "13") {
      yarn = "PC-H";
    }
    if (yarncode == "14") {
      yarn = "PC-HT";
    }
    if (yarncode == "15") {
      yarn = "PSF";
    }
    if (yarncode == "16") {
      yarn = "PSF-HT";
    }
    if (yarncode == "17") {
      yarn = "PV";
    }
    if (yarncode == "18") {
      yarn = "PV-HT";
    }
    if (yarncode == "19") {
      yarn = "VSF";
    }
    if (yarncode == "20") {
      yarn = "VSF-HT";
    }
  }

  var val = '1';
  @override
  Widget build(BuildContext context) {
    yarncode2(yarncode);
    double screenWidth = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.width;
    double heightconv(double arg) {
      return screenWidth * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenHeight * (arg / 392.7);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/d2.jpg"), fit: BoxFit.cover)),
          ),
          Column(
            children: [
              SizedBox(
                height: screenWidth / 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "    " + count + "s" + " " + yarn,
                  style: TextStyle(
                      color: Color.fromARGB(255, 68, 146, 132),
                      fontSize: widthconv(25),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: heightconv(50),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: heightconv(50),
                  width: widthconv(350),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              pstd(yarn: yarn, count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Productivity standards',
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
                  width: widthconv(350),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              precf(yarn: yarn, count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Productivity conversion factors',
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
                  width: widthconv(350),
                  child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Spin Plan :',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: SizedBox(
                              height: heightconv(180),
                              width: widthconv(300),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Consider standard ring frame production ?",
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
                                      width: widthconv(220),
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
                                            value: "1",
                                            child: Text("Yes"),
                                          ),
                                          DropdownMenuItem(
                                              value: "2", child: Text("No"))
                                        ],
                                        onChanged: (v) {
                                          //print("changed");
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
                                          if (val == "1") {
                                            List<String> lhs = [];
                                            List<String> rhs = [];
                                            var mapnames, mapvalues;
                                            var dio = Dio();
                                            var data = await dio.get(
                                                "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_rf_gps/$count/$yarn/");
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
                                            String temp = rhs[0];
                                            print(temp);
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        prespin(
                                                            yarn: yarn,
                                                            count: count,
                                                            rate: temp)));
                                          }
                                          if (val == "2") {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        prespin(
                                                            yarn: yarn,
                                                            count: count,
                                                            rate: "0")));
                                          }
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all<Color>(const Color.fromARGB(
                                                  171,
                                                  0,
                                                  0,
                                                  0)), // Specify the desired button color here
                                        ),
                                        child: const Text(
                                          'Submit',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 17),
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
                      'Spin plan',
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
                  width: widthconv(350),
                  child: ElevatedButton(
                    onPressed: () async {
                      con1 = '';
                      con12 = '';
                      con2 = '';
                      con21 = '';
                      con3 = '';
                      con31 = '';
                      colon = '';
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              rftenter(yarn: yarn, count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Ring frame tenter assignment vs end breakage rate',
                      textAlign: TextAlign.center,
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
                  width: widthconv(350),
                  child: ElevatedButton(
                    onPressed: () async {
                      pon1 = '';
                      pon12 = '';
                      pon2 = '';
                      pon21 = '';
                      pon3 = '';
                      pon31 = '';
                      pon4 = '';
                      pon41 = '';
                      polon = '';
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              autowind(yarn: yarn, count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Automatic cone winding productivity',
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
                  width: widthconv(350),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              postspinner(yarn: yarn, count: count)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146,
                              132)), // Specify the desired button color here
                    ),
                    child: Text(
                      'Productivity in doubler winding & TFO doubling',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: widthconv(16), color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
