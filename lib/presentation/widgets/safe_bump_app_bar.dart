import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SafeBumpAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget trailingWidget;
  final String title;

  const SafeBumpAppBar({Key? key, required this.trailingWidget, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade50,
      leading: Icon(Icons.menu_rounded),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: trailingWidget,
        )
      ],
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
