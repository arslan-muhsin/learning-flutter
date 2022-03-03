import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/action_button.dart';
import 'package:flash_chat/route_paths.dart' as route_paths;
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_animationController);

    _animationController.forward();

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 120.0,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 85),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            ActionButton(
              buttonText: 'Login',
              buttonColor: Colors.lightBlueAccent,
              onPressed: () =>
                  Navigator.pushNamed(context, route_paths.loginScreen),
            ),
            ActionButton(
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              onPressed: () =>
                  Navigator.pushNamed(context, route_paths.registerScreen),
            ),
          ],
        ),
      ),
    );
  }
}
