import 'package:flutter/material.dart';

class CarCollectionsPage extends StatefulWidget {
  const CarCollectionsPage({super.key, required this.title});

  final String title;

  @override
  State<CarCollectionsPage> createState() => _CarCollectionsPageState();
}

class _CarCollectionsPageState extends State<CarCollectionsPage>
    with TickerProviderStateMixin {
  String _result = "";
  String _firstName = "";
  double _kms = 0;
  bool? _electric;
  final Set<int> _placesSelected = {2};
  final Map<String, bool> _options = {
    "GPS": false,
    "Caméra de recul": false,
    "Clim par zone": false,
    "Régulateur de vitesse": false,
    "Toit ouvrant": false,
    "Siège chauffant": false,
    "Roue de secours": false,
    "Jante alu": false,
  };
  final Set<Car> _selectedCars = {};

  late AnimationController _animationController;
  late AnimationController _fadeController;

  final List<Car> _cars = [
    Car(name: "MG Cyberster", url: "MG", places: 2, isElectric: true),
    Car(name: "R5 Électrique", url: "R5", places: 4, isElectric: true),
    Car(name: "Tesla Model 3", url: "tesla", places: 5, isElectric: true),
    Car(name: "Van VW ID.Buzz", url: "Van", places: 7, isElectric: true),
    Car(name: "Alpine A110", url: "Alpine", places: 2, isElectric: false),
    Car(name: "Fiat 500", url: "Fiat 500", places: 4, isElectric: false),
    Car(name: "Peugeot 3008", url: "P3008", places: 5, isElectric: false),
    Car(name: "Dacia Jogger", url: "Jogger", places: 7, isElectric: false),
  ];

  List<Car> get _filteredCars {
    return _cars.where((car) {
      final matchesElectric = _electric == null || car.isElectric == _electric;
      final matchesPlaces =
          _placesSelected.isEmpty || _placesSelected.contains(car.places);
      return matchesElectric && matchesPlaces;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeController.dispose();
    super.dispose();
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

  void _upDateElectric(bool? newValue) {
    setState(() {
      _electric = newValue;
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
    });
  }

  void _upDatePlaces(Set<int> newValue) {
    setState(() {
      _placesSelected.clear();
      _placesSelected.addAll(newValue);
    });
  }

  void _upDateOptions(bool? newBool, String key) {
    setState(() {
      _options[key] = newBool ?? false;
    });
  }

  void _toggleCarSelection(Car car) {
    setState(() {
      if (_selectedCars.contains(car)) {
        _selectedCars.remove(car);
      } else {
        _selectedCars.add(car);
      }
    });
  }

  void _handleResult() {
    setState(() {
      _result = _isGoodChoice();
    });
    _showResultDialog();
  }

  void _showResultDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              'Recommendation',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _result,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedCars.isNotEmpty) ...[
              Text(
                'Selected Cars (${_selectedCars.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: _selectedCars.length,
                  itemBuilder: (context, index) {
                    final car = _selectedCars.toList()[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            car.urlString,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(car.name),
                        subtitle: Text(
                          '${car.places} places • ${car.isElectric ? "Électrique" : "Thermique"}',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _isGoodChoice() {
    if (_kms > 15000 && (_electric == true || _electric == null)) {
      return "Vous parcourez beaucoup de kilomètres. Pensez à regarder les moteurs thermiques pour les longs trajets.";
    } else if (_kms < 5000 && _electric == false) {
      return "Vous faites peu de kilomètres. Les voitures électriques seraient parfaites pour vos trajets courts!";
    } else if (_selectedCars.isEmpty) {
      return "Sélectionnez des voitures pour voir nos recommandations personnalisées.";
    } else {
      return "Excellent choix! Ces voitures correspondent parfaitement à vos besoins.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primaryContainer,
                    ],
                  ),
                ),
                child: Center(
                  child: FadeTransition(
                    opacity: _fadeController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.directions_car,
                          size: 60,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8),
                        if (_firstName.isNotEmpty)
                          Text(
                            'Bienvenue, $_firstName!',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 0,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Votre nom",
                          hintText: "Entrez votre nom",
                          prefixIcon: const Icon(Icons.person_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.surface,
                        ),
                        onChanged: _upDateFirstName,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Vos préférences',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.speed, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Kilomètres annuels: ${_kms.toInt()} km',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Slider(
                            min: 0,
                            max: 25000,
                            divisions: 50,
                            value: _kms,
                            label: '${_kms.toInt()} km',
                            onChanged: _kmsUpDate,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type de moteur',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            children: [
                              FilterChip(
                                label: const Text('Tous'),
                                selected: _electric == null,
                                onSelected: (selected) {
                                  if (selected) _upDateElectric(null);
                                },
                                avatar: const Icon(Icons.all_inclusive,
                                    size: 18),
                              ),
                              FilterChip(
                                label: const Text('Électrique'),
                                selected: _electric == true,
                                onSelected: (selected) {
                                  _upDateElectric(selected ? true : null);
                                },
                                avatar: const Icon(Icons.electric_car,
                                    size: 18),
                              ),
                              FilterChip(
                                label: const Text('Thermique'),
                                selected: _electric == false,
                                onSelected: (selected) {
                                  _upDateElectric(selected ? false : null);
                                },
                                avatar:
                                    const Icon(Icons.local_gas_station,
                                        size: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre de places',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          SegmentedButton<int>(
                            segments: const [
                              ButtonSegment(
                                value: 2,
                                label: Text('2'),
                                icon: Icon(Icons.directions_car, size: 16),
                              ),
                              ButtonSegment(
                                value: 4,
                                label: Text('4'),
                                icon: Icon(Icons.family_restroom, size: 16),
                              ),
                              ButtonSegment(
                                value: 5,
                                label: Text('5'),
                                icon: Icon(Icons.groups, size: 16),
                              ),
                              ButtonSegment(
                                value: 7,
                                label: Text('7'),
                                icon: Icon(Icons.airport_shuttle, size: 16),
                              ),
                            ],
                            selected: _placesSelected,
                            onSelectionChanged: _upDatePlaces,
                            multiSelectionEnabled: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ExpansionTile(
                    title: Text(
                      'Options du véhicule',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      '${_options.values.where((v) => v).length} options sélectionnées',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _options.keys.map((key) {
                          return FilterChip(
                            label: Text(key),
                            selected: _options[key]!,
                            onSelected: (selected) =>
                                _upDateOptions(selected, key),
                            checkmarkColor:
                                Theme.of(context).colorScheme.primary,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Voitures disponibles',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Badge(
                        label: Text('${_filteredCars.length}'),
                        child: const Icon(Icons.directions_car),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (_selectedCars.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_selectedCars.length} voiture(s) sélectionnée(s)',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final car = _filteredCars[index];
                  final isSelected = _selectedCars.contains(car);
                  return AnimatedScale(
                    scale: isSelected ? 0.95 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: GestureDetector(
                      onTap: () => _toggleCarSelection(car),
                      child: Card(
                        elevation: isSelected ? 8 : 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(car.urlString),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  if (isSelected)
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withValues(alpha: 0.8),
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          Icon(
                                            car.isElectric
                                                ? Icons.electric_car
                                                : Icons.local_gas_station,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${car.places} places',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    car.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: car.isElectric
                                              ? Colors.green.withValues(alpha: 0.2)
                                              : Colors.orange
                                                  .withValues(alpha: 0.2),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          car.isElectric
                                              ? 'Électrique'
                                              : 'Thermique',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: car.isElectric
                                                ? Colors.green
                                                : Colors.orange,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: _filteredCars.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
      floatingActionButton: AnimatedSlide(
        offset: _selectedCars.isEmpty ? const Offset(0, 2) : Offset.zero,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton.extended(
          onPressed: _handleResult,
          icon: const Icon(Icons.check),
          label: Text(
            _selectedCars.isEmpty
                ? 'Sélectionnez des voitures'
                : 'Voir recommandations',
          ),
          backgroundColor: _selectedCars.isEmpty
              ? Theme.of(context).colorScheme.surfaceContainerHighest
              : Theme.of(context).colorScheme.primary,
          foregroundColor: _selectedCars.isEmpty
              ? Theme.of(context).colorScheme.onSurfaceVariant
              : Theme.of(context).colorScheme.onPrimary,
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

  Car({
    required this.name,
    required this.url,
    required this.places,
    required this.isElectric,
  });

  String get urlString => "asset/images/$url.jpg";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Car &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          url == other.url;

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}