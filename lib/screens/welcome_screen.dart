import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flash_chat/Component.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin  {
  
  AnimationController controller;
  Animation animation;
  
  @override
  void initState() {
    super.initState();
    controller =  AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 1
        ),
    );

    animation = ColorTween(begin: Colors.grey, end: Colors.black).animate(controller);;
    controller.forward();
    controller.addListener((){
      setState(() {
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                MyHeroImage(height:80.0),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  speed: Duration(
                    milliseconds: 400,
                  ),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            LogInSignInButton(
              color: Colors.tealAccent[700],
              text: 'Log In',
              pushTo: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            LogInSignInButton(
              color: Colors.teal[700],
              text: 'Sign Up',
              pushTo: (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}


