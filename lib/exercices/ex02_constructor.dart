// ignore_for_file: avoid_print

class Car {
  final String brand;
  final int year;
  final String color;

  Car({required this.brand, required this.year, this.color = 'black'});

  String describe() {
    return '$brand, $year, $color';
  }
}

void main() {
  final myCar = Car(brand: 'Toyota', year: 2020, color: 'red');
  final myFreindCar = Car(brand: 'Nissan', year: 2024);

  
  print(myCar.describe());
  print(myFreindCar.describe());
}
