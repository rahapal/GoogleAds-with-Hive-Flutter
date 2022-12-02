import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivefinal/models/details.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('Add Item'),
        onPressed: () {
          print(detailbox.values);
          showDialog(
            context: context,
            builder: (_) {
              return StatefulBuilder(builder: (context, setState) {
                return Dialog(
                  child: SizedBox(
                    height: 600,
                    child: Column(
                      children: [
                        // _image == null
                        //     ?
                        ElevatedButton(
                          onPressed: () {
                            //PickImage();
                            PickImage(ImageSource.gallery)
                                .then((value) => setState(() {
                                      _image = value;
                                    }));
                          },
                          child: const Text('Select Image'),
                        ),
                        // : Container(
                        //     height: 250,
                        //     width: 250,
                        //     child: Image.file(
                        //       _image!,
                        //       width: 200,
                        //       height: 200,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        TextField(
                          controller: _name,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                          ),
                        ),
                        TextField(
                          controller: _address,
                          decoration: const InputDecoration(
                            labelText: 'Address',
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
                                id: '${Uuid().v4()}',
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
                        _image != null
                            ? Image.file(
                                File(_image!.path),
                                height: 100,
                                width: 100,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}
