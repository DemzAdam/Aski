import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'router.dart';
import 'theme/asky_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const AskyApp());
}

class AskyApp extends StatelessWidget {
  const AskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Asky',
      debugShowCheckedModeBanner: false,
      theme: AskyTheme.theme,
      routerConfig: appRouter,
    );
  }
}
