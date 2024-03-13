import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/widget_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../services/database.dart';

class AddFoodItem extends StatefulWidget {
  const AddFoodItem({super.key});

  @override
  State<AddFoodItem> createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  final List<String> fooditems=['Ice-Cream','Pizza','Salad','Burger'];
  String? value;
  TextEditingController _itemNameController = new TextEditingController();
  TextEditingController _itemPriceController = new TextEditingController();
  TextEditingController _itemDescriptionController = new TextEditingController();
  TextEditingController _itemDetailsController = new TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {});
  }

  uploadItem() async {
    if (selectedImage != null &&
        _itemNameController.text != "" &&
        _itemPriceController.text != "" &&
        _itemDescriptionController.text != ""&&
        _itemDetailsController.text != ""
    ) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": _itemNameController.text,
        "Price": _itemPriceController.text,
        "Description":_itemDescriptionController.text,
        "Detail": _itemDetailsController.text
      };
      await DatabaseMethods().addFoodItem(addItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Food Item has been added Successfully",
              style: TextStyle(fontSize: 16),
            )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Color(0xFF343434),)),
        centerTitle: true,
        title: Text("Add Food Item",style: AppWidget.HeaderTextStyle(),),

      ),
      body: Container(
        margin: EdgeInsets.all(20),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture",style: AppWidget.SemiboldTextStyle(),),
              SizedBox(height: 20,),
              selectedImage==null?
              GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Center(
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1.5),borderRadius: BorderRadius.circular(20)

                      ),
                      child: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                    ),
                  ),
                ),
              ):Center(
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Item Name",style: AppWidget.SemiboldTextStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color:Color(0xFFececf8),borderRadius: BorderRadius.circular(10) ),

                child: TextField(
                  controller: _itemNameController,
                  decoration: InputDecoration(border: InputBorder.none,
                    hintText: "Enter Item Name",
                    hintStyle: AppWidget.LightTextStyle()
                  ),
                ),
              ),

              SizedBox(height: 15,),
              Text("Item Price",style: AppWidget.SemiboldTextStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color:Color(0xFFececf8),borderRadius: BorderRadius.circular(10) ),

                child: TextField(
                  controller: _itemPriceController,
                  decoration: InputDecoration(border: InputBorder.none,
                      hintText: "Enter Item Price",
                      hintStyle: AppWidget.LightTextStyle()
                  ),
                ),
              ),

              SizedBox(height: 15,),
              Text("Item Description",style: AppWidget.SemiboldTextStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color:Color(0xFFececf8),borderRadius: BorderRadius.circular(10) ),

                child: TextField(
                  maxLines: 1,
                  controller: _itemDescriptionController,
                  decoration: InputDecoration(border: InputBorder.none,
                      hintText: "Enter Item Description",
                      hintStyle: AppWidget.LightTextStyle()
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text("Item Details",style: AppWidget.SemiboldTextStyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color:Color(0xFFececf8),borderRadius: BorderRadius.circular(10) ),

                child: TextField(
                  maxLines: 5,
                  controller: _itemDetailsController,
                  decoration: InputDecoration(border: InputBorder.none,
                      hintText: "Enter Item Description",
                      hintStyle: AppWidget.LightTextStyle()
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: fooditems
                          .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                          )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                      dropdownColor: Colors.white,
                      hint: Text("Select Category",style: AppWidget.SemiboldTextStyle(),),
                      iconSize: 36,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      value: value,
                    )),
              ),

              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Add",
                          style: AppWidget.WhiteSemiboldTextStyle(),
                        ),
                      ),
                    ),
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

}
