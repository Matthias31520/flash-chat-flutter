import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget  {

  static String id = '/signup';


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyHeroImage(height: 200.0,),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: KDeco.copyWith(
                    hintText: 'Enter your email',
                    enabledBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.teal[700], width: 1.0),
                    ),
                    focusedBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.teal[700], width: 2.0),
                    )
                ),
              ),
              SizedBox(
                height: 8.0,
              ),

              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: KDeco.copyWith(
                    hintText: 'Enter your password',
                    enabledBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.teal[700], width: 1.0),
                    ),
                    focusedBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.teal[700], width: 2.0),
                    )
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              LogInSignInButton(
                text: 'Sign Up',
                color: Colors.teal[700],
                pushTo: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    print(email);
                    print(password);
                    print('1');
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser != null){
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e){
                    setState(() {
                      showSpinner = false;
                    });
                    print(e);
                  }
                 },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
