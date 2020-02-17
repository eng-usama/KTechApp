import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:k_tech/scope_model_wrapper.dart';
import 'dart:async';

void main() async {
  runApp(ScopeModelWrapper());
}

class AnimatedFlutterLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AnimatedFlutterLogoState();
}

class _AnimatedFlutterLogoState extends State<AnimatedFlutterLogo> {
  Timer _timer;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterLogo(
      size: 200.0,
      textColor: Colors.white,
      style: _logoStyle,
    );
  }
}

class StartingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StartingPage();
}

class _StartingPage extends State<StartingPage> {
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo",
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
              heightFactor: 500,
              widthFactor: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/logo.png')
                ],
              )),
        ),
      ),
    );
  }

  _StartingPage() {
    _timer = new Timer(const Duration(milliseconds: 5000), () {
      setState(() {
        print("Timer Finished");
        // _hawyiaLogo = FlutterLogoStyle.horizontal;
        Navigator.pushReplacementNamed(context,
            '/Main'); //MaterialPageRoute(builder: (context) => WelcomeScreen()));
      });
    });
  }
}
