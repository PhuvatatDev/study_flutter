import 'package:flutter/material.dart';

class CarCollectionsPage extends StatefulWidget {
  const CarCollectionsPage({super.key, required this.title});

  final String title;

  @override
  State<CarCollectionsPage> createState() => _CarCollectionsPageState();
}

class _CarCollectionsPageState extends State<CarCollectionsPage> {
  String _firstName = ""; // Enlever `final` pour rendre cette variable modifiable

  Padding _interactiveWidget(
      {required List<Widget> children, bool isRow = false}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          isRow
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: children,
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children, // Ajout de `children` ici pour afficher le contenu
                ),
          const Divider(),
        ],
      ),
    );
  }

void _upDateFirstName(String newValue) {
  setState(() {
    _firstName = newValue;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        toolbarHeight: 75.0,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                textStyle: WidgetStatePropertyAll(
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.amberAccent),
              ),
              child: const Text("Confirm!"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Welcome: $_firstName"),
            _interactiveWidget(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your name",
                  ),
                  onSubmitted: _upDateFirstName, 
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
