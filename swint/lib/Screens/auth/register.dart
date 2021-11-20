import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swint/Screens/DisCover/discover_screen.dart';
import 'package:swint/Screens/Home/home_card.dart';
import 'package:swint/Screens/auth/login.dart';
import 'package:swint/Screens/others/gettingstarted.dart';
import 'package:swint/main.dart';

class Register extends StatefulWidget {
  static String routeName = "/Register";
  const Register({Key? key}) : super(key: key);

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Stack(children: [
        ClipPath(
          clipper: RegisterClip(inner: true),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.centerRight,
                    colors: [
                  Colors.blue,
                  Colors.blue,
                  Colors.pink[200]!,
                  Colors.pink[200]!,
                ])),
            height: size.height / 1.5,
          ),
        ),
        ClipPath(
          clipper: RegisterClip(inner: false),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.pink[200]!,
                  Colors.purple[100]!,
                  Color.fromRGBO(153, 224, 242, 1),
                  Color.fromRGBO(153, 224, 242, 1),
                  Color.fromRGBO(153, 224, 242, 1),
                  Color.fromRGBO(153, 224, 242, 1),
                  Color.fromRGBO(153, 224, 242, 1),
                ])),
            height: size.height / 1.5,
          ),
        ),
        Container(
          height: size.height,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lets,\nRegister",
                style: TextStyle(
                    fontSize: size.height * 0.05,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Full Name",
                          labelStyle:
                              TextStyle(color: Colors.black54, fontSize: 20),
                          suffixIcon: Icon(
                            Icons.person,
                            size: 15,
                            color: Colors.black,
                          )),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Colors.black54, fontSize: 20),
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 15,
                            color: Colors.black,
                          )),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Phone",
                          labelStyle:
                              TextStyle(color: Colors.black54, fontSize: 20),
                          suffixIcon: Icon(
                            FontAwesomeIcons.phone,
                            size: 15,
                            color: Colors.black,
                          )),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 20),
                        suffixIcon: Icon(
                          Icons.password,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: size.height * 0.06,
                        color: mycolor[500],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, GettingStarted.routeName);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.08,
                    ),
                    Text(
                      "Or register with:",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: MaterialButton(
                            color: Colors.blue,
                            minWidth: size.width / 3,
                            elevation: 8,
                            height: size.height * 0.05,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.lightBlue[50],
                                  size: 15,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Google",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, Login.routeName);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Already Have an account?",
                              style: TextStyle(color: Colors.black54)),
                          TextSpan(
                              text: "Login",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold))
                        ])),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    ));
  }
}

class RegisterClip extends CustomClipper<Path> {
  bool inner;
  RegisterClip({required this.inner});
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height / 3);

    path.quadraticBezierTo(
        size.width / 4, size.height / 2.5, size.width / 2, size.height / 3);
    if (!inner)
      path.quadraticBezierTo(
        size.width / 1.5,
        size.height / 3.5,
        size.width,
        size.height / 3.3,
      );
    else
      path.quadraticBezierTo(
        size.width / 1.5,
        size.height / 3.3,
        size.width,
        size.height / 2.8,
      );
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
