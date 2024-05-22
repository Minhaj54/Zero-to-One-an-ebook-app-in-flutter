import 'package:flutter/material.dart';

class ExtraDetailsPage extends StatelessWidget {
  const ExtraDetailsPage({super.key, required this.topicName, required this.topicDescription,});
  final String topicName;
  final Widget topicDescription;

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
        appBar: AppBar(
          title: Text(topicName),
        ),
        body: Scrollbar(
          thickness: 6,
          radius: const Radius.circular(20),
          interactive: true,
          child: InteractiveViewer(
              maxScale: 5.0,
              minScale: 0.01,
              child: topicDescription),
        )
    );
  }
}
