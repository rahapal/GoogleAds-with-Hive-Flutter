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
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();

  late Box<Details> detailsofbox;
  File? _image;
  int index;
  _EditPageState(this.index);

  @override
  void initState() {
    super.initState();
    detailsofbox = Hive.box('details');
  }

  Future PickImage(ImageSource media) async {
    final image = await ImagePicker().pickImage(source: media);
    if (image == null) return;
    final imageTemp = File(image.path);

    setState(() {
      _image = imageTemp;
      // _selected = _image;
    });
    return _image;
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
          ElevatedButton(
              onPressed: () {
                PickImage(ImageSource.gallery).then((value) => setState(() {
                      _image = value;
                    }));
              },
              child: Text('Select Image')),
          TextField(
            controller: _name,
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
            // controller: ,
          ),
          TextField(
            controller: _address,
            decoration: const InputDecoration(
              hintText: 'Address',
            ),
            // controller: ,
          ),
          TextField(
            controller: _phone,
            decoration: const InputDecoration(
              hintText: 'Phone',
            ),
            //controller: ,
          ),
          ElevatedButton(
              onPressed: () {
                Details details = Details(
                    id: detailsofbox.getAt(index)!.id,
                    name: _name.text,
                    address: _address.text,
                    phone: _phone.text,
                    image: _image!.path);
                detailsofbox.putAt(index, details);
                Navigator.pop(context);
                setState(
                  () {
                    detailsofbox.put(details.id, details);
                  },
                );
              },
              child: Text('Save')),
        ],
      )),
    );
  }
}
