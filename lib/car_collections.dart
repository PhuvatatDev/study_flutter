import 'package:flutter/material.dart';

class CarCollectionsPage extends StatefulWidget {
  const CarCollectionsPage({super.key, required this.title});

  final String title;

  @override
  State<CarCollectionsPage> createState() => _CarCollectionsPageState();
}

class _CarCollectionsPageState extends State<CarCollectionsPage> {
  String _firstName = ""; 
  double _kms = 0;
  bool _electric = true;
  final List<int> _places = [2, 4, 5, 7];
  int _placesSelected = 2;

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

void _kmsUpDate(double newValue){
  setState(() {
    _kms = newValue;
  });
}

void _upDateElectric (bool newValue){
  setState(() {
    _electric = newValue;
  });
}

void _upDatePlace (int? newValue){
  setState(() {
    _placesSelected = newValue ?? 2;
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
            Text("Welcome: $_firstName", 
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blue,
              height: 3.0
            
            ),),
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
            _interactiveWidget(
              children: [
                Text("Nombre de Kilométre annuel: ${_kms.toInt()} Kmd"),
                Slider(
                  min: 0,
                  max: 25000,
                  value: _kms, 
                  onChanged: _kmsUpDate)
              ]
            ),
            _interactiveWidget(
              isRow: true,
              children: [
                Text(_electric ? "Moteur électrique": "Moteur thermique"),
                Switch(
                  value: _electric, 
                  onChanged: _upDateElectric
                ),
              ]
            ),
            _interactiveWidget(
              children: [
                Text("Nombre de places: $_placesSelected"),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: _places.map((place) {
                    return Column(
                      children: [
                        Radio(
                          value: place, 
                          groupValue: _placesSelected, 
                          onChanged: _upDatePlace)
                      ],
                    );
                  }).toList(),
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}




