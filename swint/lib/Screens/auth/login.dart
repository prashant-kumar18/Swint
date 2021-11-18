import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swint/Screens/DisCover/discover_screen.dart';
import 'package:swint/Screens/Home/home_card.dart';
import 'package:swint/Screens/Home/home_screen.dart';
import 'package:swint/Screens/auth/phoneverify.dart';
import 'package:swint/Screens/auth/register.dart';
import 'package:swint/main.dart';

class Login extends StatefulWidget {
  static String routeName = "/Login";
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Stack(children: [
        ClipPath(
          clipper: LoginClip(inner: true),
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
            height: size.height,
          ),
        ),
        ClipPath(
          clipper: LoginClip(inner: false),
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
            height: size.height,
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
                "Login\nSwinter",
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
                      obscureText: true,
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
                        elevation: 8,
                        minWidth: double.infinity,
                        height: size.height * 0.06,
                        color: mycolor[500],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, HomeScreen.routeName);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.08,
                    ),
                    Text(
                      "Or Connect with:",
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
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.01),
                          child: MaterialButton(
                              color: mycolor[900],
                              elevation: 8,
                              minWidth: size.width / 3,
                              height: size.height * 0.05,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (ctx) {
                                  return Verification();
                                }));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.phoneAlt,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "Phone",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, Register.routeName);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Don't Have an account?",
                              style: TextStyle(color: Colors.black54)),
                          TextSpan(
                              text: "Register",
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

class LoginClip extends CustomClipper<Path> {
  bool inner;
  LoginClip({required this.inner});
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
