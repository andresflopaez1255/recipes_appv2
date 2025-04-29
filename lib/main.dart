import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/presentation/screens/dashboard_page.dart';
import 'package:recipes_appv2/presentation/screens/home_page.dart';
import 'package:recipes_appv2/presentation/screens/search_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => DashboardPage(child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Favorites Page')),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Profile Page')),
          ),
        ),
        GoRoute(                
            path: '/search', builder: (context, state) => const SearchPage()),
      ],
    ),
  ],
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        extensions: const [SkeletonizerConfigData()],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        extensions: const [SkeletonizerConfigData.dark()],
      ),
    );
  }
}
