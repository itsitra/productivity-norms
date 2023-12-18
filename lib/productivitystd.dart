import 'dart:convert';
import 'package:flutter/material.dart';
import 'pstd2.dart';
import 'package:dio/dio.dart';

class pstd extends StatelessWidget {
  String yarn, count;
  pstd({super.key, required this.yarn, required this.count});
  var val = "-1";
  List<bool> flags = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];
  @override
  Widget build(BuildContext context) {
    if (yarn == "K" || yarn == "KH" || yarn == "K-HT") {
      flags[2] = false;
      flags[4] = false;
      flags[5] = false;
    }
    if (yarn == "C" ||
        yarn == "C-Comp" ||
        yarn == "CH-Comp" ||
        yarn == "CH" ||
        yarn == "C-HT") {
      flags[3] = false;
    }
    if (yarn[0] == 'P' || yarn[0] == 'V') {
      flags[2] = false;
      flags[4] = false;
      flags[5] = false;
    }
    if (yarn == "PSF" || yarn == "PSF-HT") {
      flags[2] = false;
      flags[3] = false;
    }
    double screenWidth = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.width;
    double heightconv(double arg) {
      return screenWidth * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenHeight * (arg / 392.7);
    }

    Widget dropper(String yarnn) {
      if (yarnn == "PC-CH" || yarnn == "PC-C" || yarnn == "PC-C-HT") {
        return SizedBox(
          width: widthconv(352),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 68, 146, 132),
            ),
            style: TextStyle(color: Colors.white, fontSize: widthconv(16)),
            focusColor: const Color.fromARGB(255, 68, 146, 132),
            dropdownColor: const Color.fromARGB(255, 68, 146, 132),
            value: val,
            items: [
              DropdownMenuItem(
                child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      "         Select the department ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )),
                value: "-1",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[1] ? 1.0 : 0.3, child: Text(" Carding ")),
                value: "1",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[2] ? 1.0 : 0.3,
                    child: Text(" Pre Combed Drawing ")),
                value: "2",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[3] ? 1.0 : 0.3,
                    child: Text(" Breaker Drawing ")),
                value: "3",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[4] ? 1.0 : 0.3, child: Text(" Lap Former ")),
                value: "4",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[5] ? 1.0 : 0.3, child: Text(" Comber ")),
                value: "5",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[6] ? 1.0 : 0.3,
                    child: Text(" Finisher Draw Frame ")),
                value: "6",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[7] ? 1.0 : 0.3, child: Text(" Fly Frame ")),
                value: "7",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[8] ? 1.0 : 0.3, child: Text(" Ring Frame ")),
                value: "8",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[9] ? 1.0 : 0.3,
                    child: Text(" Automatic Cone Winding ")),
                value: "9",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[10] ? 1.0 : 0.3,
                    child: Text(" Carding (Cotton for $yarn) ")),
                value: "10",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: 1.0,
                    child: Text(" Pre Comber Drawing (Cotton for $yarn) ")),
                value: "11",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: 1.0,
                    child: Text(" Lap former (Cotton for $yarn) ")),
                value: "12",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: 1.0, child: Text(" Comber (Cotton for $yarn) ")),
                value: "13",
              )
            ],
            onChanged: (v) {
              if (flags[int.parse(v.toString())]) {
                val = v.toString();
              } else {
                val = "-1";
              }
            },
          ),
        );
      }
      if (yarnn == "PC" || yarnn == "PC-H" || yarnn == "PC-HT") {
        return SizedBox(
          width: widthconv(352),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 68, 146, 132),
            ),
            style: TextStyle(color: Colors.white, fontSize: widthconv(16)),
            focusColor: const Color.fromARGB(255, 68, 146, 132),
            dropdownColor: const Color.fromARGB(255, 68, 146, 132),
            value: val,
            items: [
              DropdownMenuItem(
                child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      "         Select the department ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )),
                value: "-1",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[1] ? 1.0 : 0.3, child: Text(" Carding ")),
                value: "1",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[2] ? 1.0 : 0.3,
                    child: Text(" Pre Comber Drawing ")),
                value: "2",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[3] ? 1.0 : 0.3,
                    child: Text(" Breaker Drawing ")),
                value: "3",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[4] ? 1.0 : 0.3, child: Text(" Lap Former ")),
                value: "4",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[5] ? 1.0 : 0.3, child: Text(" Comber ")),
                value: "5",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[6] ? 1.0 : 0.3,
                    child: Text(" Finisher Draw Frame ")),
                value: "6",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[7] ? 1.0 : 0.3, child: Text(" Fly Frame ")),
                value: "7",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[8] ? 1.0 : 0.3, child: Text(" Ring Frame ")),
                value: "8",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: flags[9] ? 1.0 : 0.3,
                    child: Text(" Automatic Cone Winding ")),
                value: "9",
              ),
              DropdownMenuItem(
                child: Opacity(
                    opacity: 1.0, child: Text(" Carding (Cotton for $yarn) ")),
                value: "10",
              )
            ],
            onChanged: (v) {
              if (flags[int.parse(v.toString())]) {
                val = v.toString();
              } else {
                val = "-1";
              }
            },
          ),
        );
      }
      return SizedBox(
        width: widthconv(352),
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 68, 146, 132),
          ),
          style: TextStyle(color: Colors.white, fontSize: widthconv(16)),
          focusColor: const Color.fromARGB(255, 68, 146, 132),
          dropdownColor: const Color.fromARGB(255, 68, 146, 132),
          value: val,
          items: [
            DropdownMenuItem(
              child: Opacity(
                  opacity: 0.5,
                  child: Text(
                    "         Select the department ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )),
              value: "-1",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[1] ? 1.0 : 0.3, child: Text(" Carding ")),
              value: "1",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[2] ? 1.0 : 0.3,
                  child: Text(" Pre Comber Drawing ")),
              value: "2",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[3] ? 1.0 : 0.3,
                  child: Text(" Breaker Drawing ")),
              value: "3",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[4] ? 1.0 : 0.3, child: Text(" Lap Former ")),
              value: "4",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[5] ? 1.0 : 0.3, child: Text(" Comber ")),
              value: "5",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[6] ? 1.0 : 0.3,
                  child: Text(" Finisher Draw Frame ")),
              value: "6",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[7] ? 1.0 : 0.3, child: Text(" Fly Frame ")),
              value: "7",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[8] ? 1.0 : 0.3, child: Text(" Ring Frame ")),
              value: "8",
            ),
            DropdownMenuItem(
              child: Opacity(
                  opacity: flags[9] ? 1.0 : 0.3,
                  child: Text(" Automatic Cone Winding ")),
              value: "9",
            )
          ],
          onChanged: (v) {
            if (flags[int.parse(v.toString())]) {
              val = v.toString();
            } else {
              val = "-1";
            }
          },
        ),
      );
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
                height: screenWidth / 10,
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
                height: screenWidth / 4,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "    Productivity Standard",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: widthconv(20),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: heightconv(20),
              ),
              dropper(yarn),
              //enter here
              SizedBox(
                height: heightconv(20),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: widthconv(100),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (val == "-1") {
                      } else {
                        List<String> lhs = [];
                        List<String> rhs = [];
                        var mapnames, mapvalues;
                        var dio = Dio();
                        var data = await dio.get(
                            "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_productivity_standards/$count/$yarn/$val");
                        print(
                            "http://sitraonline.org.in/onlineserviceapi/index.php/api/app_productivity_standards/$count/$yarn/$val");
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
                            builder: (context) => pstd2(
                                left: lhs,
                                right: rhs,
                                yarn: yarn,
                                count: count,
                                stdcode: val)));
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
            ],
          )
        ],
      ),
    );
  }
}
