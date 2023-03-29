import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SafeBumpAppBar extends StatelessWidget with PreferredSizeWidget {
  // final Widget leadingWidget;
  final Widget? trailingWidget;
  final String title;

  const SafeBumpAppBar(
      {
        Key? key,
      this.trailingWidget,
      required this.title,
      // required this.leadingWidget
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // leading: leadingWidget,
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
