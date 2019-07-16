import 'dart:async';

import 'package:flutter/material.dart';

class NavigationUtil {
  static void navTo(BuildContext context, StatefulWidget page,
      {bool canBack = true, int second = 0}) {
    Timer(Duration(seconds: second), () {
      if (canBack) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    });
  }

  static void navToAndClearHistory(BuildContext context, StatefulWidget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (x) => x.isActive == false);
  }
}
