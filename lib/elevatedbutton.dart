import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivefinal/models/details.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  File? _image;

  late Box<Details> detailbox;

  @override
  void initState() {
    super.initState();
    detailbox = Hive.box('details');
  }

  Future PickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      this._image = imageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('Add Item'),
        onPressed: () {
          print(detailbox.values);
          showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                child: SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      _image != null
                          ? Image.file(
                              _image!,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            )
                          : ElevatedButton(
                              onPressed: () {
                                PickImage();
                              },
                              child: Text('Select Image'),
                            ),
                      TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                        ),
                      ),
                      TextField(
                        controller: _address,
                        decoration: const InputDecoration(
                          labelText: 'Adress',
                        ),
                      ),
                      TextField(
                        controller: _phone,
                        decoration: const InputDecoration(
                          labelText: 'Contact',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Details details = Details(
                              image: _image!.path,
                              id: '${Random().nextInt(10000)}',
                              name: _name.text,
                              address: _address.text,
                              phone: _phone.text);

                          setState(
                            () {
                              detailbox.put(details.id, details);
                            },
                          );

                          _name.clear();
                          _address.clear();
                          _phone.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
