import 'package:flutter/material.dart';

class DevTestView extends StatelessWidget {
  const DevTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 5,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
