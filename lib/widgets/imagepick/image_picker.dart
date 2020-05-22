import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerUser extends StatefulWidget {
  ImagePickerUser(this.imagepickFn);

  final void Function(File pickedImage) imagepickFn;
  @override
  _ImagePickerUserState createState() => _ImagePickerUserState();
}

class _ImagePickerUserState extends State<ImagePickerUser> {
  File _image;
  void image_picker() async {
    final ImageOption imgop = await _asyncSimpleDialog(context);
    print("Selected ImageOption is $imgop");
    final pickedImage = await ImagePicker.pickImage(
      source: imgop == ImageOption.Gallery
          ? ImageSource.gallery
          : ImageSource.camera,
      imageQuality: 70,
      maxWidth: 140,
    );
    setState(() {
      _image = pickedImage;
    });
    widget.imagepickFn(pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: _image != null ? FileImage(_image) : null,
          radius: 40,
          backgroundColor: Colors.pink[200],
        ),
        FlatButton.icon(
          onPressed: image_picker,
          icon: Icon(Icons.image),
          label: Text('Add image'),
          textColor: Colors.pink[700],
        ),
      ],
    );
  }
}

enum ImageOption { Camera, Gallery }

Future<ImageOption> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<ImageOption>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Image upload option'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageOption.Camera);
              },
              child: const Text('Camera'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ImageOption.Gallery);
              },
              child: const Text('Gallery'),
            ),
          ],
        );
      });
}
