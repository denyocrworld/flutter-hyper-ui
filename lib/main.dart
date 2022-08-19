import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/setup.dart';

void main() async {
  await initialize();
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: defaultTheme,
    home: const ExampleView(),
  ));
}

class ExampleView extends StatefulWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ExButton(
                label: "Save",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
