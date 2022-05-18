import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckapp/Constants/ColorConstants.dart';

class PickImage extends StatefulWidget {
  PickImage({this.setImage, this.setImages,@required this.text});
  final Function(File) setImage;
  final Function(List) setImages;
  String text;
  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File _image;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: ((builder) => showBottomSheet(context)));
        },
        child: Container(
          height: 60,width: 150,
          color: fieldColor,
          child: _image == null
              ? Center(child: Text(widget.text))
              : Image.file(
                  _image,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget showBottomSheet(context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Select image",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    size: 30,
                  ),
                  label: Text("Camera")),
              SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                  icon: Icon(
                    Icons.image,
                    size: 30,
                  ),
                  label: Text("Gallery"))
            ],
          )
        ],
      ),
    );
  }
List images=[];
  ImagePicker _picker = ImagePicker();
  galleryPicker()async{
    var pickedImages=await _picker.pickMultiImage(imageQuality: 50);
    pickedImages.forEach((element) {
      File file = File(element.path);
      images.add(file);
    });
    if(images.length!=0)
    widget.setImages(images);
    Navigator.pop(context);
  }

  pickImage(source) async {
    var pickedImage = await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedImage != null) {
      File file = File(pickedImage.path);
      _image = file;
      widget.setImage(_image);
      Navigator.pop(context);
      setState(() {});
    }
  }
}
