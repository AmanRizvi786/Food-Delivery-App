import 'package:flutter/material.dart';
import '../widgets/onBoard_content_model.dart';
import '../widgets/widget_support.dart';
import 'UserSignUp.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: OnboardingScreenContents.contents.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                final content = OnboardingScreenContents.contents[i];
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Image.asset(content.image,width: MediaQuery.of(context).size.width-10,height: MediaQuery.of(context).size.height/2,),
                      SizedBox(height: 20),
                      Text(
                        content.title,
                        style: AppWidget.HeaderTextStyle(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        content.description,
                        style: AppWidget.LightTextStyle(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                OnboardingScreenContents.contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == OnboardingScreenContents.contents.length - 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserSignUp()),
                );
              } else {
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              }
            },
            child: Container(
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFff5722), // Change color as per your requirement
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                currentIndex == OnboardingScreenContents.contents.length - 1
                    ? 'Start'
                    : 'Next',
                style: AppWidget.WhiteSemiboldTextStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: currentIndex == index ? Colors.black : Colors.black38,
      ),
    );
  }
}
