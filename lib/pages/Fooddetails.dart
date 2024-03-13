import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/services/database.dart';
import 'package:food_app/widgets/widget_support.dart';

import '../services/sharedPreference.dart';

class FoodDetails extends StatefulWidget {
  //const FoodDetails({super.key});

  String foodImage,foodName,foodDetails,foodPrice;
  FoodDetails({required this.foodImage,required this.foodName,required this.foodDetails,required this.foodPrice});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int itemCount=1;
  int total=0;
  String? id;

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }


  @override
  void initState() {
    super.initState();

    ontheload();
    total=int.parse(widget.foodPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 22,right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 30),
              child: Image.network(widget.foodImage,
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill
              ),
            ),
            SizedBox(height: 15),

            Row(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Mediterranean",style: AppWidget.SemiboldTextStyle(),),
                    Text(widget.foodName,style: AppWidget.boldTextStyle(),),
                  ],
                ),

                Spacer(),

                GestureDetector(
                  onTap: (){
                    if(itemCount>1){
                      --itemCount;
                      total=total-int.parse(widget.foodPrice);
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(7)),
                    child: Icon(Icons.remove,color: Colors.white,),
                  ),
                ),
                SizedBox(width: 20),
                Text(itemCount.toString(),style: AppWidget.SemiboldTextStyle(),),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: (){
                    ++itemCount;
                    total=total+int.parse(widget.foodPrice);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(7)),
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Text(widget.foodDetails,
              style: AppWidget.LightTextStyle(),maxLines: 3,),
            SizedBox(height: 25,),
            Row(children: [
              Text("Delivery Time",style: AppWidget.SemiboldTextStyle(),),
              SizedBox(width: 25,),
              Icon(Icons.alarm,color: Colors.black54,),
              SizedBox(width: 5,),
              Text("30 min",style: AppWidget.SemiboldTextStyle(),)
            ],),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Total Price",style: AppWidget.SemiboldTextStyle(),),
                    Text("\$"+total.toString(),style: AppWidget.boldTextStyle(),),
                  ],),
                ),
                GestureDetector(
                  onTap: () async{
                    Map<String,dynamic> addFoodToCart={
                      "Name":widget.foodName,
                      "Quantity":itemCount.toString(),
                      "Total":total.toString(),
                      "Image":widget.foodImage
                    };
                    await DatabaseMethods().addFoodToCart(addFoodToCart, id!);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "Food Added to Cart",
                          style: TextStyle(fontSize: 16.0),
                        )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Add to cart",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontSize: 16),),
                          SizedBox(width:30),
                          Container(
                                  decoration: BoxDecoration(color: Colors.grey[800],borderRadius: BorderRadius.circular(10)),
                                  child: Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
