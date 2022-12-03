import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
          ElevatedButton(onPressed: () {}, child: Text('Save')),
        ],
      )),
    );
  }
}
