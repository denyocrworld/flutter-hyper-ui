//#TEMPLATE stateful
import 'package:flutter/material.dart';

class StatefulWidgetView extends StatefulWidget {
  const StatefulWidgetView({Key? key}) : super(key: key);

  @override
  State<StatefulWidgetView> createState() => _StatefulWidgetViewState();
}

class _StatefulWidgetViewState extends State<StatefulWidgetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
//#END
