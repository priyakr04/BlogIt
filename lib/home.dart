// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newblog/create_blog.dart';
import 'package:newblog/services/crud.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CrudeMethods _crudeMethods =  CrudeMethods();
   dynamic blogSnapShot;

  // ignore: non_constant_identifier_names
  Widget BlogList() {
    return Container(
      child: Column(
        children: [
          blogSnapShot!=null?
          ListView.builder(
              itemCount: blogSnapShot!.docs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DocumentSnapshot products =
                blogSnapShot!.docs[index];
                return BlogsTile(url:products['imgUrl'],
                 authorName:products['authorName'],
                 desc:products['desc'],
                 title:products['title'],
                 
                 );
                 
              })
              :Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _crudeMethods.getData().then((result) {
      blogSnapShot = result;
    });
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
      ),
      body: Container(),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateBlog()));
            },
            child: const Icon(Icons.add),
          )
        ]),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String? url , authorName, title, desc ;

  BlogsTile( {
    required this.url, required this.authorName, required this.desc,
      required this.title
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(6), child: Image.network(url!)),
        Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.black45.withOpacity(0.3),
              borderRadius: BorderRadius.circular(6)),
        ),
        Container(
          child: Column(
            children: [Text(title!), Text(desc!), Text(authorName!)],
          ),
        )
      ]),
    );
  }
}
