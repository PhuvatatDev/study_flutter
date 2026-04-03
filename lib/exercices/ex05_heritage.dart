// ignore_for_file: avoid_print

class Animal {
  final String name;
  Animal({required this.name});

  String get description => '$name est un animal';

  void speak() {
    print('');
  }
}

class Dog extends Animal {
  Dog({required super.name});

  @override
  String get description => '$name est un chien';

  @override
  void speak() {
    print('woof!');
  }
}

class Cat extends Animal {
  Cat({required super.name});

  @override
  void speak() {
    print('Miao!');
  }
}

void main() {
  final dog = Dog(name: 'Rex');
  final cat = Cat(name: 'Mimi');

  dog.speak();
  cat.speak();
  print(dog.description);
}
