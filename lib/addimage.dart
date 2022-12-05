import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference products =
      FirebaseFirestore.instance.collection("Products");

  final globalkey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController quantity = TextEditingController();

  void adddata() async {
    final imgurl = await uploadImage(_image!);
    await products.add({
      "pid": 123,
      "pname": name.text.trim(),
      "pprice": price.text.trim(),
      "pquantity": quantity.text.trim(),
      "images": imgurl
    }).whenComplete(() => displayMessage("New data added sucessfully"));
  }

  File? _image;

  final picker = ImagePicker();
  //String? downloadUrl;

  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        } else {
          displayMessage("no image selected");
        }
      });
    } catch (e) {
      displayMessage(e.toString());
    }
  }

  Future uploadImage(File _image) async {
    String url;
    String imgId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child("images");
    await reference.putFile(_image);
    url = await reference.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            width: 300,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _image == null
                      ? Center(child: Text("No image selected"))
                      : Image.file(_image!),
                ),
                ElevatedButton(
                  onPressed: () {
                    imagePicker();
                  },
                  child: Text("select Image"),
                )
              ],
            ),
          ),
          TextFormField(
            controller: name,
          ),
          TextFormField(
            controller: price,
          ),
          TextFormField(
            controller: quantity,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: adddata,
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
