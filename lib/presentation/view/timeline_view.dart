import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, i) {
              return Row(children: [

              ],)
            },
          ),
        ),
      ),
    );
  }
}
