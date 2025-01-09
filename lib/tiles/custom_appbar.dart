import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: Image.asset(
        "assets/icon/logo.png",
        width: 200,
        fit: BoxFit.fitWidth,
      ),
      leadingWidth: 200,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              //show dropdown menu contains the user profile and logout
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                      MediaQuery.of(context).size.width - 50, 85, 0, 0),
                  items: [
                    PopupMenuItem(
                      value: "Profile",
                      child: Row(children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Profile"),
                      ]),
                    ),
                    PopupMenuItem(
                      value: "Logout",
                      child: Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Logout"),
                        ],
                      ),
                    ),
                  ])
            },
            child: Icon(Icons.person),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
