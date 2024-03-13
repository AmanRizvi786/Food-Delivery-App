import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/admin/addFoodItem.dart';
import 'package:food_app/widgets/widget_support.dart';
class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45,left: 20,right: 20),

        child: Column(
          children: [

            Center(child: Text("Home Admin",style: AppWidget.HeaderTextStyle(),)),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddFoodItem(),));
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(6),
                          child: Image.asset("images/food.jpg",height: 100,width: 100,fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 30,),
                        Text("Add Food Items",style: AppWidget.WhiteSemiboldTextStyle(),)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
