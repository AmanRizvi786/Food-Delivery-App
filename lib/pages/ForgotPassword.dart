import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/widget_support.dart';

import 'UserSignUp.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

    forgotPassword() async{
      String email = emailController.text.trim();

      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            "Please Enter an Email",
            style: TextStyle(fontSize: 18),
          ),
        ));
        return;
      }
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Email has been sent !",
          style: TextStyle(fontSize: 18,color: Colors.white),)));
      }on FirebaseAuthException catch(e){
        if(e.code=="user-not-found"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User found for that email",
            style: TextStyle(fontSize: 18,color: Colors.white),)));
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child:Column(
        children: [
          SizedBox(height: 70,),
          Container(
            alignment: Alignment.topCenter,
            child: Text("Password Recovery",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
          ),
          SizedBox(height: 20,),
          Text("Enter your email",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
          SizedBox(height: 35,),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width-32,
            child: TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white,fontFamily: "Poppins"),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),hintText: "Email",hintStyle: TextStyle(color: Colors.white,fontFamily: "Poppins"),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.white),borderRadius: BorderRadius.circular(25))
                  ),
            ),
          ),
          SizedBox(height: 50,),

          GestureDetector(
            onTap: forgotPassword,

            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 5.0,
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width-32,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                child: Center(
                  child: Text("Send Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
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
                style: AppWidget.WhiteSemiboldTextStyle(),
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
                  " Create",
                  style: AppWidget.OrangeSemiboldTextStyle(),
                ),
              ),
            ],
          )
        ],
       ) ,
      ),
    );
  }
}
