import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyStorage()));
}

class MyStorage extends StatefulWidget {
  @override
  State<MyStorage> createState() => _MyStorageState();
}

class _MyStorageState extends State<MyStorage> {

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Storage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload('camera'),
                    icon: Icon(Icons.camera),
                    label: Text("Camera")),
                ElevatedButton.icon(
                    onPressed: () => upload('gallery'),
                    icon: Icon(Icons.photo),
                    label: Text("Gallery")),
              ],
            ),
            Expanded(
                child: FutureBuilder(
                  future: loadImage(),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Card();
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }

  loadImage() {}

  Future<void> upload(String source) async {
    final picker = ImagePicker();
    XFile? pickedImage; //to fetch platform dependent path

    try {
      pickedImage = await picker.pickImage(
          source: source == 'camera' ?
          ImageSource.camera :
          ImageSource.gallery, maxWidth: 1920);
      final String filename = path.basename(
          pickedImage!.path); // path name before / or //
      File imageFile = File(pickedImage.path); //actual path of picked data

      try {
        await storage.ref(filename).putFile(
            imageFile,
            SettableMetadata(
              customMetadata: {
                'uploaded_by': 'A USER',
                'date'       :'1/1/2021'
              }
            ));
        setState(() {});
      }on FirebaseException catch(error){
        if (kDebugMode) {
          print(error);
        }
      }
    } catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
