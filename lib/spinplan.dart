import 'dashboard-2.dart';
import 'package:flutter/material.dart';

class spin extends StatelessWidget {
  List<String> left, right;
  String yarn, count, stdcode;
  spin(
      {super.key,
      required this.left,
      required this.right,
      required this.yarn,
      required this.count,
      required this.stdcode});

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

    List l = [];
    List r = [];
    l = left.sublist(0, left.length - 3);
    l.add("Mixing requirement (kg/day)");
    l.add(left[left.length - 3]);
    l.add(left[left.length - 2]);
    l.add(left[left.length - 1]);
    r = right.sublist(0, right.length - 3);
    r.add("");
    r.add(right[right.length - 3]);
    r.add(right[right.length - 2]);
    r.add(right[right.length - 1]);
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
          itemCount: l.length,
          itemBuilder: (BuildContext context, int index) {
            return (index == 8 && yarn[0] == 'K') ||
                    (index == 8 && yarn[0] == 'C') ||
                    (index == 8 && yarn[1] != 'C') ||
                    (index == 12 && yarn[0] == 'P' && yarn[1] == 'C')
                ? Card(
                    color: Colors.white,
                    child: ListTile(
                        title: Text("" + l[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 0, 0)))))
                : (r[index] == '0')
                    ? SizedBox(
                        width: 0,
                        height: 0,
                      )
                    : Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                            title: Row(
                          children: [
                            SizedBox(
                              width: screenWidth / 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  l[index],
                                  style: TextStyle(
                                      color: (index == 0)
                                          ? Colors.red
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: widthconv(16)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (screenWidth / 20),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  ":",
                                  style: TextStyle(
                                      color: (index == 0)
                                          ? Colors.red
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: widthconv(16)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (screenWidth / 4),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  r[index],
                                  style: TextStyle(
                                      color: (index == 0)
                                          ? Colors.red
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: widthconv(16)),
                                ),
                              ),
                            ),
                          ],
                        )),
                      );
          },
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          count + "s" + " " + yarn + " " + "Spin Plan (SC = $stdcode) :",
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
          body()
        ],
      ),
    );
  }
}
