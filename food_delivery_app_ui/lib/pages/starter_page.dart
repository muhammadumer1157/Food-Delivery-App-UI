import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/animations/fade_animation.dart';
import 'package:food_delivery_app_ui/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _animation = Tween(begin: 1.0, end: 25.0).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then(
          (value) => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: HomePage(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/starter-image.jpg"),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FadeAnimation(
                  delay: 0.5,
                  child: Text(
                    "Taking Order For Faster Delivery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const FadeAnimation(
                  delay: 1,
                  child: Text(
                    "See restaurants nearby by \nadding location",
                    style: TextStyle(
                        color: Colors.white, height: 1.4, fontSize: 18.0),
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                FadeAnimation(
                  delay: 1.2,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: const LinearGradient(
                            colors: [Colors.yellow, Colors.orange]),
                      ),
                      child: AnimatedOpacity(
                        opacity: _textVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 50),
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          minWidth: double.infinity,
                          onPressed: () => _onTap(),
                          child: const Text(
                            "Start",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                FadeAnimation(
                  delay: 1.4,
                  child: AnimatedOpacity(
                    opacity: _textVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 50),
                    child: Align(
                      child: Text(
                        "Now Deliver To Your Door 24/7",
                        style: TextStyle(color: Colors.white70, fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
