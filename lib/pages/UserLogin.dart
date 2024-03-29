import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/pages/BottomNav.dart';
import 'package:food_app/pages/ForgotPassword.dart';
import 'package:food_app/pages/UserSignUp.dart';
import 'package:food_app/services/database.dart';
import 'package:food_app/services/sharedPreference.dart';
import 'package:food_app/widgets/widget_support.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String email = "", password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xFFff5722),
        content: Text(
          "Logged in Successfully",
          style: TextStyle(fontSize: 18),
        ),
      ));

      // Fetch user details from Firestore and save them to shared preferences
      String userId = userCredential.user!.uid;
      Map<String, dynamic>? userDetails =
      await DatabaseMethods().getUserDetailsByEmail(email);
      if (userDetails != null) {
        await SharedPreferenceHelper().saveUserName(userDetails["Name"]);
        await SharedPreferenceHelper().saveUserEmail(userDetails["Email"]);
        await SharedPreferenceHelper().saveUserWallet(userDetails["Wallet"]);
        await SharedPreferenceHelper().saveUserId(userId);
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavigation()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "No user found for that email",
            style: TextStyle(fontSize: 18),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Wrong password provided",
            style: TextStyle(fontSize: 18),
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Error: ${e.toString()}",
          style: TextStyle(fontSize: 18),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c00),
                      Color(0xFFe74b1a),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height / 2.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: AppWidget.HeaderTextStyle(),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter E-mail';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.SemiboldTextStyle(),
                                  prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.SemiboldTextStyle(),
                                  prefixIcon: Icon(Icons.password_outlined)),
                            ),
                            SizedBox(height: 30),
                            Container(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ForgotPassword(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: AppWidget.SemiboldTextStyle(),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            GestureDetector(
                              onTap: () async {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    email = emailController.text;
                                    password = passwordController.text;
                                  });
                                }
                                login();
                              },
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 9.0),
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFff5722),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: AppWidget.SemiboldTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserSignUp(),
                            ),
                          );
                        },
                        child: Text(
                          " Sign up",
                          style: AppWidget.OrangeSemiboldTextStyle(),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
