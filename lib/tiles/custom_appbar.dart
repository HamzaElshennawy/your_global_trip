import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? logoEnabled;
  final double? elevation;
  const CustomAppBar({
    this.title,
    this.logoEnabled,
    this.elevation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : Text(""),
      leading: logoEnabled != null
          ? Image.asset(
              "assets/logotext.png",
              width: 300,
              fit: BoxFit.fitHeight,
            )
          : null,
      leadingWidth: 200,
      elevation: elevation ?? 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
