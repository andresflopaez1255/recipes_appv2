import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_appv2/presentation/providers/navigation_providers/navigation_provider.dart';

class Appbarcustom extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool isBackButtonVisible;
  final bool isTitleVisible;
  const Appbarcustom({
    super.key,
    required this.title,
    this.onBackPressed,
    required this.isBackButtonVisible,
    required this.isTitleVisible,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return AppBar(
      leading: isBackButtonVisible
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBackPressed ??
                  () {
                    ref.read(navigationProvider.notifier).setIndex(0);
                    context.go('/home');
                  },
            )
          : null,
      title: isTitleVisible
          ? Text(
              title,
              style: TextStyle(
                color: theme.textTheme.headlineMedium?.color ?? Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: theme.iconTheme.color ?? Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
