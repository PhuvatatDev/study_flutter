class Dog {
  final String name;

  Dog({required this.name});

  String bark() {
    return "Woof! I'm $name";
  }
}

void main() {
  final myDog = Dog(name: "Yuzu");

  // ignore: avoid_print
  print(myDog.bark());
}
