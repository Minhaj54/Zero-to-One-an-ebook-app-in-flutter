import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.lessonName, required this.lessonDescription, required this.index});
  final String lessonName;
  final Widget lessonDescription;
  final int index;

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${index+1}. $lessonName'),

      ),
      body: Scrollbar(
        thickness: 6,
        radius: const Radius.circular(20),
        interactive: true,
        child: InteractiveViewer(
            maxScale: 5.0,
            minScale: 0.01,
            child: lessonDescription),
      )
    );
  }
}
