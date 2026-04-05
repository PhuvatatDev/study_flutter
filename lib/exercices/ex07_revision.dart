// ignore_for_file: avoid_print

abstract class Animal {
  final String name;
  final int birthYear;

  Animal({required this.name, required this.birthYear});

  String speak();

  int get age => DateTime.now().year - birthYear;

  String describe() {
    return '$name has $age years and says: ${speak()}';
  }
}

class Dog extends Animal {
  Dog({required super.name, required super.birthYear});

  @override
  String speak() {
    return 'Woof!';
  }
}

class Cat extends Animal {
  Cat({required super.name, required super.birthYear});

  @override
  String speak() {
    return 'Meow!';
  }
}

void main() {
  final dog = Dog(name: 'Sally', birthYear: 2019);
  final cat = Cat(name: 'Yuzu', birthYear: 2024);

  print(dog.age);
  print(cat.age);
  print(dog.describe());
  print(cat.describe());
  print(dog.speak());
  print(cat.speak());
}
