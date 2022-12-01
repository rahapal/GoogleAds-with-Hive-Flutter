import 'package:flutter/material.dart';
import 'package:hivefinal/viewpage.dart';

import 'elevatedbutton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Flutter'),
      ),
      body: SizedBox(
        height: 700,
        child: Column(
          children: [
            ViewPage(),
            Button(),
          ],
        ),
      ),
    );
  }
}
