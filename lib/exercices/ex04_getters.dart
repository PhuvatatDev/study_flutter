// ignore_for_file: avoid_print

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final double priceHT;
  final double taxRate;

  const Product(
      {required this.name, required this.priceHT, required this.taxRate});

  double get priceTTC => priceHT*(1 + taxRate);
  String get description => "$name : $priceTTC£ TTC";    

  @override
  List<Object?> get props => [
        name,
        priceHT,
        taxRate,
      ];
}


void main(){
  const myProduct = Product(name: 'orange', priceHT: 1.30, taxRate: 0.20);

  print(myProduct.description);
  print(myProduct.priceTTC);


}