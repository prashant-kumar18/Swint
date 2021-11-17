import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:swint/main.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white24,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
            size: 18,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Enter verification code send to your Email",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                PinCodeTextField(
                    controller: otp,
                    pinTheme: PinTheme(
                        activeColor: Colors.orange,
                        inactiveColor: Colors.purple,
                        selectedColor: Colors.pink,
                        shape: PinCodeFieldShape.circle),
                    appContext: context,
                    length: 6,
                    onChanged: (value) {}),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(size.width * 0.1),
            child: MaterialButton(
              onPressed: () async {},
              height: 50,
              elevation: 0,
              color: mycolor[500],
              child: const Text(
                "Verify",
                style: TextStyle(letterSpacing: 1, fontSize: 18),
              ),
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            ),
          ),
        ],
      ),
    );
  }
}
