import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/Component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {


  static String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email;
  String password;
  bool showSpinner = false;


  final _auth = FirebaseAuth.instance;

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
              MyHeroImage(
                height: 200.0,
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(

                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value){
                  setState(() {
                    email = value;
                  });
                },
                decoration: KDeco.copyWith(
                    hintText: 'Enter your email',
                    enabledBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.tealAccent[700], width: 1.0),
                    ),
                    focusedBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.tealAccent[700], width: 2.0),
                    )
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
                decoration: KDeco.copyWith(
                    hintText: 'Enter your password',
                    enabledBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.tealAccent[700], width: 1.0),
                    ),
                    focusedBorder: kDecoOutlineBorder.copyWith(
                      borderSide: BorderSide(color: Colors.tealAccent[700], width: 2.0),
                    )
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              LogInSignInButton(
                  text: 'Log In',
                  color: Colors.tealAccent[700],
                  pushTo: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(user != null){
                        setState(() {
                          showSpinner = false;
                        });
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                    }catch(e){
                      setState(() {
                        showSpinner = false;
                      });
                    }

                  }),
            ],
          ),
        ),
      ),
    );
  }
}


