import 'package:flutter/material.dart';

class Appbarcustom extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackButtonVisible
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: isTitleVisible
          ? Text(
              title,
              style: const TextStyle(
                color: Color(0xFF4E4E4E),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
