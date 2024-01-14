import 'package:flutter/material.dart';

final List<Headphone> headphones = [
  Headphone(
    image: 'assets/images/image-2.png',
    name: 'QuickComfort 35 wireless headphones II',
    price: '\$449.9',
    availableColors: [
      Colors.grey,
      Colors.yellow,
      Colors.redAccent,
    ],
    id: 1,
  ),
  Headphone(
    image: 'assets/images/image-4.png',
    name: 'Soundlink aroundear  wireless headphone',
    price: '\$269.9',
    availableColors: [
      Colors.grey,
      Colors.yellow,
      Colors.redAccent,
    ],
    id: 2,
  ),
  Headphone(
    image: 'assets/images/image-1.png',
    name: 'Bose on-ear wireless headphones',
    price: '\$209.99',
    availableColors: [
      Colors.grey,
      Colors.blue,
    ],
    id: 3,
  ),
  Headphone(
    image: 'assets/images/image-3.png',
    name: 'Bose Noise Cancelling  headphone 700',
    price: 'Coming Soon',
    availableColors: [
      Colors.grey,
      Colors.green,
      Colors.black,
    ],
    id: 4,
  ),
];

class Headphone {
  final int id;
  final String image;
  final String price;
  final String name;

  final List<Color> availableColors;

  Headphone({
    required this.image,
    required this.id,
    required this.price,
    required this.name,
    required this.availableColors,
  });
}
