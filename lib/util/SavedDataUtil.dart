import 'package:flutter/material.dart';
import 'FontUtil.dart';
import 'ThemeUtil.dart';

import 'ResourceUtil.dart';

class SavedDataUtil {
  static final SavedDataUtil data = new SavedDataUtil._internal();

  dynamic themesController;
  ResourceUtil resource = new ResourceUtil();
  ThemeData themeData = ThemeUtil.primary();
  String fontFamily = FontUtil.primary;

  factory SavedDataUtil() {
    return data;
  }

  SavedDataUtil._internal();
}
