import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class otpchk extends StatelessWidget {
  String verid;
  final TextEditingController _con = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  otpchk({super.key, required this.verid});
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
      body: Stack(
        children: [
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
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: heightconv(340),
                ),
              ),
              SizedBox(
                width: widthconv(200),
                child: TextField(
                  controller: _con,
                  inputFormatters: [LengthLimitingTextInputFormatter(6)],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 68, 146, 132),
                    hintText: 'Enter Your OTP',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: widthconv(200),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_con.text.length < 6) {
                    } else {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verid, smsCode: _con.text);
                        await auth.signInWithCredential(credential);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('Logged', "Y");
                        print(prefs.getString('Logged'));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dash()));
                      } catch (e) {}
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 68, 146, 132)),
                  ),
                  child: const Text('Verify'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
