import 'package:flutter/material.dart';
import 'injector.dart' as di;
import 'presentation/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
