import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/presentation/screens/home_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() {
  runApp( const ProviderScope(child: MainApp()) );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        extensions: const [
          SkeletonizerConfigData(),
        ],
      ),
      darkTheme:  ThemeData(
        brightness: Brightness.dark,
        extensions: const [
          SkeletonizerConfigData.dark(),
        ],
      ),
      home: const Scaffold(
        body: HomePage()
      ),
    );
  }
}
