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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.thumb_up),
                label: const Text("Like"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.blueGrey,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
                child: const Text("Save"),
              ),
              const SizedBox(
                height: 400.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
