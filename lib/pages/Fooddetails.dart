import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/widgets/widget_support.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int itemCount=1;

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
            Image.asset("images/salad2.png",
                height: MediaQuery.of(context).size.height/2.5,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill
            ),
            SizedBox(height: 15),

            Row(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mediterranean",style: AppWidget.SemiboldTextStyle(),),
                    Text("Chickpea Salad",style: AppWidget.boldTextStyle(),),
                  ],
                ),

                Spacer(),

                GestureDetector(
                  onTap: (){
                    if(itemCount>1){
                      --itemCount;
                    }
                    setState(() {

                    });
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
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(7)),
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Text("Introducing our vibrant Garden Harvest Salad, a tantalizing medley of crisp greens, ripe cherry tomatoes, crunchy cucumbers, and velvety avocado slices, all artfully tossed with our signature herb-infused vinaigrette. ",
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
                    Text("\$28",style: AppWidget.boldTextStyle(),),
                  ],),
                ),
                Padding(
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
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
