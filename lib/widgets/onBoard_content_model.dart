class OnboardingScreenContents {
  String image;
  String title;
  String description;

  OnboardingScreenContents({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboardingScreenContents> contents = [
    OnboardingScreenContents(
      image: "images/screen1.png",
      title: "Select From Our Best Menu",
      description: "Pick your food from our menu\n      More than 35 times",
    ),
    OnboardingScreenContents(
      image: "images/screen2.png",
      title: "Easy And Online Payment",
      description: "You can pay cash on delivery\n  Card payment is available",
    ),
    OnboardingScreenContents(
      image: "images/screen3.png",
      title: "Quick Delivery at\n   Your doorstep",
      description: "Deliver your food at \n   your Doorstep",
    ),
  ];
}
