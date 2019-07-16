import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'util/SavedDataUtil.dart';
import 'util/ThemeUtil.dart';
import 'package:intl/date_symbol_data_local.dart';

// import 'module/splashScreen/main.dart' as splashScreen;
// import 'module/home/main.dart' as splashScreen;
import 'module/home/main.dart' as home;

SavedDataUtil data = new SavedDataUtil();
void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runModule(home.Presenter());
}

StreamController<ThemeData> themesController = new StreamController();

void runModule(StatefulWidget module) {
  data.themesController = themesController;
  initializeDateFormatting();

  runApp(MainApp(
    module: module,
    themeData: ThemeUtil.scondary(),
  ));
}

class MainApp extends StatefulWidget {
  final Widget module;
  final ThemeData themeData;

  const MainApp({Key key, this.module, this.themeData}) : super(key: key);

  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
        stream: data.themesController.stream,
        initialData: widget.themeData ?? ThemeUtil.primary(),
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
          final data = snapshot.data;
          return buildUi(context, data);
        });
  }

  Widget buildUi(BuildContext context, ThemeData data) {
    return MaterialApp(
      theme: data,
      home: widget.module,
    );
  }
}
