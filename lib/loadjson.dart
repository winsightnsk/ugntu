import 'package:berkana/widget_totalbar.dart';
import 'package:flutter/material.dart';

class LoadJSON extends StatefulWidget {
  static String rote = 'LoadJSON';
  const LoadJSON({Key? key}) : super(key: key);
  @override
  _LoadJSONState createState() => _LoadJSONState();
}

class _LoadJSONState extends State<LoadJSON> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: totalBar(context),
      drawer: totalDrawer(context),
      body: Placeholder(),
    );
  }
}
