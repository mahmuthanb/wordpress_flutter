import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:wordpress_flutter/app/presentation/app/app2.dart';
import 'package:wordpress_flutter/core/di/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI(Environment.dev);
  runApp(const Myapp());
}
