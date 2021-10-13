import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  File? _image;
  final picker = ImagePicker();
  Future getImage(ImageSource src) async {
    final PickedFile = await picker.pickImage(source: src);

    setState(() {
      if (PickedFile != null) {
        _image = File(PickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DEMO'),
      ),
      body: Center(
          // child:
          //     _image == null ? Text('No image selected.') : Image.file(_image!),
          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo),
        onPressed: () {
          var ad = AlertDialog(
            title: const Text('chose Picture from:'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  const Divider(color: Colors.black),
                  Container(
                    width: 300,
                    color: Colors.teal,
                    child: ListTile(
                      leading: const Icon(Icons.image),
                      title: const Text('Galerie'),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        //Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 300,
                    color: Colors.teal,
                    child: ListTile(
                      leading: const Icon(Icons.add_a_photo),
                      title: const Text('Camera'),
                      onTap: () {
                        getImage(ImageSource.camera);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
          showDialog(context: context, builder: (context) => ad);
        },
      ),
    );
  }
}
