import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? logoEnabled;
  const CustomAppBar({
    this.title,
    this.logoEnabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : Text(""),
      leading: logoEnabled != null
          ? Image.asset(
              "assets/icon/logo.png",
              width: 200,
              fit: BoxFit.fitWidth,
            )
          : null,
      leadingWidth: 200,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
