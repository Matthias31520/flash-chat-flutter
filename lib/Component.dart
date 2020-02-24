import 'package:flutter/material.dart';


class LogInSignInButton extends StatelessWidget {

  final Color color;
  final String text;
  final Function pushTo;

  LogInSignInButton({this.color, this.text , this.pushTo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: (){
            pushTo();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}



class MyHeroImage extends StatelessWidget {

  final double height;

  MyHeroImage({this.height});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: 'logo',
        child: Container(
          child: Image.asset('images/logo.png'),
          height: height,
        ),
      ),
    );
  }
}


const KDeco = InputDecoration(
  //TODO hint state
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder:  kDecoOutlineBorder,
  focusedBorder: kFocusedOutlineBorder
);





const kDecoOutlineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    );

const kFocusedOutlineBorder =
    OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    );