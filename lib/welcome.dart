import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/checkotp.dart';

class Wel extends StatefulWidget {
  const Wel({Key? key}) : super(key: key);
  static String ver = "";
  @override
  State<Wel> createState() => Del();
}

class Del extends State<Wel> {
  final TextEditingController _controller = TextEditingController();
  var phone = "";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    double screenheight = MediaQuery.of(context).size.width;
    double heightconv(double arg) {
      return screenWidth * (arg / 781.09);
    }

    double widthconv(double arg) {
      return screenheight * (arg / 392.7);
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/welcome.jpg"),
                    fit: BoxFit.cover)),
          ),
          Column(
            children: [
              SizedBox(
                height: heightconv(310),
              ),
              Text(
                'User Login',
                style: TextStyle(
                    fontSize: widthconv(35),
                    color: Color.fromARGB(255, 68, 146, 132),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: heightconv(30),
              ),
              Container(
                alignment: Alignment.center,
                width: widthconv(200),
                child: TextField(
                  controller: _controller,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 68, 146, 132),
                    hintText: 'Enter Mobile Number',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: widthconv(200),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_controller.text.length != 10) {
                      } else {
                        try {
                          phone = _controller.text;
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+91$phone',
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent:
                                (String verificationId, int? resendToken) {
                              Wel.ver = verificationId;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      otpchk(verid: verificationId)));
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        } catch (e) {}
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 68, 146, 132)),
                    ),
                    child: const Text('Get OTP'),
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
