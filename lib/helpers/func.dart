import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Func {
  static bool isEmpty(Object? o) => o == null || o == '';

  static bool isNotEmpty(Object? o) => o != null && o != '';
}
