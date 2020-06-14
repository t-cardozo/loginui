import 'package:flutter/material.dart';
import 'package:loginui/constants.dart';
import 'package:loginui/main.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopLayoutImage(
            flex: 25,
            alignment: Alignment.bottomCenter,
          ),
          topTitleLayout(context),
          Spacer(),
          middleInputLayout(),
          Spacer(),
          bottomButtonLayout(),
        ],
      ),
    );
  }

  SingleChildScrollView topTitleLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: topLayoutText(context),
      )),
    );
  }

  SingleChildScrollView bottomButtonLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            circleIconButton(icon: Icons.android),
            SizedBox(width: 20),
            circleIconButton(icon: Icons.chat),
            Spacer(),
            circleIconNextButton(),
          ],
        ),
      ),
    );
  }

  Expanded middleInputLayout() {
    return Expanded(
      flex: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //SingleChildScrollView
              IconTextBox(
                hint: 'Email Address',
                icon: Icons.alternate_email,
              ),
              SizedBox(
                height: 20,
              ),
              IconTextBox(
                hint: 'Password',
                icon: Icons.lock,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleIconButton({IconData icon}) {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(.5),
          ),
        ),
        child: Icon(icon, color: Colors.white.withOpacity(.5)),
      ),
    );
  }

  Widget circleIconNextButton() {
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor,
        ),
        child: Icon(Icons.arrow_forward, color: Colors.black),
      ),
    );
  }

  Row topLayoutText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "SIGN IN",
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          "SIGN UP",
          style: Theme.of(context).textTheme.button,
        )
      ],
    );
  }
}

class IconTextBox extends StatelessWidget {
  final String hint;
  final IconData icon;
  const IconTextBox({this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: kPrimaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
            hintText: hint,
          ),
        ))
      ],
    );
  }
}
