import 'package:flutter/material.dart';

void main() {
  runApp(const MyApply());
}

class MyApply extends StatelessWidget {
  const MyApply({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// Q1 Page d'accueil avec texte centré
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Center(
        child: Text("Bienvenue !"),
      ),
    );
  }
}

// Q2 ListView.builder avec 10 noms
class NameListpage extends StatelessWidget {
  const NameListpage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      'Alice',
      'Bob',
      'Charlie',
      'David',
      'Emma',
      'Fiona',
      'George',
      'Hannah',
      'Ivan',
      'Julia'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de noms'),
      ),
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(names[index]),
            );
          }),
    );
  }
}

// Q3 StatefulWidget avec bouton d'incrementation
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() {
    setState(() => _count++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compteur'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Valeur actuelle: $_count'),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: _increment, child: const Text("Incrementer")),
          ],
        ),
      ),
    );
  }
}

// Q4 TextField + TextEditingController (avec listener automatique)

class LiveTextPage extends StatefulWidget {
  const LiveTextPage({super.key});

  @override
  State<LiveTextPage> createState() => _LiveTextPageState();
}

class _LiveTextPageState extends State<LiveTextPage> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _text = _controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Text')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _controller),
            const SizedBox(height: 20),
            const Text('Vous avez tapé : \$_text'),
          ],
        ),
      ),
    );
  }
}

// 🔹 Q5 - Navigation entre deux pages
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Première page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          },
          child: const Text('Aller à la deuxième page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deuxième page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Revenir'),
        ),
      ),
    );
  }
}

// 🔹 Q6 - Image.network avec CircularProgressIndicator
class NetworkImagePage extends StatelessWidget {
  const NetworkImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Réseau')),
      body: Center(
        child: Image.network(
          'https://picsum.photos/250?image=9',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

// 🔹 Q7 - ListView avec Divider
class ListWithDividerPage extends StatelessWidget {
  const ListWithDividerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['Un', 'Deux', 'Trois', 'Quatre', 'Cinq'];
    return Scaffold(
      appBar: AppBar(title: const Text('Liste avec séparateurs')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => ListTile(title: Text(items[index])),
      ),
    );
  }
}

// 🔹 Q8 - BottomNavigationBar
class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;
  final List<String> _titles = ['Accueil', 'Recherche', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Bas')),
      body: const Center(
        child: Text('Onglet sélectionné : \${_titles[_currentIndex]}'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// 🔹 Q9 - SnackBar après clic
class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Action réussie !')),
            );
          },
          child: const Text('Afficher SnackBar'),
        ),
      ),
    );
  }
}

// 🔹 Q10 - AlertDialog de confirmation
class AlertDialogPage extends StatelessWidget {
  const AlertDialogPage({super.key});

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Voulez-vous vraiment supprimer ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Supprimé')),
              );
            },
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogue de Confirmation')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showConfirmationDialog(context),
          child: const Text('Supprimer'),
        ),
      ),
    );
  }
}
