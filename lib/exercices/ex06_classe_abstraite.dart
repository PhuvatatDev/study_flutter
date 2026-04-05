abstract class Animal {
  final String name;

  Animal({required this.name});

  String cri();
}

class Chat extends Animal {
  Chat(String name) : super(name: name);

  @override
  String cri() {
    return 'Miao!';
  }
}
