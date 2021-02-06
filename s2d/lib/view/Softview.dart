import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:share/share.dart';

class ConvertS extends StatefulWidget {
  @override
  _ConvertSState createState() => _ConvertSState();
}

class _ConvertSState extends State<ConvertS> {
  int _cindex = 0;
  File imagefile;
  String loadedtext = '';
  String _text = '';
  pickImageFromGallery(ImageSource source) async {
    PickedFile pickfile = await ImagePicker().getImage(source: source);
    imagefile = File(pickfile.path);
    setState(() {});
  }

  pickImageFromCamera(ImageSource source) async {
    PickedFile pickfile = await ImagePicker().getImage(source: source);
    imagefile = File(pickfile.path);
    setState(() {
      this.imagefile = imagefile;
    });
  }

  Future readTextFromImage() async {
    showDialog(
        context: context,
        child: Center(
          child: CircularProgressIndicator(),
        ));
    FirebaseVisionImage myImage = FirebaseVisionImage.fromFile(imagefile);

    TextRecognizer recognise = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognise.processImage(myImage);
    for (TextBlock block in readText.blocks) {
      for (TextLine lines in block.lines) {
        loadedtext += lines.text + '\n';
      }
    }
    setText(loadedtext);
    Navigator.of(context).pop();
  }

  void setText(newText) {
    setState(() {
      _text = newText;
    });
  }

  void clear() {
    setState(() {
      setText('');
      imagefile = null;
    });
  }

  void _shareFile(BuildContext context, String text) {
    final RenderBox box = context.findRenderObject();
    final String message = text;
    Share.share(
      message,
      subject: 'Extracted text',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: imagefile == null
                        ? Text('Select the image')
                        : Image.file(imagefile),
                  )),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Extract'),
                    onPressed: () {
                      if (imagefile == null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Message"),
                                content: Text('No image found'),
                                actions: [
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      } else {
                        readTextFromImage();
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text('Share'),
                    onPressed: () {
                      _shareFile(context, _text);
                    },
                  ),
                  RaisedButton(
                    child: Text('Clear'),
                    onPressed: () {
                      clear();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _text.isEmpty
                        ? Text('Extract the text')
                        : Text('Extracted text \n $_text'),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cindex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.touch_app),
            label: 'Choose',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.camera_alt),
            label: 'Capture',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _cindex = index;
          });
          if (index == 0) {
            pickImageFromGallery(ImageSource.gallery);
          }
          if (index == 1) {
            pickImageFromCamera(ImageSource.camera);
          }
        },
      ),
    );
  }
}
