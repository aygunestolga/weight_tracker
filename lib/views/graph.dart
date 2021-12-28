import 'package:flutter/material.dart';

class GraphScreen extends StatefulWidget {

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Graph"), centerTitle: true ),
      body:  Center(child: Text("Graph Screen"),),
    );
  }
}
