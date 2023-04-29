import 'package:flutter/material.dart';
import 'package:appexample/core/injectconfig.dart';
import 'package:appexample/myapp.dart';

void main() {
  InjectConfig.injectDependencies();
  runApp(const MyApp());
}
