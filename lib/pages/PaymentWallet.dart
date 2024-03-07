import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/widget_support.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:food_app/widgets/app_ConstantValues.dart';
// import 'package:http/http.dart' as http;

class PaymentWallet extends StatefulWidget {
  const PaymentWallet({super.key});

  @override
  State<PaymentWallet> createState() => _PaymentWalletState();
}

class _PaymentWalletState extends State<PaymentWallet> {
  Map<String,dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(top: 60.0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Material(
                elevation: 2.0,
                child: Container(

                  padding: EdgeInsets.only(bottom: 10,top:45),
                  child: Center(
                    child: Text("Wallet",style: AppWidget.HeaderTextStyle(),),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFFf2f2f2)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Image.asset("images/wallet.png",height: 60,width: 60,fit: BoxFit.cover,),
                      SizedBox(width: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Wallet",style: AppWidget.SemiboldTextStyle(),),
                          SizedBox(height: 5),
                          Text("\$ 100",style: AppWidget.boldTextStyle(),),

                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Add money",style: AppWidget.SemiboldTextStyle(),),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border:Border.all(color: Color(0xFFe9e2e2),width: 1.5),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("\$100",style: AppWidget.SemiboldTextStyle(),),
                  ),
                  SizedBox(width: 3,),

                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border:Border.all(color: Color(0xFFe9e2e2),width: 1.5),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("\$500",style: AppWidget.SemiboldTextStyle(),),
                  ),
                  SizedBox(width: 3,),

                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border:Border.all(color: Color(0xFFe9e2e2),width: 1.5),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("\$1000",style: AppWidget.SemiboldTextStyle(),),
                  ),
                  SizedBox(width: 3,),

                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border:Border.all(color: Color(0xFFe9e2e2),width: 1.5),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Text("\$2000",style: AppWidget.SemiboldTextStyle(),),
                  ),


                ],
              ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(color: Color(0xFF008080),borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width,
                  child: Text("Add Money",style: AppWidget.WhiteSemiboldTextStyle(),textAlign:TextAlign.center),
                )

            ],),
      ),
    );
  }

  // Future<void> makePayment(String amount) async{
  //   try{
  //     paymentIntent=await createPaymentIntent(amount,'INR');
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //           paymentIntentClientSecret: paymentIntent!['client_secret'],
  //           style: ThemeMode.dark,
  //           merchantDisplayName: "Aman"))
  //           .then((value) {});
  //     displayPaymentSheet(amount);
  //   }catch(e,s){
  //     print("exception :$e,$s");
  //   }
  // }
  //
  // displayPaymentSheet(String amount) async {
  //   try{
  //     await Stripe.instance.presentPaymentSheet().then((value) async{
  //       showDialog(context: context,
  //           builder: (_) => AlertDialog(
  //             content: Column(
  //               children: [
  //                 Row(children: [
  //                   Icon(Icons.check_circle,
  //                   color: Colors.green,
  //                   ),
  //                   Text("Payment successful")
  //                 ],)
  //               ],
  //             ),
  //           ));
  //
  //       paymentIntent=null;
  //     }).onError((error, stackTrace){
  //       print("Error is :---> $error,$stackTrace");
  //     });
  //   }on StripeException catch(e){
  //     print("Error is :---> $e");
  //     showDialog(context: context,
  //         builder: (_)=> AlertDialog(
  //           content: Text("Cancelled"),
  //         ));
  //   }catch(e){
  //     print("$e");
  //   }
  // }
  //
  // createPaymentIntent(String amount, String currency) async {
  //   try{
  //     Map<String,dynamic> body ={
  //       'amount':calculateAmount(amount),
  //       'currency':currency,
  //       'payment_method_types[]':'card',
  //     };
  //
  //     var response= await http.post(
  //       Uri.parse('http://api.stripe.com/v1/payment_intents'),
  //       headers:{
  //         'Authorization':'Bearer $secretKey',
  //         'Content-Type':'application/x-www-form-urlencoded'
  //       },
  //       body:body,
  //     );
  //     print('Payment Intent Body->>> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //
  //   }catch(err){
  //     print('err charging user: ${err.toString()}');
  //   }
  // }
  //
  // calculateAmount(String amount) {
  //     final calculatedAmount=(int.parse(amount) * 100);
  //     return calculatedAmount.toString();
  // }
}



















