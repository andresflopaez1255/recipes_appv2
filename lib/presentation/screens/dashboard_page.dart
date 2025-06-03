import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/presentation/widgets/navigation/bottom_navigation.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List of screens where BottomNavigation should be displayed
    final screensWithBottomNav = [
      '/home',
      '/categories',
      '/favorites',
      '/profile',
    ];

    // Check if the current route is in the list
    final currentLocation =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    final showBottomNav = screensWithBottomNav.contains(currentLocation);
   
    return Scaffold(
      body: child,
      bottomNavigationBar: showBottomNav ? BottomNavigation() : null,
    );
  }
}
