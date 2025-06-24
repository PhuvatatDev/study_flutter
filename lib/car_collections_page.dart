import 'package:flutter/material.dart';

class CarCollectionsPage extends StatefulWidget {
  const CarCollectionsPage({super.key, required this.title});

  final String title;

  @override
  State<CarCollectionsPage> createState() => _CarCollectionsPageState();
}

class _CarCollectionsPageState extends State<CarCollectionsPage> {
  String _result = "";
  String _firstName = "";
  double _kms = 0;
  bool _electric = true;
  final List<int> _places = [2, 4, 5, 7];
  int _placesSelected = 2;
  final Map<String, bool> _options = {
    "GPS": false,
    "Caméra de recul": false,
    "Clim par zone": false,
    "Régulateur de vitesse": false,
    "toit ouvrant": false,
    "Siége chauffant": false,
    "Roue de secours": false,
    "Jante alu": false,
  };
  Car? _carSelected;
          
  //La Liste de voitures
  final List<Car> _cars = [
    Car(name: "MG cyberster", url: "MG", places: 2, isElectric: true),
    Car(name: "R5 électrique", url: "R5", places: 4, isElectric: true),
    Car(name: "Tesla", url: "tesla", places: 5, isElectric: true),
    Car(name: "Van VW", url: "Van", places: 7, isElectric: true),
    Car(name: "Alpine", url: "Alpine", places: 2, isElectric: false),
    Car(name: "Fiat 500", url: "Fiat 500", places: 4, isElectric: false),
    Car(name: "Peugeot 3008", url: "P3008", places: 5, isElectric: false),
    Car(name: "Dacia Jogger", url: "Jogger", places: 7, isElectric: false),
  ];


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
                  children:
                      children, // Ajout de `children` ici pour afficher le contenu
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

  void _kmsUpDate(double newValue) {
    setState(() {
      _kms = newValue;
    });
  }

  void _upDateElectric(bool newValue) {
    setState(() {
      _electric = newValue;
    });
  }

  void _upDatePlace(int? newValue) {
    setState(() {
      _placesSelected = newValue ?? 2;
    });
  }

  void _upDateOptions(bool? newBool, String key) {
    setState(() {
      _options[key] = newBool ?? false;
    });
  }

  void _handleResult() {
    setState(() {
      _result = _isGoodChoice();
      _carSelected = _cars.firstWhere((car) =>
          car.isElectric == _electric && car.places == _placesSelected);
    });
  }

  String _isGoodChoice() {
    if (_kms > 15000 && _electric) {
      return "vous devriez pensez à un moteur thermique";
    } else if (_kms < 5000 && !_electric) {
      return "vous faites peu de kilométres, pemsez à regarder les voitures electric";
    } else {
      return "Voici la voiture faite pour vous";
    }
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
              onPressed: _handleResult,
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
            Text(
              "Welcome: $_firstName",
              style: const TextStyle(
                  fontSize: 20, color: Colors.blue, height: 3.0),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(_result),
                    (_carSelected == null)
                        ? const SizedBox(
                            height: 10,
                          )
                        : Image.asset(
                            _carSelected!.urlString,
                            fit: BoxFit.contain,
                          ),
                    Text(_carSelected?.name ?? "No Name Car"),
                  ],
                ),
              ),
            ),
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
            _interactiveWidget(children: [
              Text("Nombre de Kilométre annuel: ${_kms.toInt()} Kmd"),
              Slider(min: 0, max: 25000, value: _kms, onChanged: _kmsUpDate)
            ]),
            _interactiveWidget(isRow: true, children: [
              Text(_electric ? "Moteur électrique" : "Moteur thermique"),
              Switch(value: _electric, onChanged: _upDateElectric),
            ]),
            _interactiveWidget(children: [
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
            ]),
            _interactiveWidget(children: [
              const Text("Options du Véhicule"),
              Column(
                children: _options.keys.map((key) {
                  return CheckboxListTile(
                      title: Text(key),
                      value: _options[key],
                      onChanged: ((b) => _upDateOptions(b, key)));
                }).toList(),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class Car {
  String name;
  String url;
  int places;
  bool isElectric;

  Car(
      {required this.name,
      required this.url,
      required this.places,
      required this.isElectric});

  String get urlString => "asset/images/$url.jpg";
}
