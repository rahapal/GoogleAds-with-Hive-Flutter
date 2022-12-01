import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListTile(
      title: Text('Hi'),
      subtitle: Text('Hello'),
    ));
  }
}
