import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_appv2/presentation/providers/navigation_providers/navigation_provider.dart';
import 'package:recipes_appv2/presentation/screens/favorities_page.dart';
import 'package:recipes_appv2/presentation/screens/home_page.dart';
import 'package:recipes_appv2/presentation/screens/profile_page.dart';
import 'package:recipes_appv2/presentation/widgets/navigation/bottom_navigation.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage(this.child, {super.key});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
