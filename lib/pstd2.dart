import 'pdfviewer.dart';
import 'dashboard-2.dart';
import 'package:flutter/material.dart';

class pstd2 extends StatelessWidget {
  List<String> left, right;
  String yarn, count, stdcode;
  pstd2(
      {super.key,
      required this.left,
      required this.right,
      required this.yarn,
      required this.count,
      required this.stdcode});
  String stdwrd = "";

  void stdword(std) {
    if (std == "1") {
      stdwrd = "Carding";
    }
    if (std == "2") {
      stdwrd = "Pre Comber Drawing";
    }
    if (std == "3") {
      stdwrd = "Breaker Drawing";
    }
    if (std == "4") {
      stdwrd = "Lap Former";
    }
    if (std == "5") {
      stdwrd = "Comber";
    }
    if (std == "6") {
      stdwrd = "Finisher Draw Frame";
    }
    if (std == "7") {
      stdwrd = "Fly Frame";
    }
    if (std == "8") {
      stdwrd = "Ring Frame";
    }
    if (std == "9") {
      stdwrd = "Automatic Cone Winding";
    }
    if (std == "10") {
      stdwrd = "Carding (Cotton for $yarn)";
    }
    if (std == "12") {
      stdwrd = "Lap former (Cotton for $yarn)";
    }
    if (std == "13") {
      stdwrd = "Comber (Cotton for $yarn)";
    }
    if (std == "11") {
      stdwrd = "Pre Comber Drawing (Cotton for $yarn)";
    }
  }

  @override
  Widget build(BuildContext context) {
    stdword(stdcode);
    double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double heightconv(double arg) {
      return screenheight * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenWidth * (arg / 392.7);
    }

    List<String> l = [];
    List<String> r = [];
    int colorchk = 0;
    int bgchk = 0;
    if (stdcode != "7" && stdcode != "8" && stdcode != "9") {
      bgchk = left.length - 3;
      colorchk = left.length - 1;
      l = left.sublist(0, left.length - 2);
      l.add("Breakage standards");
      l.add(left[left.length - 2]);
      l.add("Standard Work Assignment ");
      l.add(left[left.length - 1]);
      r = right.sublist(0, right.length - 2);
      r.add("");
      r.add(right[right.length - 2]);
      r.add("");
      r.add(right[right.length - 1]);
    } else if (stdcode == '7') {
      bgchk = left.length - 4;
      colorchk = left.length - 2;
      l = left.sublist(0, left.length - 3);
      l.add("Breakage standards");
      l.add(left[left.length - 3]);
      l.add("Standard Work Assignment");
      l.add(left[left.length - 2]);
      l.add(left[left.length - 1]);
      r = right.sublist(0, right.length - 3);
      r.add("");
      r.add(right[left.length - 3]);
      r.add("");
      r.add(right[right.length - 2]);
      r.add(right[right.length - 1]);
    } else if (stdcode == '8') {
      bgchk = left.length - 6;
      colorchk = left.length - 4;
      l = left.sublist(0, left.length - 5);
      l.add("Breakage standards");
      l.add(left[left.length - 5]);
      l.add("Standard Work Assignment");
      l.add(left[left.length - 4]);
      l.add(left[left.length - 3]);
      l.add(left[left.length - 2]);
      l.add(left[left.length - 1]);
      r = right.sublist(0, right.length - 5);
      r.add("");
      r.add(right[right.length - 5]);
      r.add("");
      r.add(right[right.length - 4]);
      r.add(right[right.length - 3]);
      r.add(right[right.length - 2]);
      r.add(right[right.length - 1]);
    } else if (stdcode == "9") {
      bgchk = left.length - 3;
      colorchk = left.length - 1;
      l = left.sublist(0, left.length - 2);
      //l.add("Breakage standards");
      l.add(left[left.length - 2]);
      // l.add("Standard Work Assignment ");
      l.add(left[left.length - 1]);
      r = right.sublist(0, right.length - 2);
      //r.add("");
      r.add(right[right.length - 2]);
      //r.add("");
      r.add(right[right.length - 1]);
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
          itemCount: l.length,
          itemBuilder: (BuildContext context, int index) {
            return (index == colorchk + 1 && stdcode != '9')
                ? Card(
                    color: Colors.white,
                    child: ListTile(
                        title: Text("" + l[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 0, 0)))))
                : Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: ListTile(
                        title: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 2.23,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              l[index],
                              style: TextStyle(
                                  color: (index == bgchk + 1 && stdcode != '9')
                                      ? Color.fromARGB(255, 255, 0, 0)
                                      : Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 10,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              (index == bgchk + 1) ? "" : ":",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 3,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              r[index],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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

    String formurl = '';
    String packurl = '';
    String tech = '';
    if (stdcode == '1' || stdcode == '10') {
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftechnology_standard_cards.jpg?alt=media&token=088674ef-6ef7-400c-9c2c-3faf0a236594';
      packurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Fcarding_packagesize.jpg?alt=media&token=2f72336b-96c1-4e88-8cfb-b020851ef948';
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_cards.jpg?alt=media&token=d31c084d-0377-44f5-9349-0a709b9b24ee';
    }
    if (stdcode == '2') {
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technology%20standards%2Ftechnology_standard_precomber.jpg?alt=media&token=fcc8b525-3e36-4cbc-9fd3-42477d70c11f';
      packurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Fpre_comber_drg_packagesize.jpg?alt=media&token=6c2a864f-7a93-440e-8212-03960a4f4188';
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_breaker.jpg?alt=media&token=988de36b-7134-4b60-844e-b5a24dcbd660';
    }
    if (stdcode == '3' || stdcode == '12') {
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftechnology_standard_breaker.jpg?alt=media&token=f5eda4c1-91d2-4997-aa38-be4b7fd74d72';
      packurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Fbreaker_packagesize.jpg?alt=media&token=6c516e9e-e445-497b-9e30-199e164d2ca7';
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_breaker.jpg?alt=media&token=988de36b-7134-4b60-844e-b5a24dcbd660';
    }
    if (stdcode == '4' || stdcode == '11') {
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_lapformer.jpg?alt=media&token=d1f38793-ce75-4976-8e18-a0f99bb3d04d';
      if (yarn[0] == 'P' || yarn[0] == 'V') {
      } else {
        packurl =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Fpackagesize_standard_lapformer.jpg?alt=media&token=431308ae-1f4c-4697-9c2a-3793253e4a77';
      }
    }
    if (stdcode == '5') {
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftechnology_standard_comber.jpg?alt=media&token=166180d3-fa18-4f34-819b-a707f409f7ef';
      packurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Fpackagesize_standard_comber.jpg?alt=media&token=e19eeaed-1bdf-47b6-86be-6b89139c6aee';
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_comber.jpg?alt=media&token=0fa78774-03a2-4142-996c-ebb4890c7e99';
    }
    if (stdcode == '6') {
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftechnology_standard_finisher.jpg?alt=media&token=cfaddba9-d674-47f7-b39a-30dba48b45db';
      packurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Ffinisher_packagesize.jpg?alt=media&token=6e8747d2-47b1-4b73-bf8c-90af4ad2dc5c';
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_breaker.jpg?alt=media&token=988de36b-7134-4b60-844e-b5a24dcbd660';
    }
    if (stdcode == '7') {
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_flyframe.jpg?alt=media&token=1dc02531-d7a4-4183-9a7e-cf4ad7f7acb6';
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftechnology_standard_flyframe.jpg?alt=media&token=065f8b01-fa9a-4e48-b77b-c209d50d09b2';
      if (yarn[0] == 'P' || yarn[0] == 'V') {
        packurl =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Fflyframe_packagesize_synthetic.jpg?alt=media&token=a956e406-5e0b-4486-b367-77f59255bb0b';
      } else {
        packurl =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Fflyframe_packagesize_cotton.jpg?alt=media&token=13f68e95-2b6b-4863-9f31-42f7d37bf7a7';
      }
    }

    String loss = '';
    String twist = '';
    if (stdcode == '8') {
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_ringframe.jpg?alt=media&token=db717f39-b30f-49c8-94e5-d7acb0a38e08';
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftehcnology_standard_ringframe.jpg?alt=media&token=072729dd-5178-4208-9c74-b9e62bf790a9';
      if (yarn[0] == 'P' || yarn[0] == 'V') {
        packurl =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Fringframe_packagesize_synthetic.jpg?alt=media&token=8b252eb8-1810-4d04-b4de-64779664e179';
        loss =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Floss_ringframe_synthetic.jpg?alt=media&token=4f8d2bef-e7bb-419a-beb1-92e9caec5318';
        twist =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fyarn_contraction_synthetic.jpg?alt=media&token=f923740d-c09e-4157-9c31-a2091a36a34e';
      } else {
        packurl =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftehcnology_standard_ringframe.jpg?alt=media&token=072729dd-5178-4208-9c74-b9e62bf790a9';
        loss =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Floss_ringframe_cotton.jpg?alt=media&token=bfa98ea5-56d8-4b42-90e2-5cda94ac1411';
        twist =
            'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/others%2Fyarn_contraction_cotton.jpg?alt=media&token=0bfd7215-e0d4-4e8f-a612-9b60af765911';
      }
    }
    if (stdcode == '9') {
      formurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/production%20formula%2FProdnformula_autowinder.jpg?alt=media&token=5b7d76a3-d63b-4f5c-81f9-f00c5133e657';
      tech =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/technologystdnew%2Ftechnology_standard_autowinder.jpg?alt=media&token=1fc32826-72bf-48ec-a255-3b92b6288d00';
      packurl =
          'https://firebasestorage.googleapis.com/v0/b/testsitra-24704.appspot.com/o/package%20contents%2Fautowdg_packagesize.jpg?alt=media&token=de285aa6-9d21-4d8c-8140-d0d9f16d0736';
    }

    List<String> actionlist = [
      'Technology standards',
      'Package contents',
      'Production Formula'
    ];
    if (stdcode == '8') {
      actionlist = [
        'Technology standards',
        'Std. package contents',
        'Loss in machine efficiency',
        'Twist contraction',
        'Production Formula'
      ];
    }
    if (stdcode == '1' || stdcode == '6') {
      actionlist = [
        'Technology standards',
        'Std. package size',
        'Production Formula'
      ];
    }
    if (stdcode == '7') {
      actionlist = [
        'Technology standards',
        'Std. package content',
        'Production Formula'
      ];
    }
    if (stdcode == '4' || stdcode == '11') {
      actionlist = ['Std. package content', 'Production Formula'];
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          count + "s" + " " + yarn + " " + stdwrd,
          style: TextStyle(fontSize: widthconv(18)),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (stdcode == '4' || stdcode == '12') {
                print("t");
                if (value == actionlist[0]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(packurl)));
                    },
                  );
                }
                if (value == actionlist[1]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(formurl)));
                    },
                  );
                }
                return;
              }
              if (stdcode != '8') {
                if (value == actionlist[0]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(tech)));
                    },
                  );
                }
                if (value == actionlist[1]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(packurl)));
                    },
                  );
                }
                if (value == actionlist[2]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(formurl)));
                    },
                  );
                }
              }
              if (stdcode == '8') {
                if (value == actionlist[0]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(tech)));
                    },
                  );
                }
                if (value == actionlist[1]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(packurl)));
                    },
                  );
                }
                if (value == actionlist[2]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(loss)));
                    },
                  );
                }
                if (value == actionlist[3]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(twist)));
                    },
                  );
                }
                if (value == actionlist[4]) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          backgroundColor: Colors
                              .transparent, // Make the background transparent
                          insetPadding: EdgeInsets.zero,
                          content:
                              InteractiveViewer(child: Image.network(formurl)));
                    },
                  );
                }
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
          body()
        ],
      ),
    );
  }
}
