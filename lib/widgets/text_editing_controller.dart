import 'package:flutter/material.dart';
import 'package:study_flutter/car_collections_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  final TextEditingController myController = TextEditingController();

  String typedText = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("you typed $typedText"),
            const SizedBox(height: 18),
            TextField(
              controller: myController,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  typedText = myController.text;
                });
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CarCollectionsPage(title: "",),
                    ),
                  );
                },
              child: const Text('Go to car collections'),
            ),
          ],
        ),
      ),
    );
  }
}
