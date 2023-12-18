import 'dashboard-2.dart';
import 'package:flutter/material.dart';

class tfo extends StatelessWidget {
  List<String> left, right;
  String yarn, count;
  tfo(
      {super.key,
      required this.left,
      required this.right,
      required this.yarn,
      required this.count});

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
          itemCount: left.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                  title: Row(
                children: [
                  SizedBox(
                    width: screenWidth / 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        left[index],
                        style: TextStyle(
                            color: Colors.black,
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
                            color: Colors.black,
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
                        right[index],
                        style: TextStyle(
                            color: Colors.black,
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
          "2/" + count + "s" + " " + "TFO",
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
