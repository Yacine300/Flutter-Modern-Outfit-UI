import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:provider/provider.dart';

class AddItemBody extends StatefulWidget {
  @override
  State<AddItemBody> createState() => _AddItemBodyState();
}

class _AddItemBodyState extends State<AddItemBody> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descreptionController = TextEditingController();
  final _markController = TextEditingController();

  File _storedImage, _pikcedImage;

  Future<void> _pickImageGallery() async {
    final imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);

    if (imageFile == null) {
      return;
    }

    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    _pikcedImage = savedImage;
  }

  Future<void> _pickImageCamera() async {
    final imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile == null) {
      return;
    }

    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    _pikcedImage = savedImage;
  }

  void _clearPikedImage() {
    setState(() {
      _storedImage = null;
    });
  }

  void _saveItem() {
    if (_titleController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _descreptionController.text.isEmpty ||
        _markController.text.isEmpty ||
        _pikcedImage == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Warning"),
                content: const Text("information are missing !"),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                    child: const Text(
                      'ok',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ));
      return;
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure you want to confirm ?"),
              actions: [
                FlatButton(
                  onPressed: () {
                    Provider.of<Products>(context, listen: false).addItem(
                        pickedDescreption: _descreptionController.text,
                        pickedImage: _pikcedImage,
                        pickedPrice: double.parse(_priceController.text),
                        pickedMark: _markController.text,
                        pickedSubTitle: _titleController.text);

                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                    onPressed: () {},
                    child: const Text(
                      'No',
                    )),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: SizeConfiguration.defaultSize / 2),
              TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    //  suffixIcon: suffixCustom(svgIcon: "assets/icons/Mail.svg"),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    labelText: 'Name',
                    hintText: 'Gucci BAG',
                    enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 5),
                  )),
              SizedBox(height: SizeConfiguration.defaultSize / 4),
              TextField(
                  controller: _markController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    labelText: 'Mark',
                    hintText: 'H&M',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 5),
                  )),
              SizedBox(height: SizeConfiguration.defaultSize / 4),
              TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    labelText: 'Price',
                    hintText: '299.99 \$',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 5),
                  )),
              SizedBox(height: SizeConfiguration.defaultSize / 4),
              TextField(
                  controller: _descreptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    labelText: 'Descreption',
                    hintText: "This is a simple descreption",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 5),
                  )),
              SizedBox(height: SizeConfiguration.defaultSize / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: SizeConfiguration.defaultSize * 2,
                    width: SizeConfiguration.defaultSize * 3,
                    child: _storedImage == null
                        ? const Center(
                            child: Text(
                              "No image picked",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : Image.file(
                            _storedImage,
                            fit: BoxFit.contain,
                          ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        child: InkWell(
                          onTap: _pickImageCamera,
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfiguration.defaultSize / 4 - 10,
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: InkWell(
                          onTap: _pickImageGallery,
                          child: Icon(Icons.folder_rounded),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )),
        InkWell(
          onTap: _saveItem,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: SizeConfiguration.screenwidth,
              height: SizeConfiguration.defaultSize / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black87,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Add product',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: SizeConfiguration.defaultSize / 2),
      ],
    );
  }
}
