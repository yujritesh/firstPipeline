import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class PicsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<PicsScreen> {
  int counter = 0;
  List<ImageModel> images = [];

  fetchImage() async {
    counter++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var parsedJson = json.decode(response.body);
    var imageModel = ImageModel.fromJson(parsedJson);
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's see some images $counter"),
      ),
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: fetchImage,
      ),
    );
  }
}
