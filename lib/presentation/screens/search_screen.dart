import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height/14,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/30,vertical: MediaQuery.of(context).size.height/30),
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/60,vertical: MediaQuery.of(context).size.height/80),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: TextField(),
      ),
    );
  }
}
