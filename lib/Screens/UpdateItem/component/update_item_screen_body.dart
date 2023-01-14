import 'dart:io';

import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:four/Providers/Products.dart';
import 'package:four/models/Product.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:provider/provider.dart';

class UpdateBody extends StatefulWidget {
  final String id;

  UpdateBody({this.id});

  @override
  State<UpdateBody> createState() => _UpdateBodyState(id: id);
}

class _UpdateBodyState extends State<UpdateBody> {
  final String id;
  _UpdateBodyState({this.id});
  File _storedImage, _pickedImage;

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
    _pickedImage = savedImage;
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
    _pickedImage = savedImage;
  }

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descreptionController = TextEditingController();
  final _markController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    final Product productToUpdate = Provider.of<Products>(context).findById(id);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(
              left: SizeConfiguration.defaultSize / 4,
              right: SizeConfiguration.defaultSize / 4),
          child: Column(
            children: [
              SizedBox(height: SizeConfiguration.defaultSize / 2),
              TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfiguration.defaultSize / 4),
                    labelText: 'Name',
                    hintText: productToUpdate.subTitle,
                    hintMaxLines: null,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
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
                    hintText: productToUpdate.mark,
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
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfiguration.defaultSize / 4),
                    labelText: 'Price',
                    hintText: productToUpdate.price.toString() + ' \$',
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
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfiguration.defaultSize / 4,
                        vertical: SizeConfiguration.defaultSize / 4 - 10),
                    labelText: 'Descreption',
                    hintMaxLines: 4,
                    hintText: productToUpdate.descreption,
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
                    child: Image.file(
                      _storedImage == null
                          ? productToUpdate.image.first
                          : _storedImage,
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
                      const SizedBox(
                        height: 10,
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
          onTap: () async {
            final descrption = _descreptionController.text.isEmpty
                ? productToUpdate.descreption
                : _descreptionController.text;
            final image = _pickedImage == null
                ? productToUpdate.image.first.path
                : _pickedImage.path;
            final isLicked = productToUpdate.isLicked;
            final mark = _markController.text.isEmpty
                ? productToUpdate.mark
                : _markController.text;
            final price = _priceController.text.isEmpty
                ? productToUpdate.price
                : double.parse(_priceController.text);
            final title = _titleController.text.isEmpty
                ? productToUpdate.subTitle
                : _titleController.text;

            await Provider.of<Products>(context, listen: false).update(
                id: id,
                descreption: descrption,
                image: image,
                isLicked: isLicked,
                mark: mark,
                price: price.toDouble(),
                subTitle: title);
            Navigator.of(context).pop();
          },
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
                  'update product',
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
