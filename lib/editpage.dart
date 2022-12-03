import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivefinal/models/details.dart';
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  int index;
  EditPage({required this.index});

  @override
  State<EditPage> createState() => _EditPageState(index);
}

class _EditPageState extends State<EditPage> {
  late Box<Details> detailsofbox;

  int index;
  _EditPageState(this.index);
  //assign the value of the index to a variable

  @override
  void initState() {
    super.initState();
    detailsofbox = Hive.box('details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Select Image')),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
            // controller: ,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Address',
            ),
            // controller: ,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Phone',
            ),
            //controller: ,
          ),
          ElevatedButton(
              onPressed: () {
                print('$index');
              },
              child: Text('Save')),
        ],
      )),
    );
  }
}
