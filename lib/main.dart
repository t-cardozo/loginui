import 'package:flutter/material.dart';
import 'package:loginui/signin_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
          headline6: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic),
          button: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(.2),
            ),
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopLayoutImage(
            flex: 2,
            alignment: Alignment.center,
          ),
          layoutTitle(context),
        ],
      ),
    );
  }

  Expanded layoutTitle(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          layoutTitleText(context),
          layoutButton(context),
        ],
      ),
    );
  }

  RichText layoutTitleText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "BAKING LESSONS\n",
          style: Theme.of(context).textTheme.headline5,
        ),
        TextSpan(
            text: "MASTER THE ART OF BAKING",
            style: Theme.of(context).textTheme.headline6)
      ]),
    );
  }

  FittedBox layoutButton(BuildContext context) {
    return FittedBox(
      child: SafeArea(
        minimum: const EdgeInsets.only(bottom: 15.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kPrimaryColor,
            ),
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "START LEARNING",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopLayoutImage extends StatelessWidget {
  final int flex;
  final Alignment alignment;
  const TopLayoutImage({this.flex, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/hands_food.jpg"),
              alignment: alignment),
        ),
      ),
    );
  }
}
