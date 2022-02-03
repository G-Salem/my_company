import 'package:flutter/material.dart';

class ForgotYourPwd extends StatelessWidget {
  final Function press;
  const ForgotYourPwd({
    Key key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Did you forget your password ? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "Reset it",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
