import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Add Item'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return Dialog(
              child: SizedBox(
                height: 250,
                child: Column(
                  children: [
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
                      onPressed: () {},
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
