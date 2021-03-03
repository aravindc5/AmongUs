import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class FloatingPage extends StatefulWidget {
  static const routeName = '/floatingPage';

  @override
  _FloatingPageState createState() => _FloatingPageState();
}

class _FloatingPageState extends State<FloatingPage>
    with SingleTickerProviderStateMixin {
  AnimationController control;

  Animation<double> rot;
  Animation<double> trasl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    control = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );

    rot = Tween<double>(
      begin: 0,
      end: 2 * pi,
    ).animate(control);

    trasl = Tween<double>(
      begin: 0,
      end: 400,
    ).animate(control);

    control.forward();
  }

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context).settings.arguments;
    String charName = names[args];
    String imposterText = result[0];
    String notImposterText = result[1];
    Random rnd = new Random();
    int min = 0, max = 12;
    int r = min + rnd.nextInt(max - min);
    print(args);
    print(r);

    String resString = args == r ||
            args + 1 == r ||
            args - 1 == r ||
            args + 2 == r ||
            args - 2 == r
        ? imposterText
        : notImposterText;
    String characterName = names[args];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              'https://i.ytimg.com/vi/EZ7la-hMNuk/maxresdefault.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: AnimatedBuilder(
            animation: control,
            builder: (_, child) => Center(
              child: Stack(children: [
                Positioned(
                  top: 100,
                  left: trasl.value,
                  child: Transform(
                      transform: Matrix4.rotationZ(rot.value),
                      alignment: Alignment.center,
                      child: Image.asset(
                        imageUrl[args],
                        width: 200,
                        height: 200,
                      )),
                ),
                Positioned(
                    bottom: 280,
                    left: 90,
                    child: SizedBox(
                      width: 250.0,
                      child: TypewriterAnimatedTextKit(
                          totalRepeatCount: 1,
                          speed: Duration(milliseconds: 200),
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [characterName + " " + resString],
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional
                              .topStart // or Alignment.topLeft
                          ),
                    )),
                Positioned(
                  bottom: 140,
                  left: 135,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'BACK',
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 35),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    control.dispose();
    super.dispose();
  }
}
