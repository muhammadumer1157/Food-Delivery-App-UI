import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/animations/fade_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: const Icon(null),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Text(
                      "Food Delivery",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        FadeAnimation(
                          delay: 1,
                          child: makeCategory(true, "Pizza"),
                        ),
                        FadeAnimation(
                          delay: 1.3,
                          child: makeCategory(false, "Burger"),
                        ),
                        FadeAnimation(
                          delay: 1.4,
                          child: makeCategory(false, "Pasta"),
                        ),
                        FadeAnimation(
                          delay: 1.5,
                          child: makeCategory(false, "Desert"),
                        ),
                        FadeAnimation(
                          delay: 1.6,
                          child: makeCategory(false, "Salad"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            FadeAnimation(
              delay: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Free Delivery",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      delay: 1.4,
                      child: makeItem("assets/images/one.jpg"),
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: makeItem("assets/images/two.jpg"),
                    ),
                    FadeAnimation(
                      delay: 1.6,
                      child: makeItem("assets/images/three.jpg"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory(bool isActive, String title) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow : Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[500],
                fontSize: 18.0,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
          ),
        ),
      ),
    );
  }

  Widget makeItem(String image) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [0.2, 0.9],
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ 15.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Vegetarian Pizza",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
