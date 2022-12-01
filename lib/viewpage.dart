import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivefinal/models/details.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late Box<Details> hello;

  @override
  void initState() {
    hello = Hive.box('details');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hello.listenable(),
      builder: (context, Box<Details> box, _) {
        return Expanded(
          child: ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final details = box.getAt(index);

              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(details!.image),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(details!.name),
                        Text(details.phone),
                      ],
                    ),
                    Text(details.address),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            box.deleteAt(index);
                          });
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
