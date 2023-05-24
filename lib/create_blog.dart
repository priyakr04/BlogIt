// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newblog/services/crud.dart';
import 'package:random_string/random_string.dart';

class CreateBlog extends StatefulWidget {
  const CreateBlog({super.key});

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName = "", title = "", desc = "";
  File? selectedImage;
  bool? _isLoading;

  final CrudeMethods _crudeMethods =  CrudeMethods();
  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  uploadBlog() async {
    if (selectedImage != null) {
      ///uploading to firebase storage.
      setState(() {
        _isLoading = true;
      });
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage
          .ref()
          .child("blogimage")
          // ignore: unnecessary_string_interpolations, prefer_adjacent_string_concatenation
          .child("${randomAlphaNumeric(9)}" + ".jpg");
      UploadTask uploadTask = ref.putFile(selectedImage!);

      var downloadUrl = await (await uploadTask).ref.getDownloadURL();

      Map<String, dynamic> blogMap = {
        "imgUrl": downloadUrl,
        "authorName": authorName,
        "title": title,
        "desc": desc,
      };

      _crudeMethods.addData(blogMap).then((value) => Navigator.pop(context));
    } else {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Flutter',
                style: TextStyle(fontSize: 22),
              ),
              Text('Blog', style: TextStyle(fontSize: 22, color: Colors.blue)),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                uploadBlog();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(Icons.file_upload)),
            )
          ]),
      body: _isLoading != null
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: selectedImage != null
                        ? Container(
                            height: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                )),
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            width: MediaQuery.of(context).size.width,
                            child: const Icon(
                              Icons.add_a_photo,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(children: [
                      TextField(
                        decoration:
                            const InputDecoration(hintText: "Author Nmae"),
                        onChanged: (val) {
                          authorName = val;
                        },
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: "Title"),
                        onChanged: (val) {
                          title = val;
                        },
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(hintText: "Description"),
                        onChanged: (val) {
                          desc = val;
                        },
                      )
                    ]),
                  )
                ],
              ),
            ),
    );
  }
}
